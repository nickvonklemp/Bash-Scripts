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
touch output.csv
session=nick
window=${session}:0
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c10 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c10 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')" 
echo "$OUTPUT1,$OUTPUT2"
STRING="10,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c500 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c500 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="500,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c1000 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c1000 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="1000,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c2000 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c2000 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="2000,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c3000 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c3000 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="3000,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c4000 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c4000 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="4000,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c5000 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c5000 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="5000,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c6000 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c6000 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="6000,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c10000 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c10000 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="10000,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c20000 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c20000 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="20000,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c30000 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c30000 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="30000,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c40000 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c40000 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="40000,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c60000 -d120s -R700000 http://$ip1/1mb.bin" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "./wrk2/wrk -t6 -c60000 -d120s -R700000 http://$ip2/1mb.bin" Enter
sleep 1
wait_text $pane "Transfer/sec:."
OUTPUT1="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
pane=${window}.1
OUTPUT2="$(tmux capture-pane -J -p -t $pane | grep -i 'Transfer/sec:' | awk '{ print $2 }' | tr -d 'mbGB')"
echo "$OUTPUT1,$OUTPUT2"
STRING="60000,$OUTPUT1,$OUTPUT2"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1

