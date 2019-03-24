#!/bin/bash

echo "Inserisci la password amministratore!!"
stty -echo
echo "Password: "
read  sudopswd
stty echo

echo "${sudopswd}" | sudo -S apt-get -y install chromium-browser

rm /home/$USER/.config/lxsession/Lubuntu/autostart
echo "chromium-browser https://jitsi.19.coop/$USER --start-fullscreen --kiosk --no-first-run --fast --fast-start --disable-infobars" >> /home/$USER/.config/lxsession/Lubuntu/autostart

echo "${sudopswd}" | sudo apt-get -y install software-properties-common
echo "${sudopswd}" | sudo -S add-apt-repository ppa:wireguard/wireguard
echo "${sudopswd}" | sudo apt-get -y install wireguard-dkms

reset
echo "Inserisci l'indirizzo IP della VPN (es. 10.0.0.2)"
read vpnip

cd /etc/wireguard
echo "${sudopswd}" | sudo -S chmod o+w .
echo "${sudopswd}" | sudo -S wg genkey | sudo -S tee privatekey | sudo -S wg pubkey > publickey

PUBLICKEY=`cat /etc/wireguard/publickey`

rm -f wg0.conf
echo "${sudopswd}" | sudo -S touch wg0.conf
echo "${sudopswd}" | sudo -S chmod o+w wg0.conf

PRIVATEKEY=`cat /etc/wireguard/privatekey`



echo "[Interface]" >> wg0.conf
echo "Address = $vpnip" >> wg0.conf
echo "PrivateKey = $PRIVATEKEY" >> wg0.conf
echo "ListenPort = 51820" >> wg0.conf

echo "[Peer]" >> wg0.conf
echo "PublicKey = XKVLQcNmKvK4u2E9ryizhPjginly96MBrWnC3nK22Q4=" >> wg0.conf
echo "Endpoint = 92.243.9.165:51820" >> wg0.conf
echo "AllowedIPs = 10.0.0.1/24" >> wg0.conf
echo "PersistentKeepalive = 25" >> wg0.conf

echo "${sudopswd}" | sudo -S chmod o-w wg0.conf
echo "${sudopswd}" | sudo -S chmod o-w .

cd /etc

rm -f rc.local
echo "${sudopswd}" | sudo -S touch rc.local
echo "${sudopswd}" | sudo -S chmod o+w rc.local

echo "#!/bin/sh" >> rc.local
echo "wg-quick up wg0" >> rc.local
echo "${sudopswd}" | sudo -S chmod +x rc.local
echo "${sudopswd}" | sudo -S chmod o-w rc.local

reset

echo "\e[92mL'installazione è stata conclusa con successo!!\e[0m"
echo "\e[96mÈ il momento di registrare l'utente sul portale Dipersona\e[0m"
echo "\e[95mVisita questo sito: \e[4mhttps://manage.dipersona.19.coop\e[24m e inserisci i seguenti dati\e[0m"
echo "Nome utente: $USER"
echo "Chiave pubblica: $PUBLICKEY"
