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
s=$3
session=nick
window=${session}:0
pane=${window}.4
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
pane=${window}.5
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 4 -p 1001" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip1 -A 2 -p 1 -P 1 -M $s" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "iperf3 -c $ip2 -A 4 -p 1001 -P 1 -M $s" Enter
pane=${window}.1
wait_text $pane "iperf Done."
pane=${window}.2
wait_text $pane "iperf Done."
pane=${window}.1
OUTPUT1="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $7 }')"
pane=${window}.2
OUTPUT2="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $7 }')"
OUTPUT="$(echo $OUTPUT1+$OUTPUT2 | bc)"
STRING="$s,1,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.4
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
pane=${window}.5
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 4 -p 1001" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip1 -A 2 -p 1 -P 2 -M $s" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "iperf3 -c $ip2 -A 4 -p 1001 -P 2 -M $s" Enter
pane=${window}.1
wait_text $pane "iperf Done."
pane=${window}.2
wait_text $pane "iperf Done."
pane=${window}.1
OUTPUT1="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
pane=${window}.2
OUTPUT2="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
OUTPUT="$(echo $OUTPUT1+$OUTPUT2 | bc)"
STRING="$s,2,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
#read -p "wait"
pane=${window}.4
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
pane=${window}.5
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 4 -p 1001" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip1 -A 2 -p 1 -P 4 -M $s" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "iperf3 -c $ip2 -A 4 -p 1001 -P 4 -M $s" Enter
pane=${window}.1
wait_text $pane "iperf Done."
pane=${window}.2
wait_text $pane "iperf Done."
pane=${window}.1
OUTPUT1="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
pane=${window}.2
OUTPUT2="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
OUTPUT="$(echo $OUTPUT1+$OUTPUT2 | bc)"
STRING="$s,4,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.4
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
pane=${window}.5
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 4 -p 1001" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip1 -A 2 -p 1 -P 8 -M $s" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "iperf3 -c $ip2 -A 4 -p 1001 -P 8 -M $s" Enter
pane=${window}.1
wait_text $pane "iperf Done."
pane=${window}.2
wait_text $pane "iperf Done."
pane=${window}.1
OUTPUT1="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
pane=${window}.2
OUTPUT2="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
OUTPUT="$(echo $OUTPUT1+$OUTPUT2 | bc)"
STRING="$s,8,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.4
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
pane=${window}.5
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 4 -p 1001" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip1 -A 2 -p 1 -P 16 -M $s" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "iperf3 -c $ip2 -A 4 -p 1001 -P 16 -M $s" Enter
pane=${window}.1
wait_text $pane "iperf Done."
pane=${window}.2
wait_text $pane "iperf Done."
pane=${window}.1
OUTPUT1="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
pane=${window}.2
OUTPUT2="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
OUTPUT="$(echo $OUTPUT1+$OUTPUT2 | bc)"
STRING="$s,16,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.4
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
pane=${window}.5
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 4 -p 1001" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip1 -A 2 -p 1 -P 32 -M $s" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "iperf3 -c $ip2 -A 4 -p 1001 -P 32 -M $s" Enter
pane=${window}.1
wait_text $pane "iperf Done."
pane=${window}.2
wait_text $pane "iperf Done."
pane=${window}.1
OUTPUT1="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
pane=${window}.2
OUTPUT2="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
OUTPUT="$(echo $OUTPUT1+$OUTPUT2 | bc)"
STRING="$s,32,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"
sleep 1
pane=${window}.4
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 2 -p 1" Enter
pane=${window}.5
#tmux send-keys -t "$pane" C-z "iperf3 -s -A 4 -p 1001" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "clear" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "clear" Enter
sleep 1
pane=${window}.1
tmux send-keys -t "$pane" C-z "iperf3 -c $ip1 -A 2 -p 1 -P 64 -M $s" Enter
pane=${window}.2
tmux send-keys -t "$pane" C-z "iperf3 -c $ip2 -A 4 -p 1001 -P 64 -M $s" Enter
pane=${window}.1
wait_text $pane "iperf Done."
pane=${window}.2
wait_text $pane "iperf Done."
pane=${window}.1
OUTPUT1="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
pane=${window}.2
OUTPUT2="$(tmux capture-pane -J -p -t $pane | tail -4 | head -1 | awk '{ print $6 }')"
OUTPUT="$(echo $OUTPUT1+$OUTPUT2 | bc)"
STRING="$s,64,$OUTPUT"
echo "$STRING" >> output.csv
echo "$STRING"

