# Jeu POO

## Introduction

Bienvenue sur le projet **"ILS VEULENT TOUS MA POO"** ! Ce projet est un jeu de combat interactif en Ruby où vous incarnerez un joueur combattant contre deux ennemis, José et Josiane. Le projet a été développé de manière progressive à travers trois versions majeures : 1.0, 2.0, et 3.0. Chaque version a été développée dans une branche dédiée, et la branche principale `main` contient la version la plus récente (3.0).

## Table des Matières

1. [Mise en place du projet](#mise-en-place-du-projet)
2. [Version 1.0 : Combat entre deux joueurs](#version-10--combat-entre-deux-joueurs)
3. [Version 2.0 : Nouveau type de joueur et fonctionnalités avancées](#version-20--nouveau-type-de-joueur-et-fonctionnalités-avancées)
4. [Version 3.0 : Jeu interactif complet](#version-30--jeu-interactif-complet)
5. [Utilisation du jeu](#utilisation-du-jeu)
6. [Contribuer](#contribuer)

## Mise en place du projet

Pour commencer, préparez votre environnement de travail :

1. Clonez le dépôt Git :
    ```sh
    git clone <URL_du_dépôt>
    cd jeu_POO
    ```

2. Installez les dépendances :
    ```sh
    bundle install
    ```

3. Voici l'architecture du projet :
    ```
    jeu_POO
    ├── lib
    │   ├── player.rb
    │   └── game.rb
    ├── app.rb
    ├── app_2.rb
    ├── README.md
    ├── Gemfile
    ├── Gemfile.lock
    └── Autres fichiers (.env, .gitignore)
    ```

## Version 1.0 : Combat entre deux joueurs

### Objectif
Coder un combat entre deux joueurs simples avec des points de vie.

### Détails
- Chaque joueur a un nom et 10 points de vie.
- Ils peuvent attaquer, subir des dégâts, et être tués.

### Exemple de code
```ruby
# app.rb
require 'bundler'
Bundler.require

require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 && player2.life_points > 0
  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state

  puts "Passons à la phase d'attaque :"
  player1.attacks(player2)
  break if player2.life_points <= 0
  player2.attacks(player1)
end
```

## Version 2.0 : Nouveau type de joueur et fonctionnalités avancées

### Objectif
Introduire un joueur humain avec des fonctionnalités supplémentaires.

### Détails
- Classe `HumanPlayer` avec 100 points de vie et un niveau d'arme.
- Possibilité de chercher de nouvelles armes et des packs de points de vie.

### Exemple de code
```ruby
# app_2.rb
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "Bienvenue sur 'ILS VEULENT TOUS MA POO' !"
puts "Le but du jeu est d'être le dernier survivant !"

print "Quel est ton prénom ? "
user_name = gets.chomp
human_player = HumanPlayer.new(user_name)

enemies = [Player.new("Josiane"), Player.new("José")]

while human_player.life_points > 0 && enemies.any? { |enemy| enemy.life_points > 0 }
  puts "Voici l'état de chaque joueur :"
  human_player.show_state
  enemies.each { |enemy| enemy.show_state }

  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "0 - attaquer Josiane"
  puts "1 - attaquer José"
  print "> "
  choice = gets.chomp

  case choice
  when 'a'
    human_player.search_weapon
  when 's'
    human_player.search_health_pack
  when '0'
    human_player.attacks(enemies[0])
  when '1'
    human_player.attacks(enemies[1])
  end

  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(human_player)
    end
  end
end

puts "La partie est finie"
if human_player.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end
```

## Version 3.0 : Jeu interactif complet

### Objectif
Créer un jeu interactif complet avec une expérience utilisateur fluide.

### Détails
- Le jeu se déroule au tour par tour avec des choix multiples pour le joueur humain.
- Les ennemis attaquent automatiquement après chaque tour du joueur humain.
- Ajout de nouvelles fonctionnalités et amélioration de l'expérience utilisateur.

## Utilisation du jeu

Pour lancer le jeu, exécutez le fichier `app.rb` pour la version 1.0 ou `app_2.rb` pour la version 2.0 :

```sh
ruby app.rb    # Version 1.0
ruby app_2.rb  # Version 2.0
```

Suivez les instructions à l'écran pour jouer et interagir avec le jeu.

## Contribuer

Pour contribuer au projet, veuillez suivre les étapes ci-dessous :

1. Fork le dépôt.
2. Créez une branche pour vos modifications (`git checkout -b feature/AmazingFeature`).
3. Commitez vos modifications (`git commit -m 'Add some AmazingFeature'`).
4. Poussez votre branche (`git push origin feature/AmazingFeature`).
5. Ouvrez une Pull Request.

Nous espérons que vous apprécierez ce projet et nous sommes impatients de voir vos contributions !