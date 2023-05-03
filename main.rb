require_relative "spelare.rb"
require_relative "map.rb"
require_relative "room.rb"
require_relative "items.rb"


def main()
    player = Player.new("Dave", 10, 2, 1)
    game(player)
end



def game(player_)
    player = player_
    boss_counter = 0
    
    puts "You seem to have entered a dungeon"
    while true

        boss_counter += 1

        
        if boss_counter == 5
            monster, item, entries = map(true)
            puts "Look at that big door do you "
                which_door = 4
        else
        
            i = 0
            monster, item, entries = map(false)
            puts "You see #{entries.length} doors."
            while i < entries.length
                puts entries[i].puts_description(true) #door
                puts
                i += 1
            end

            which_door = 0

            while true
                puts "Choose one door between 1 and #{entries.length}"
                
                begin 
                    which_door = gets.chomp.to_i
                rescue
                    puts "It has to be a number"
                    next
                end

                if which_door <= entries.length
                    break
                end

                puts "The number has to between 1 and #{entries.length}"

            end

        end
        
        puts entries[which_door-1].puts_description(false)
        if monster != nil
            puts "You meet a #{monster.name}"
            while(monster.hp > 0)
                if (player.hp < 1)
                    puts "You died"
                end
                puts "Do you want to attack? (attack/run)"
                input = gets.chomp
                if input == "attack"
                    player.attack(monster)
                elsif input == "run"
                    puts "You run away and get lost in the dungeons"
                    break
                end
                monster.attack(player)
            end
            puts "You win"
            puts "You have #{player.hp} left"
        end
        if item != nil
            puts "You see a #{item.name}"
            item.pick_up(player)
        end
    end
end

main()