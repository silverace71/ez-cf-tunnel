#!/bin/bash

## grabbing stuff
    wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-x86_64.rpm
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
cat << EOF >> $tname.yaml
url: $indeed://$url/
tunnel: $tunnelid
credentials-file: $(sudo find / -type d -iname ".cloudflared" 2>/dev/null)/$tunnelid.json
EOF
## tunnel routeing
    echo "what subdomain do you want to give your tunnel?"
    read subdomain
    cloudflared tunnel route dns $tunnelid $subdomain
## running tunnel and cleanup
    cloudflared tunnel --config $(sudo find / -type d -iname ".cloudflared" 2>/dev/null)/$tname.yaml run
    wget https://raw.githubusercontent.com/silverace71/ez-cf-tunnel/main/cf-deb-amd64-end.sh
    sudo chmod +x cf-deb-amd64-end.sh
    echo "tunnel is up and running! use ./cd-deb-amd64-end.sh to create more tunnels on this system. (NOTE: if you want to make more tunnels on a diffrent machine run the original script)"