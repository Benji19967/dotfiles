#!/bin/bash

session="housing"

tmux new-session -d -s $session

window=0
tmux rename-window -t $session:$window 'git'
tmux send-keys -t $session:$window 'cd $CODE_REPO/housing' C-m
tmux send-keys -t $session:$window 'source env/bin/activate' C-m
tmux send-keys -t $session:$window 'clear' C-m
