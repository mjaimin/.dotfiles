xrandr --newmode "1536x864_60.00"  109.25  1536 1624 1784 2032  864 867 872 897 -hsync +vsync
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --newmode "2048x1152_60.00"  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync

xrandr --addmode eDP-1 "1536x864_60.00"
xrandr --addmode eDP-1 "1920x1080_60.00"
xrandr --addmode eDP-1 "2048x1152_60.00"
