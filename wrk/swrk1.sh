#!/bin/bash

function wait_text {
 local pane="$1"
 local text="$2"
 while :; do
  tmux capture-pane -t "$pane" -p | grep "$text" > /dev/null && return 0
  sleep 0.25
  done
 return -1
}

ip1=$1
ip2=$2
con=$3
touch output.csv
session=nick
window=${session}:0
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c$con -d30s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c$con -d30s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')" 
echo "$OUTPUT1,$OUTPUT2"
STRING="$con,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1

