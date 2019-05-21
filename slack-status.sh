SLACK_CLI_TOKEN=

if pgrep -xq -- "Slack"; then if pgrep -xq -- "iTunes"; then
  status=`slack status get`
  statusEmoji=`jq .profile.status_emoji <<< $status`
  statusText=`jq .profile.status_text <<< $status`
  if [[ $statusEmoji = "\":musical_note:\"" || "$statusText" = "\"\"" ]] ; then
    songStatus=`osascript -e 'tell application "iTunes" to player state as string'`
    if [ $songStatus = "playing" ] ; then
      artist=`osascript -e 'tell application "iTunes" to artist of current track as string'`
      track=`osascript -e 'tell application "iTunes" to name of current track as string'`;
      slack status edit --text "$track by $artist" --emoji :musical_note: --expiration $(date -v "+30M" +"%s")
    else
      slack status clear
    fi
  fi
fi fi
