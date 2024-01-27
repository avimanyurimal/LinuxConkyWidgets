conky.config = {
    background = true,
    update_interval = 1,
    double_buffer = true,
    no_buffers = true,
    imlib_cache_size = 10,
    draw_shades = false,
    draw_outline = false,
    draw_borders = false,
    gap_x = 100,
    gap_y = 64,
    alignment = "bottom_right",
    minimum_height = 300,
    minimum_width = 0,
    own_window = true,
    own_window_type = "dock",
    own_window_transparent = true,
    own_window_hints = "undecorated,below,sticky,skip_taskbar,skip_pager",
    own_window_argb_visual = true,
    own_window_argb_value = 0,
    use_xft = true,
    xftalpha = 1,
    font = "Droid Sans:size=10",
    text_buffer_size = 256,
    override_utf8_locale = true,
    default_color = '#D8DEE9',
    color0 = '#D8DEE9',
    color1 = '#D8DEE9',
}

conky.text = [[
${font Product Sans:weight=Bold:size=34}${color0}${time %I:%M:%S}${font Product Sans:weight=Bold:size=15}${color0}${time %p}
${font Product Sans:weight=Bold:size=20}${color0}${time %A, %d %B, %Y}
${font Product Sans:weight=Bold:size=15}${color0}RAM usage: ${mem}/${memmax}
${font Product Sans:weight=Bold:size=15}${color0}CPU usage: ${cpu cpu0}%
${voffset -2}${font Product Sans:weight=Bold:size=15}${color0}Root: ${fs_used /}/${fs_size /}
${font Product Sans:weight=Bold:size=15}${color0}Home: ${fs_used /home}/${fs_size /home}
${font Product Sans:weight=Bold:size=15}${color0}GPU usage: ${exec nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader}
${font Product Sans:weight=Bold:size=15}${color0}GPU Memory: ${exec nvidia-smi --query-gpu=memory.used --format=csv,noheader} / ${exec nvidia-smi --query-gpu=memory.total --format=csv,noheader}
${font Product Sans:weight=Bold:size=15}${color0}GPU Memory (Total): ${exec nvidia-smi --query-gpu=memory.total --format=csv,noheader | awk '{printf "%.2f GiB", $1/1024}'}
${font Product Sans:weight=Bold:size=15}${color0}GPU Temperature: ${execi 2 nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader}°C
${font Product Sans:weight=Bold:size=15}${color0}CPU Temperature: ${exec sensors | grep 'Tctl' | awk '{print ($2 == "" ? "N/A" : $2)}'}
${font Product Sans:weight=Bold:size=15}${color0}Battery: ${exec upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "percentage" | awk '{print $2}'} ${exec upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "state" | awk '{print $2}'}
${font Product Sans:weight=Bold:size=15}${color0}Weather: ${execi 1800 curl -s "http://api.openweathermap.org/data/2.5/weather?q=Kathmandu&appid=a71e3962f457fb2a5b1fb49bc530cf6c&units=metric" | jq -r '.main.temp' | awk '{print $1 "°C"}'} ${execi 1800 curl -s "http://api.openweathermap.org/data/2.5/weather?q=Kathmandu&appid=a71e3962f457fb2a5b1fb49bc530cf6c&units=metric" | jq -r '.weather[0].description' | tr -d '\n'} 
${font Product Sans:weight=Bold:size=15}${color0}Humidity: ${execi 1800 curl -s "http://api.openweathermap.org/data/2.5/weather?q=Kathmandu&appid=a71e3962f457fb2a5b1fb49bc530cf6c&units=metric" | jq -r '.main.humidity' | awk '{print $1 "%"}'}
${font Product Sans:weight=Bold:size=15}${color0}Wind Speed: ${execi 1800 curl -s "http://api.openweathermap.org/data/2.5/weather?q=Kathmandu&appid=a71e3962f457fb2a5b1fb49bc530cf6c&units=metric" | jq -r '.wind.speed' | awk '{print $1 "m/s"}'}
${font Product Sans:weight=Bold:size=15}${color0}Network: Down: ${downspeed wlan0}
${font Product Sans:weight=Bold:size=15}${color0}Local IP: ${execi 600 ip addr show dev wlan0 | grep "inet " | awk '{print $2}' | cut -d'/' -f1}
${font Product Sans:weight=Bold:size=15}${color0}Owner: Avimanyu Rimal
]]


