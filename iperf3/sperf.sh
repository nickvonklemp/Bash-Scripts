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
touch output.csv
ip=$1
s=$2
session=nick2
window=${session}:0
pane=${window}.4
tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
sleep 1
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 1 -M $s" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $7 }')"
STRING="$s,1,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.4
tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
sleep 1
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 2 -M $s" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,2,$OUTPUT"
echo "$STRING"
echo "$STRING" >> output.csv
sleep 1
pane=${window}.4
tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 4 -M $s" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,4,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.4
tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M $s" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,8,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.4
tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 16 -M $s" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,16,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.4
tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
sleep 1
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 32 -M $s" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,32,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.4
tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 64 -M $s" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,64,$OUTPUT"
echo "$STRING" >> output.csv
#read -p "wait"


