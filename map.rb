require_relative "spelare.rb"

def map(boss)
    #Rewrite so it is array of the possible rooms you can choose
    if !boss
        entries = doors()

        chance_mob = rand(0..10)

        if chance_mob > 4
            what_mob = rand(0...5)
            monster = Enemy.new(what_mob)
        end


        chance_item = rand(0..10)

        if chance_item > 5
            what_item = 3 #rand(0...10)
            if what_item < 4
                what_weapon = rand(0...Weapon.weapon_types.length)
                item = Weapon.new(what_weapon)
            end
        end
    else
        entries = Room.new(3)
        monster = Enemy.new(5)
        item = Pokal.new
    end
    return monster, item, entries
end

def doors()
    temp_array = []
    amount = rand(1..3)
    i = 0
    while i < amount
        temp_array << Room.new(rand(0..2))
        i += 1
    end

    return temp_array
end