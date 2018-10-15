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
session=nick
window=${session}:0
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 88" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $7 }')"
STRING="$s,88,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 96" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,96,$OUTPUT"
echo "$STRING"
echo "$STRING" >> output.csv
sleep 1 
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 112" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,112,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 128" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,128,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 168" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,168,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 200" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,200,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 232" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,232,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 256" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,256,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 512" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,512,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 768" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,768,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 1024" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,1024,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip -A 2 -p 1 -P 8 -M 1518" Enter
sleep 2
wait_text $pane "iperf Done."
OUTPUT="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
STRING="$s,1518,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"


