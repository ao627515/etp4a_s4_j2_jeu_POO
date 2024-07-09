# Projet Jeu de Combat en Ruby

## Description

Ce projet est un jeu de combat en Ruby où le joueur affronte des adversaires contrôlés par l'ordinateur. Le jeu est développé de manière progressive avec plusieurs versions, chacune apportant de nouvelles fonctionnalités. Chaque version du projet est disponible sur une branche distincte du dépôt Git.

## Branches du Projet

- **main (version 3.0)** : Contient la dernière version du projet, intégrant toutes les fonctionnalités.
- **version-1.0** : La version initiale où le joueur combat un adversaire.
- **version-2.0** : Ajoute un nouveau type de joueur (HumanPlayer) avec des compétences spécifiques.

## Installation

1. Clonez le dépôt sur votre machine locale :
   ```sh
   git clone https://github.com/votre-utilisateur/jeu_combat_ruby.git
   ```
2. Accédez au dossier du projet :
   ```sh
   cd jeu_combat_ruby
   ```
3. Installez les dépendances :
   ```sh
   bundle install
   ```

## Utilisation

### Version 1.0
1. Basculez sur la branche `version-1.0` :
   ```sh
   git checkout version-1.0
   ```
2. Exécutez le jeu :
   ```sh
   ruby app.rb
   ```

### Version 2.0
1. Basculez sur la branche `version-2.0` :
   ```sh
   git checkout version-2.0
   ```
2. Exécutez le jeu :
   ```sh
   ruby app_2.rb
   ```

### Version 3.0
1. Basculez sur la branche `main` :
   ```sh
   git checkout main
   ```
2. Exécutez le jeu :
   ```sh
   ruby app_3.rb
   ```

## Structure du Projet

```
jeu_combat_ruby/
├── lib/
│   ├── player.rb
│   ├── game.rb
├── app.rb
├── app_2.rb
├── app_3.rb
├── README.md
├── Gemfile
├── Gemfile.lock
```

## Fonctionnalités

### Version 1.0
- Combat entre deux joueurs.
- Affichage de l'état des joueurs.
- Système de dégâts et de mort des joueurs.

### Version 2.0
- Ajout d'un joueur humain (HumanPlayer) avec plus de points de vie et un niveau d'arme.
- Recherche d'armes et de packs de vie.
- Combats interactifs avec des choix d'actions pour le joueur.

### Version 3.0
- Améliorations et nouvelles fonctionnalités avancées (détails dans la branche `main`).

## Contribuer

Pour contribuer au projet, veuillez suivre les étapes ci-dessous :

1. Fork le dépôt.
2. Créez une branche pour vos modifications (`git checkout -b feature/AmazingFeature`).
3. Commitez vos modifications (`git commit -m 'Add some AmazingFeature'`).
4. Poussez votre branche (`git push origin feature/AmazingFeature`).
5. Ouvrez une Pull Request.

Nous espérons que vous apprécierez ce projet et nous sommes impatients de voir vos contributions !