#!/bin/bash

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${HERE}

source tmux-start-session.sh

tmux new-session -d -s main
tmux send-keys -t "main" "cd $WORKSPACE; clear" C-m

tmux_start_session dotfiles
tmux_start_session machine_setup

tmux attach-session -t main
# tmux kill-session -t main
