#!/usr/bin/env sh
# mise/tasks/kill-ports.sh
# Free ports 8080 and 3000 before starting services
for port in 8080 3000; do
  pid=$(lsof -ti:$port 2>/dev/null)
  if [ -n "$pid" ]; then
    kill -9 $pid 2>/dev/null && echo "✓ Killed process on :$port (pid $pid)"
  fi
done
