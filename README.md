<details>  
  <summary>🇬🇧 Awdl0_control Plugin for SwiftBar </summary>

<br>
Awdl0_control is a **SwiftBar** plugin that allows you to **control the AWDL0 network interface** on macOS directly from the menu bar. AWDL (Apple Wireless Direct Link) is a technology used by macOS and iOS for peer-to-peer networking communications, such as **AirDrop**, **AirPlay**, and **Continuity** features between Apple devices.

### Plugin Features:
- The plugin visually displays the status of the **AWDL0 interface** as an icon in the menu bar (✅ for active and ❌ for inactive).
- The user can **click the icon** to toggle between enabling and disabling the **AWDL0** interface.
- The status of **AWDL0** is automatically refreshed every two seconds to reflect the current state.

### Why Disable AWDL0 for Online Gaming?
Disabling **AWDL0** before playing online games is recommended because the **AWDL0** interface can interfere with network performance. When active, the **AWDL0** interface may consume bandwidth or impact Wi-Fi performance, especially if services like AirDrop or AirPlay are running in the background. By disabling **AWDL0**, the user can:
- **Improve Wi-Fi stability and reduce latency**, which is crucial for online gaming that requires a stable and fast connection.
- **Minimize network interference** between macOS background services and the game.

In summary, the **awdl0_control** plugin simplifies the management of the **AWDL0** interface for users who need an **optimized connection** without interference, particularly in scenarios like online gaming where every millisecond of latency matters.

</details>

<details>
<summary>🇫🇷 Awdl0_control Plugin pour SwiftBar </summary>

<br>
Awdl0_control est un plugin pour **SwiftBar** qui permet de **contrôler l'interface réseau AWDL0** sur macOS directement depuis la barre de menus. AWDL (Apple Wireless Direct Link) est une technologie utilisée par macOS et iOS pour des communications réseau de pair à pair, comme **AirDrop**, **AirPlay** ou encore les fonctionnalités de **Continuité** entre appareils Apple.

### Fonctionnalités du Plugin :
- Le plugin affiche l'état de l'interface **AWDL0** sous forme d'icône dans la barre de menus (✅ pour actif et ❌ pour inactif).
- L'utilisateur peut **cliquer sur l'icône** pour basculer entre l'activation et la désactivation de l'interface **AWDL0**.
- Le statut de **AWDL0** est automatiquement rafraîchi toutes les deux secondes pour refléter son état actuel.

### Pourquoi Désactiver AWDL0 avant de Jouer en Ligne ?
Il est recommandé de désactiver **AWDL0** avant de jouer en ligne, car l'interface **AWDL0** peut interférer avec les performances réseau. Lorsqu'elle est active, l'interface **AWDL0** peut consommer de la bande passante ou affecter les performances Wi-Fi, notamment si des services comme AirDrop ou AirPlay fonctionnent en arrière-plan. En désactivant **AWDL0**, l'utilisateur peut :
- **Améliorer la stabilité du Wi-Fi et réduire la latence**, ce qui est crucial pour les jeux en ligne nécessitant une connexion stable et rapide.
- **Réduire les interférences réseau** entre les services réseau de macOS et le jeu.

En résumé, le plugin **awdl0_control** simplifie la gestion de l'interface **AWDL0** pour les utilisateurs qui ont besoin d'une **connexion optimisée** sans interférence, notamment dans des contextes comme les jeux en ligne où chaque milliseconde de latence compte.

</details>
<details>
<summary>🇬🇧 Installation of awdl0_control Plugin in SwiftBar for MacOS</summary>

### Step 1: Download and Install SwiftBar
If you haven't installed SwiftBar yet, follow these steps:
1. Download SwiftBar from the official repository: [SwiftBar GitHub](https://github.com/swiftbar/SwiftBar/releases).
2. Move the downloaded app to your **Applications** folder.
3. Launch SwiftBar from your Applications folder.

### Step 2: Install the awdl0_control Plugin

1. **Create the Plugins Directory:**
   - If this is your first time installing a SwiftBar plugin, you need to create a directory to store your plugins.
   - Open the terminal and run the following command to create a plugins directory:
     ```bash
     mkdir -p ~/swiftbar
     ```

2. **Move the Plugin Script:**
   - Download or copy the `awdl0_control.2s.sh` script to the newly created **swiftbar** directory:
     ```bash
     mv /path/to/awdl0_control.2s.sh ~/swiftbar/
     ```
   - Make sure the script is executable. Run the following command:
     ```bash
     chmod +x ~/swiftbar/awdl0_control.2s.sh
     ```

3. **Launch the Plugin:**
   - Open **SwiftBar** from your menu bar.
   - Navigate to **Preferences** and set the **Plugin Directory** to the folder you just created (`~/swiftbar`).
   - SwiftBar will automatically detect the `awdl0_control.2s.sh` plugin and add it to your menu bar.

4. **Verify Functionality:**
   - You should now see the AWDL0 status icon (✅ for active, ❌ for inactive) in your menu bar.
   - Click the icon to toggle the state of AWDL0, and the plugin will update its appearance to reflect the current state.

### Step 3: Configure Sudo Permissions

To allow the plugin to control AWDL0 without asking for a password every time, you need to configure `sudo` permissions:

1. Open the terminal and run:
   ```bash
   sudo visudo
   ```
2.	Add the following line to the end of the file, replacing your_username with your actual username:
  ```bash
  your_username ALL=(ALL) NOPASSWD: /sbin/ifconfig awdl0 up, /sbin/ifconfig awdl0 down
  ```
3.	Save and close the file.

After following these steps, the awdl0_control plugin should be fully functional in SwiftBar.

</details>
<details>
<summary>🇫🇷 Installation du plugin awdl0_control dans SwiftBar pour MacOS</summary>


### Étape 1 : Télécharger et installer SwiftBar
Si vous n'avez pas encore installé SwiftBar, suivez ces étapes :
1. Téléchargez SwiftBar depuis le dépôt officiel : [SwiftBar GitHub](https://github.com/swiftbar/SwiftBar/releases).
2. Déplacez l'application téléchargée dans votre dossier **Applications**.
3. Lancez SwiftBar depuis votre dossier **Applications**.

### Étape 2 : Installer le plugin awdl0_control

1. **Créer le répertoire des plugins :**
   - Si c'est la première fois que vous installez un plugin pour SwiftBar, vous devez créer un répertoire pour stocker vos plugins.
   - Ouvrez le terminal et exécutez la commande suivante pour créer le répertoire des plugins :
     ```bash
     mkdir -p ~/swiftbar
     ```

2. **Déplacer le script du plugin :**
   - Téléchargez ou copiez le script `awdl0_control.2s.sh` dans le répertoire **swiftbar** que vous venez de créer :
     ```bash
     mv /chemin/vers/awdl0_control.2s.sh ~/swiftbar/
     ```
   - Assurez-vous que le script est exécutable. Exécutez la commande suivante :
     ```bash
     chmod +x ~/swiftbar/awdl0_control.2s.sh
     ```

3. **Lancer le plugin :**
   - Ouvrez **SwiftBar** depuis votre barre de menus.
   - Allez dans **Préférences** et définissez le **répertoire des plugins** sur le dossier que vous venez de créer (`~/swiftbar`).
   - SwiftBar détectera automatiquement le plugin `awdl0_control.2s.sh` et l'ajoutera à votre barre de menus.

4. **Vérifier le fonctionnement :**
   - Vous devriez maintenant voir l'icône d'état d'AWDL0 (✅ pour actif, ❌ pour inactif) dans votre barre de menus.
   - Cliquez sur l'icône pour basculer l'état d'AWDL0, et le plugin mettra à jour son apparence pour refléter l'état actuel.

### Étape 3 : Configurer les permissions sudo

Pour permettre au plugin de contrôler AWDL0 sans demander de mot de passe à chaque fois, vous devez configurer les permissions `sudo` :

1. Ouvrez le terminal et exécutez :
   ```bash
   sudo visudo
   ```
2.	Ajoutez la ligne suivante à la fin du fichier, en remplaçant your_username par votre nom d’utilisateur :
  ```bash
  your_username ALL=(ALL) NOPASSWD: /sbin/ifconfig awdl0 up, /sbin/ifconfig awdl0 down
```
3.	Enregistrez et fermez le fichier.

Après avoir suivi ces étapes, le plugin awdl0_control devrait être entièrement fonctionnel dans SwiftBar.
</details>
