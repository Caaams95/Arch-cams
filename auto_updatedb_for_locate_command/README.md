
# Automatiser `updatedb` au démarrage sur Arch Linux

Ce tutoriel vous explique comment automatiser l'exécution de la commande `updatedb` à chaque démarrage en utilisant un service et un minuteur `systemd` sur Arch Linux.

### Étape 1 : Créer un service `systemd` pour `updatedb`

Commencez par créer un fichier de service `systemd` qui exécutera la commande `updatedb`.

#### 1.1 Créer le fichier de service

Ouvrez un éditeur de texte en tant qu'administrateur pour créer un fichier de service :

```bash
sudo nano /etc/systemd/system/updatedb.service
```

#### 1.2 Ajouter la configuration du service

Dans le fichier que vous venez de créer, ajoutez les lignes suivantes :

```ini
[Unit]
Description=Update locate database
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/bin/updatedb

[Install]
WantedBy=multi-user.target
```

#### Explication :
- `Description` : Donne une description du service.
- `After=network.target` : Assure que le service est lancé après que le réseau soit prêt (facultatif pour `updatedb`).
- `ExecStart` : La commande à exécuter, ici `/usr/bin/updatedb`.
- `Type=oneshot` : Spécifie que le service exécute une seule commande puis s'arrête.
- `WantedBy=multi-user.target` : Cela permet au service de s'exécuter en mode multi-utilisateur (état normal du système).

### Étape 2 : Créer un `systemd` timer

Pour exécuter le service `updatedb` au démarrage, vous devez créer un minuteur `systemd`.

#### 2.1 Créer un fichier de minuterie

Créez un fichier pour configurer le minuteur avec la commande suivante :

```bash
sudo nano /etc/systemd/system/updatedb.timer
```

#### 2.2 Ajouter la configuration du minuteur

Ajoutez les lignes suivantes dans le fichier de minuterie :

```ini
[Unit]
Description=Run updatedb at boot

[Timer]
OnBootSec=5min
Unit=updatedb.service

[Install]
WantedBy=timers.target
```

#### Explication :
- `OnBootSec=5min` : Définit un délai de 5 minutes après le démarrage avant l'exécution du service `updatedb`. Vous pouvez ajuster cette valeur selon vos besoins.
- `Unit=updatedb.service` : Associe ce minuteur au service que nous avons créé.

### Étape 3 : Activer et démarrer le minuteur

Une fois les fichiers de service et de minuteur créés, activez et démarrez le minuteur avec les commandes suivantes :

```bash
sudo systemctl enable updatedb.timer
sudo systemctl start updatedb.timer
```

### Étape 4 : Vérifier le statut du minuteur

Pour vérifier si le minuteur est actif, exécutez la commande suivante :

```bash
systemctl status updatedb.timer
```

### Étape 5 : (Optionnel) Vérifier l'exécution du service

Si vous souhaitez voir quand `updatedb` a été exécuté pour la dernière fois, utilisez cette commande :

```bash
journalctl -u updatedb.service
```

### Résumé

En suivant ces étapes, vous avez configuré un service `systemd` qui exécute la commande `updatedb` automatiquement à chaque démarrage de votre système Arch Linux, avec un délai de 5 minutes après le démarrage.
