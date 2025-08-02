# !/bin/bash

$ CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
$ CPU_INFO=$(ps -eo pcpu,user)
$ CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
$ CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
$ CPU_PERCENT="$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')"
$ 
$ sketchybar --set $NAME label="$CPU_PERCENT%"

CPU_PERCENT=$(top -l 1 | grep "CPU usage" | awk '{print $3 + $5}' | cut -d. -f1)
# | sed 's/%//' | cut -d. -f1)
sketchybar --set $NAME label="${CPU_PERCENT}%"
