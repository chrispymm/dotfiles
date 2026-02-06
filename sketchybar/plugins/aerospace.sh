#!/usr/bin/env bash

CONFIG_DIR="/Users/chris.pymm/.config/sketchybar"

source "$CONFIG_DIR/colors.sh" # Loads all defined colors
source "$CONFIG_DIR/workspaces.sh"



APP=${workspace_apps[$1]}
BADGE="$(lsappinfo -all info -only StatusLabel $APP | sed -nr "s/\"StatusLabel\"=\{ \"label\"=\"(.+)\" \}$/\1/p")"

if [ $BADGE = '']; then
  LABEL_COLOR=$ACCENT_COLOR
  ICON_COLOR=$ACCENT_COLOR
  BG_COLOR=$ACCENT_COLOR
else
  LABEL_COLOR=$NOTIFICATION_COLOR
  ICON_COLOR=$NOTIFICATION_COLOR
  BG_COLOR=$NOTIFICATION_COLOR
fi

current_workspace=$(aerospace list-workspaces --focused)

if [ "$SENDER" = "routine" ];
then
      target="${NAME#*.}"
fi

if [ "$1" = "$FOCUSED_WORKSPACE" ] || [ "$target" = "$current_workspace" ]; 
then
  sketchybar --set $NAME background.drawing=on \
                         background.color=$BG_COLOR \
                         label.color=$BAR_COLOR \
                         icon.color=$BAR_COLOR \
                         label="$BADGE"    
else
  sketchybar --set $NAME background.drawing=off \
                         label.color=$LABEL_COLOR \
                         icon.color=$ICON_COLOR  \
                         label="$BADGE"    
fi

