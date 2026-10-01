#!/bin/sh
# Track agent state for the tmux window containing this pane.
# Usage: agent-status.sh on|done|off
#   on   agent started working (window turns blue, clears "needs review")
#   done agent finished; window turns green unless you're already looking at it
#   off  clear all agent state (e.g. session ended)
# Any agent (Claude Code, pi, etc.) can call this from its own hooks.
# The "needs review" flag is cleared by tmux hooks in ~/.tmux.conf when you
# switch to the window.
[ -n "$TMUX" ] && [ -n "$TMUX_PANE" ] || exit 0

case "$1" in
  on)
    tmux set-option -w -t "$TMUX_PANE" @agent_working 1
    tmux set-option -w -t "$TMUX_PANE" -u @agent_done
    ;;
  done)
    tmux set-option -w -t "$TMUX_PANE" -u @agent_working
    watching=$(tmux display-message -p -t "$TMUX_PANE" '#{&&:#{window_active},#{session_attached}}')
    [ "$watching" = "1" ] || tmux set-option -w -t "$TMUX_PANE" @agent_done 1
    ;;
  off)
    tmux set-option -w -t "$TMUX_PANE" -u @agent_working
    tmux set-option -w -t "$TMUX_PANE" -u @agent_done
    ;;
esac
exit 0
