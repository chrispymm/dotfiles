#!/bin/bash

SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)
SPACE_APPS=('Alacritty' 'Firefox' 'Google Chrome' 'Slack' 'Mail' 'Figma' 'Notes' 'Music' '')

for i in "${!SPACE_SIDS[@]}"
do
  SID=${SPACE_SIDS[$i]}
  APP=${SPACE_APPS[$i]}

BADGE="$(lsappinfo -all info -only StatusLabel $APP | sed -nr 's/\"StatusLabel\"=\{ \"label\"=\"(.+)\" \}$/\1/p')"

  sketchybar --add space space.$SID left                                                    \
             --set space.$SID space=$SID                                                    \
                              icon=$SID                                                     \
                              label.font="sketchybar-app-font:Regular:16.0"                 \
                              label.padding_right=20                                        \
                              label.y_offset=-1                                             \
                              label=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$APP") $BADGE"    \
                              script="$PLUGIN_DIR/space.sh"                                 \
                              update_freq="5"                                              \
                              click_script="~/bin/switchdesktop $SID"                       \


done


