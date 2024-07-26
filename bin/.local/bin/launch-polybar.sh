#!/usr/bin/env sh

# Terminate current instance
pkill polybar

# Wait until all processes have been shut down
# while pgrep -x polybar >/dev/null; do sleep 1; done

# polybar top &


polybar top 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
