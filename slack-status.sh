if pgrep -xq -- "Slack"; then
  if pgrep -xq -- "Spotify"; then
    player="Spotify"
  fi
  if pgrep -xq -- "Music"; then
    player="Music"
  fi
  if [[ $player ]]; then
    status=`slack status get`
    statusEmoji=`jq .profile.status_emoji <<< $status`
    statusText=`jq .profile.status_text <<< $status`
    if [[ $statusEmoji = "\":musical_note:\"" || "$statusText" = "\"\"" ]] ; then
      songStatus=`osascript -e "tell application \"$player\" to player state as string"`
      if [ $songStatus = "playing" ] ; then
        artist=`osascript -e "tell application \"$player\" to artist of current track as string"`
        track=`osascript -e "tell application \"$player\" to name of current track as string"`
        slack status edit --text "$track by $artist" --emoji :musical_note: --expiration $(date -v "+1M" +"%s")
      else
        slack status clear
      fi
    fi
  fi
fi
