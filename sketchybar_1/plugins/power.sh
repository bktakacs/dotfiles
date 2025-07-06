#!/bin/bash

# ~/.config/sketchybar/plugins/power.sh

# Get power metrics using powermetrics (requires sudo access)
# Alternative: Use system_profiler or iostat for CPU-based estimation

# Method 1: Using powermetrics (more accurate but requires sudo)
get_power_metrics() {
    # Run powermetrics for 1 second and extract power info
    sudo powermetrics -i 1000 -n 1 --samplers cpu_power 2>/dev/null | \
    grep -E "CPU Power|Package Power" | \
    head -1 | \
    awk '{print $3}' | \
    sed 's/mW//'
}

# Method 2: CPU-based estimation (no sudo required)
get_cpu_power_estimate() {
    # Get CPU usage percentage
    cpu_percent=$(top -l 1 | grep "CPU usage" | awk '{print $3}' | sed 's/%//')
    
    # Estimate power based on CPU usage (rough estimation)
    # Mac mini M1: ~7W idle, ~20W full load
    # Mac mini Intel: ~10W idle, ~40W full load
    
    # Detect if M1/M2 or Intel
    if system_profiler SPHardwareDataType | grep -q "Apple"; then
        # Apple Silicon estimation
        idle_power=7
        max_power=20
    else
        # Intel estimation  
        idle_power=10
        max_power=40
    fi
    
    # Calculate estimated power
    power_range=$((max_power - idle_power))
    estimated_power=$(echo "scale=1; $idle_power + ($cpu_percent * $power_range / 100)" | bc)
    echo $estimated_power
}

# Method 3: Using iostat for CPU load
get_iostat_power_estimate() {
    # Get CPU usage from iostat
    cpu_usage=$(iostat -c 1 | tail -1 | awk '{print 100-$6}')
    
    # Same estimation logic as above
    if system_profiler SPHardwareDataType | grep -q "Apple"; then
        idle_power=7
        max_power=20
    else
        idle_power=10
        max_power=40
    fi
    
    power_range=$((max_power - idle_power))
    estimated_power=$(echo "scale=1; $idle_power + ($cpu_usage * $power_range / 100)" | bc)
    echo $estimated_power
}

# Choose method based on availability
if command -v bc >/dev/null 2>&1; then
    # Try powermetrics first (most accurate)
    if sudo -n powermetrics -h >/dev/null 2>&1; then
        power=$(get_power_metrics)
        method="actual"
    else
        # Fall back to CPU estimation
        power=$(get_cpu_power_estimate)
        method="estimated"
    fi
else
    # If bc is not available, use a simpler method
    cpu_percent=$(top -l 1 | grep "CPU usage" | awk '{print $3}' | sed 's/%//')
    power=$(echo "$cpu_percent * 0.2 + 7" | awk '{print $1}')  # Simple estimation
    method="simple"
fi

# Format the output
if [ "$method" = "actual" ]; then
    icon="⚡"
    power_display="${power}W"
else
    icon="􀫮"
    power_display="~${power}W"
fi

# Update SketchyBar
sketchybar --set power label="$icon $power_display"