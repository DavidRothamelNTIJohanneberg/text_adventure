require_relative "spelare.rb"
require_relative "map.rb"
require_relative "room.rb"
require_relative "items.rb"


def main()
    puts "Hello and welcome to this game."
    sleep 1
    puts "What's your name?"
    name = gets.chomp
    puts "Hello #{name}!"
    player = Player.new(name, 10, 2, 1)
    want_to_play = "y"
    while want_to_play == "y"
        game(player)
        puts "Do you want to play one more time? y/n"
        want_to_play = gets.chomp
        while want_to_play != "y" && want_to_play != "n"
            puts "Type y or n"
            want_to_play = gets.chomp
        end
    end
end



def game(player_)
    player = player_
    boss_counter = 0
    
    puts "You seem to have entered a dungeon"
    sleep 1
    while true

        boss_counter += 1
        
        if boss_counter == 5
            monster, item, entries = map(true)
            puts "Look at that big door do you really want to go inside?"
            which_door = 4
        else
        
            i = 0
            monster, item, entries = map(false)
            puts "You see #{entries.length} doors."
            sleep 1
            while i < entries.length
                puts entries[i].puts_description(true) #door
                puts
                sleep 1
                i += 1
            end

            which_door = 0
            puts "Choose one door between 1 and #{entries.length}"
            which_door = gets.chomp.to_i
            while which_door <= 0 || which_door > entries.length
                puts "It has to be a number between 1 and #{entries.length}"
                which_door = gets.chomp.to_i
            end
           
        end
        
        if boss_counter != 5
            puts entries[which_door-1].puts_description(false)
        else
            # Beskrivnng av boss rummet.
        end

        if monster != nil
            if boss_counter != 5
                puts "You meet a #{monster.name}"
            else
                puts "You meet the #{monster.name}"
            end
            while(monster.hp > 0)
               
                puts "Do you want to attack? (attack/run)"
                input = gets.chomp
                while input != "attack" && input != "run"
                    puts "Type attack if you want to attack the monster or type run if you don't."
                    input = gets.chomp
                end
                if input == "attack"
                    player.attack(monster)
                elsif input == "run"
                    break
                end
                monster.attack(player)
                if (player.hp < 1)
                    puts "You died"
                    return nil
                end
                if monster.hp > 0 
                    puts "You have #{player.hp} hp left"
                    sleep 0.5
                    puts "The monster have #{monster.hp} hp left"
                    sleep 1
                end
            end

            if boss_counter != 5 && input != "run"
                puts "You win"
                sleep 0.5
                puts "You have #{player.hp} hp left"
                sleep 1
            elsif input == "run"
                lost_in_dungeons = rand(0..10)
                if lost_in_dungeons > 2
                    puts "You escaped from the #{monster.name}."
                    boss_counter -= 2
                    item = nil
                else
                    puts "You run away and get lost in the dungeons and died"
                    return nil
                end
            end
        end
        
        if boss_counter == 5
            puts "You have won the game. Well played #{player.name}"
            return nil
        end

        if item != nil
            puts "You see a #{item.name}"
            sleep 1
            item.pick_up(player)
        end
    end
end

main()