1. Install Slack CLI https://github.com/rockymadden/slack-cli

Note: 

`slack status get` and expiration parameter are added on my fork of slack-cli

Also, you can call the script with a cron. 

```sh
PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin

* * * * * /Users/path/to/script/slack-status.sh
* * * * * sleep 15 && /Users/path/to/script/slack-status.sh
* * * * * sleep 30 && /Users/path/to/script/slack-status.sh
* * * * * sleep 45 && /Users/path/to/script/slack-status.sh
```
