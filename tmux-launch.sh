#!/bin/bash

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${HERE}

source tmux-start-session.sh

tmux_start_session dotfiles
tmux_start_session machine_setup
tmux_start_session unibe_applied_optimization
tmux_start_session unifr_pattern_recognition
tmux_start_session unifr_pattern_recognition_group

tmux attach-session -t dotfiles
# tmux kill-session -t main
