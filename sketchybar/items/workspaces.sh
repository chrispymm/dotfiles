#!/usr/bin/env bash

source "$CONFIG_DIR/workspaces.sh"

# Handle workspace changes
sketchybar --add event aerospace_workspace_change 

# for sid in $(aerospace list-workspaces --all); do
for sid in "${workspace_ids[@]}"; do
    APP="${workspace_apps[$sid]}"

    BADGE="$(lsappinfo -all info -only StatusLabel $APP | sed -nr "s/\"StatusLabel\"=\{ \"label\"=\"(.+)\" \}$/\1/p")"
    ICON=" $($PLUGIN_DIR/icon_map_fn.sh "$APP")"
if [ $BADGE = '']; then
  LABEL_PADDING=4
else
  LABEL_PADDING=8
fi

    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        icon.font="sketchybar-app-font:Regular:16.0"                 \
        icon="$ICON"     \
        width="dynamic" \
        label="$BADGE"    \
        label.y_offset=1                                             \
        label.padding_right=$LABEL_PADDING  \
        click_script="aerospace workspace $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid" \
        update_freq=30
done

