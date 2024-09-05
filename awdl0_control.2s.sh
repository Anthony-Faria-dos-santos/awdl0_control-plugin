#!/bin/bash

# Utiliser la variable d'environnement SWIFTBAR_PLUGIN_PATH pour obtenir le chemin du script
SCRIPT_PATH="$SWIFTBAR_PLUGIN_PATH"

# Si un paramètre "toggle" est passé, cela signifie que l'utilisateur a cliqué sur le plugin
if [ "$1" = "toggle" ]; then
    # Vérifier l'état actuel d'AWDL0 et basculer l'état
    if /sbin/ifconfig awdl0 | grep -q "status: active"; then
        # Si actif, désactiver
        sudo /sbin/ifconfig awdl0 down
    else
        # Si inactif, activer
        sudo /sbin/ifconfig awdl0 up
    fi
    exit 0
fi

# Vérifier l'état de l'interface AWDL0 pour l'affichage
if /sbin/ifconfig awdl0 | grep -q "status: active"; then
    # Si actif, afficher ✅ avec une action pour basculer
    echo "AWDL0: ✅ | bash='$SCRIPT_PATH' param1=toggle terminal=false refresh=true"
else
    # Si inactif, afficher ❌ avec une action pour basculer
    echo "AWDL0: ❌ | bash='$SCRIPT_PATH' param1=toggle terminal=false refresh=true"
fi