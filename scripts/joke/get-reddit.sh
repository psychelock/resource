#!/bin/sh
exec curl -s --connect-timeout 5 -A '/u/psychelock_' 'https:/www.reddit.com/r/showerthoughts/top.json?sort=top&t=month&limit=100' > ~/resources/scripts/joke/input-joke
