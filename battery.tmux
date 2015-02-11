#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

battery_percentage="#[fg=colour249,bg=colour237,nobold,nounderscore,noitalics] bat #[fg=colour6,bg=colour1]#($CURRENT_DIR/scripts/battery_charge.sh r)#[fg=colour236,bg=colour235]#($CURRENT_DIR/scripts/battery_charge.sh c)#[fg=colour249,bg=colour237] #($CURRENT_DIR/scripts/battery_charge.sh d) | "

get_tmux_option() {
    local option="$1"
    local option_value="$(tmux show-option -gqv "$option")"
    echo "$option_value"
}

set_tmux_option() {
    local option=$1
    local value=$2
    tmux set-option -gq "$option" "$value"
}

contat_tmux_options() {
    local string=$1
    local final_option="$battery_percentage $string"
    echo $final_option
}

update_tmux_option() {
    local option=$1
    local option_value=$(get_tmux_option "$option")
    local new_option_value=$(contat_tmux_options "$option_value")
    set_tmux_option "$option" "$new_option_value"
    echo $option_value
}

main() {
    update_tmux_option "status-right"
}

main
