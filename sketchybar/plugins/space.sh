#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

SPACE_APPS=('Alacritty' 'Firefox' 'Google Chrome' 'Slack' 'Mail' 'Figma' 'Notes' 'Music' '')
APP=${SPACE_APPS[$SID-1]}
BADGE="$(lsappinfo -all info -only StatusLabel $APP | sed -nr 's/\"StatusLabel\"=\{ \"label\"=\"(.+)\" \}$/\1/p')"
LABEL=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$APP") $BADGE"

if [ $BADGE = '']; then
  LABEL_COLOR=$ACCENT_COLOR
else
  LABEL_COLOR=$NOTIFICATION_COLOR
fi

if [ $SELECTED = true ]; then
  sketchybar --set $NAME background.drawing=on \
                         background.color=$ACCENT_COLOR \
                         label.color=$BAR_COLOR \
                         icon.color=$BAR_COLOR \
                         label="$LABEL"    

else
  sketchybar --set $NAME background.drawing=off \
                         label.color=$LABEL_COLOR \
                         icon.color=$ACCENT_COLOR  \
                         label="$LABEL"    
fi
