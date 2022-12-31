#!/bin/bash

echo "do you need to use a diffrent domain name for your tunnel (y/n)?"
read balls
##code go brrt
if [[ $balls == "y" ]]; then
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
       echo "tunnel is up and running!"

## same code just slightly diffrent

else
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
       echo "tunnel is up and running!"
fi