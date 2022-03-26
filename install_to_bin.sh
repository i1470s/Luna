#!/bin/bash
echo "[i] We will now install Luna to your bin path..."
if [ -d "/usr/share/Luna" ] ; then
    echo "[i] Found an old version of Luna, proceeding to update..."
    echo "[i] Backing up old verison."
    if [ -d "/usr/share/Luna/Backup" ] ; then
        sudo mv /usr/share/Luna/Backup ./Backup
    else
        mkdir ./Backup
    fi
    name="./Backup/Luna"
    if [ -d $name ] ; then
        i=0
        while [ -d "$name.bak$i" ] ; do
            let i++
        done
            name="$name.bak$i"
    fi
    sudo mv /usr/share/Luna $name
    mv ./Backup ./Luna/
    sudo cp -ar ./Luna /usr/share/
    echo "[i] Installation sucessful."
    echo "[i] Making Luna executable..."
    sudo mv /usr/share/Luna/main.py /usr/share/Luna/luna
    sudo chmod +x /usr/share/Luna/luna
    sudo ln -s /usr/share/Luna/luna /usr/bin/luna || echo "[i] Link already seems to exist."
else
    sudo cp -ar ./Luna /usr/share/
    echo "[i] Installation sucessful."
    echo "[i] Making Luna executable..."
    sudo mv /usr/share/Luna/main.py /usr/share/Luna/luna
    sudo chmod +x /usr/share/Luna/luna
    sudo ln -s /usr/share/Luna/luna /usr/bin/luna || echo "[i] Link already seems to exist."
fi

echo "[i] You can delete the Luna folder now."
echo "----------------------------------------"
echo "[i] Run 'sudo luna' to start Luna."
echo "----------------------------------------"
exit 0