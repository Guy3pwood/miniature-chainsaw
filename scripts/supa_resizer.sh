#!/bin/sh

ACTIVE_WINDOW=`xdotool getactivewindow`
EXTENTS=$(xprop _NET_FRAME_EXTENTS -id "$ACTIVE_WINDOW")
BL=$(echo $EXTENTS | cut -d ',' -f 1 | cut -d ',' -f 1 | cut -d ' ' -f 3) # width of left border
BR=$(echo $EXTENTS | cut -d ',' -f 2) # width of right border
BT=$(echo $EXTENTS | cut -d ',' -f 3)  # height of title bar
BB=$(echo $EXTENTS | cut -d ',' -f 4) # height of bottom border

PANEL_HEIGHT=32
DECORATION_HEIGHT=28
#DECORATION_HEIGHT=`expr $BT + $BB`

TEMP=`expr 2160 - $PANEL_HEIGHT`
TEMP=`expr $TEMP \* $5`
WINDOW_HEIGHT=`expr $TEMP / $1 - $DECORATION_HEIGHT`
WINDOW_WIDTH=`expr 3840 \* $6 / $2`

TEMP=`expr 2160 - $PANEL_HEIGHT`
CELL_HEIGHT=`expr $TEMP / $1 - $DECORATION_HEIGHT`
CELL_WIDTH=`expr 3840 / $2`
WINDOW_Y=`expr $3 \* $CELL_HEIGHT + $3 \* $DECORATION_HEIGHT`
WINDOW_X=`expr $4 \* $CELL_WIDTH`
echo $WINDOW_X
echo $WINDOW_Y
echo $WINDOW_WIDTH
echo $WINDOW_HEIGHT
wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz && wmctrl -r :ACTIVE: -e 0,$WINDOW_X,$WINDOW_Y,$WINDOW_WIDTH,$WINDOW_HEIGHT
#wmctrl -r :ACTIVE: -e 0,$WINDOW_X,$WINDOW_Y,$WINDOW_WIDTH,$WINDOW_HEIGHT
