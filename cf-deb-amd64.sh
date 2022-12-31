#!/bin/bash

## grabbing stuff
    wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
    sudo dpkg -i cloudflared-linux-amd64.deb
    cloudflared tunnel login
## naming and making tunnel
    echo "what do you wish to call your tunnel?"
    read tname
    cloudflared tunnel create $tname
    cloudflared tunnel list
## im too lazy to do this for you, so suffer
    echo "please copy and paste the id of your tunnel"
    read tunnelid
    cd -- "$(sudo find / -type d -iname ".cloudflared" 2>/dev/null)"
## don't mess up this part
    echo "what is the ip and port of your service? (E.g 10.0.0.1:420)"
    read url
    echo "are you using http or https?"
    read indeed
## config file
cat "$tname"_config.yaml
url: "$indeed"://"$url"
tunnel: "$tunnelid"
credentials-file: "$(sudo find / -type d -iname ".cloudflared" 2>/dev/null)"/"tunnelid".json
EOF
    echo "done!"