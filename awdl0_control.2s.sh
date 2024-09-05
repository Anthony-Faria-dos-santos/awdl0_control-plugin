#!/bin/bash

# Utiliser la variable d'environnement SWIFTBAR_PLUGIN_PATH pour obtenir le chemin du script
if [ -z "$SWIFTBAR_PLUGIN_PATH" ]; then
    SCRIPT_PATH="/Users/antodev/swiftbar/awdl0_control.2s.sh"  # Remplace par le chemin réel si nécessaire
else
    SCRIPT_PATH="$SWIFTBAR_PLUGIN_PATH"
fi

# Mode de test pour simuler un problème de changement d'état d'AWDL0
TEST_MODE=0  # Mettre à 1 pour activer le mode de test

# Fonction pour afficher une boîte de dialogue avec AppleScript
ask_restart_wifi() {
    osascript <<EOT
    set theAnswer to button returned of (display dialog "L'état d'AWDL0 n'a pas pu être changé. Voulez-vous redémarrer les services Wi-Fi ?" buttons {"Non", "Oui"} default button "Oui")
    return theAnswer
EOT
}

# Fonction pour redémarrer le Wi-Fi avec une temporisation
restart_wifi() {
    echo "Redémarrage du Wi-Fi..."
    networksetup -setairportpower en0 off
    sleep 3  # Temporisation de 3 secondes
    networksetup -setairportpower en0 on
    echo "Wi-Fi redémarré."
}

# Si un paramètre "toggle" est passé, cela signifie que l'utilisateur a cliqué sur le plugin
if [ "$1" = "toggle" ]; then
    # Vérifier l'état actuel d'AWDL0 avant la tentative de bascule
    initial_status=$(ifconfig awdl0 | grep -q "status: active" && echo "active" || echo "inactive")

    # Tenter de basculer l'état d'AWDL0
    if [ "$initial_status" = "active" ]; then
        echo "Désactivation de l'AWDL0..."
        sudo /sbin/ifconfig awdl0 down
    else
        echo "Activation de l'AWDL0..."
        sudo /sbin/ifconfig awdl0 up
    fi

    # Simuler un problème de changement d'état si le mode de test est activé
    if [ $TEST_MODE -eq 1 ]; then
        echo "Mode de test activé : l'état d'AWDL0 ne change pas."
        new_status="$initial_status"  # Simuler aucun changement d'état
    else
        # Vérifier l'état d'AWDL0 après la tentative de bascule
        new_status=$(ifconfig awdl0 | grep -q "status: active" && echo "active" || echo "inactive")
    fi

    # Si l'état n'a pas changé
    if [ "$initial_status" = "$new_status" ]; then
        echo "L'état d'AWDL0 n'a pas changé."
        
        # Afficher une boîte de dialogue pour proposer de redémarrer le Wi-Fi
        user_response=$(ask_restart_wifi)

        # Si l'utilisateur choisit "Oui", redémarrer le Wi-Fi
        if [ "$user_response" = "Oui" ]; then
            restart_wifi
        else
            echo "Opération annulée par l'utilisateur."
            exit 0
        fi
    fi

    exit 0
fi

# Vérifier l'état de l'interface AWDL0 pour l'affichage
if ifconfig awdl0 | grep -q "status: active"; then
    echo "AWDL0: ✅ | bash='$SCRIPT_PATH' param1=toggle terminal=false refresh=true"
else
    echo "AWDL0: ❌ | bash='$SCRIPT_PATH' param1=toggle terminal=false refresh=true"
fi