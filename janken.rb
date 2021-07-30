#La logique qui permet au joueur d'entréer des vakeurs entre 0 et 2
class Player
    def hand
        #Définition d'un tableau des choix pour le jeu de pierre-papier-ciseaux
        possible_choice = ["Veuillez saisir les chiffres 0 à 2", "0: Goo, 1: Choki, 2: Par"]
        
        puts possible_choice #Affichez une phrase qui permet au joueur de sélectionner une main pierre-papier-ciseaux.

        #Affectez la valeur d'entrée du joueur à la variable "input_hand".
        #Astuce : Renseignez-vous sur la méthode gets.
    
        input_hand = gets.chomp

        # Si "input_hand" est soit "0, 1, 2", le processus itératif se termine, et s'il ne l'est pas (y compris les alphabets), le processus itératif continue.
    
        while true
            # if "input_hand" est l'un des "0, 1, 2"
            # Astuce : Renseignez-vous sur la méthode include?.

            variable_test = ["0", "1", "2"].include?(input_hand)#est-ce que la saisie de l'utilisateur se trouve dans variable_test?
            # "input_hand" est renvoyé tel quel.
            # Astuce : utilisez « return » si vous souhaitez renvoyer une valeur de retour et mettre fin au processus itératif.

            if variable_test
                return input_hand.to_i
                # Affichez une phrase qui demande au joueur d'entrer "0-2".
                # puts "Veuillez saisir un nombre de 0 à 2."
                # puts "0: Goo, 1: Choki, 2: Par"
                # Affectez la valeur d'entrée du joueur à la variable "input_hand".
            else
            puts possible_choice[0] #montrer au joueur les choix possibles pour le jeu
            input_hand = gets.chomp #recuperation de la nouevlle saisie

            end
        end
    end
end

#La logique pour que l'autre partie (l'adversaire) génère aléatoirement la valeur de 0 à 2
class Enemy
  def hand
      # Obtenez au hasard les valeurs de goo, choki et par.
      return rand(0..2).to_i
  end
end

#La logique pour jouer au jeu de pierre-papier-ciseaux avec "0 à 2" choisi par chaque partie
class Janken
  def pon(player_hand, enemy_hand)

      # Affectez le tableau ["Goo", "Choki", "Par"] à la variable "janken".
  janken = ["Goo", "Choki", "Par"]

  #Afficher "La main de l'adversaire
  puts "La main de l'adversaire est #{janken[enemy_hand]}"

  #Créez une logique pour jouer pierre-papier-ciseaux à partir de la valeur de retour de la classe Player et de la valeur de retour de la classe Enemy.

      if player_hand == enemy_hand # Egalité de choix

          puts "Égalité"

          # Renvoie "true" pour exécuter à plusieurs reprises des roche-papier-ciseaux.
          # Astuce : Vous pouvez utiliser « return » pour renvoyer une valeur de retour. Cependant, dans Ruby, lors du retour d'une valeur de retour, omettez "return"
          return true #pour exécuter à plusieurs reprises le jeu

          elsif (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)#conditions de que moi je gagne (player_hand)
          puts "Vous avez gagné"#Sortie "Vous gagnez".

          return false

      else
          puts "Vous avez perdu."#Sortie "Vous êtes en train de perdre".
          return false #Renvoie "false" pour terminer pierre-papier-ciseaux
      end
  end
end

#La logique pour exécuter le jeu de pierre-papier-ciseaux
class GameStart
  #En utilisant self, vous pouvez appeler la méthode jankenpon en utilisant le nom de la classe sans instancier GameStart.

  def self.jankenpon
      player = Player.new #Remplacez le Player instancié par la variable "player".
      enemy = Enemy.new #Assignez une instanciation d'Enemy à la variable "ennemi".
      janken = Janken.new #Assignez une instanciation de Janken à la variable "janken".

      next_game = true # Attribuons "true" à la variable "next_game".

      while next_game do
           # J'utilise des pierre-papier-ciseaux avec "janken.pon (player.hand, ennemi.hand)".
           #Je lance pierre-papier-ciseaux avec "janken.pon (player.hand, ennemi.hand)".

          next_game = janken.pon(player.hand, enemy.hand)
      end
  end
end

#Appelle de la méthode jankenpon avec le nom de la classe
GameStart.jankenpon
