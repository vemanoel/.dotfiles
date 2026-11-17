#!/bin/sh

case $1 in
    home)
        exec foot
        ;;
    cwd)
        pid=$(swaymsg -t get_tree | python3 -c "
            import json, sys

            def find_focused(node):
                if node.get('focused'):
                    return node.get('pid')
                for child in node.get('nodes', []) + node.get('floating_nodes', []):
                    result = find_focused(child)
                    if result: return result
                return None

            print(find_focused(json.load(sys.stdin)) or '')
        ")

        if [ -n "$pid" ]; then
            child_pid=$(pgrep -P $pid | tail -n 1)
            target_pid=${child_pid:-$pid}
            cwd=$(readlink -f /proc/$target_pid/cwd 2>/dev/null)
        fi

        if [ -d "$cwd" ]; then
            exec foot --working-directory="$cwd"
        else
            exec foot
        fi
        ;;
esac
