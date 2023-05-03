
class Mob
    attr_accessor :hp, :name, :dmg, :arm
    def initialize(name, hp, dmg, arm)
        @hp = hp
        @name = name
        @dmg = dmg
        @arm = arm
    end

    def attack(opponent)
        #Add randomness later
        opponent.hp -= self.dmg * opponent.arm
    end

end

class Player < Mob
    attr_accessor :inv
    @@inv = []
    @@armour = nil
    @@weapon = nil
    def initialize(name, hp, dmg, arm)
        super(name, hp, dmg, arm)
    end

    def puts_inventory()
        for i in @@inv
            puts i.name
        end
    end

    def pick_up(item)
        input = ""
        while input != "y" && input != "n"
            puts "Do you want to pick up this #{item.name}. (y/n)"
            input = gets.chomp
            if input == "y"
                if @@inv.length < 6 #perhaps change int to var, so it is possible to get a larger inventory
                    @@inv << item
                else
                    puts("You have no more space in your inventory \n
                        What item do you want to remove?")
                    for i in @@inv
                        puts(i.name)
                    end
                    input = gets.chomp.to_i
                    @@inv.insert(input, item)
                end
            elsif input != "n"
                puts "You have to type y or n."
            end
        end
    end

    def equip(item_as_string)
        for i in @@inv
            if i.name.downcase == item_as_string.downcase
                if i.class == Armour
                    self.arm += i.arm
                    self.dmg += i.dmg
                    if @@armour != nil
                        self.arm -= @@armour.arm
                        self.arm -= @@armour.dmg
                    end
                    @@armour = i
                end

                if i.class == Weapon
                    self.dmg += i.dmg
                    if @@weapon != nil
                        self.dmg -= @@weapon.dmg
                    end
                    @@weapon = i
                end
                return
            end
        end
        puts("Item is not in the inventory")
    end
end

class Enemy < Mob
    attr_accessor :hp, :name, :dmg, :arm
    @@types = [["Rat", 1, 3, 1], ["Spider", 1, 2, 1], ["Skeleton", 3, 4, 1], ["Zombie", 2, 6, 1], ["Armoured Skeleton", 3, 4, 0.75], ["Boss", 5, 5, 0.5]]
    def initialize(number)
        temp = @@types[number]
        super(temp[0], temp[1], temp[2], temp[3])
    end
end

class Equipment
    attr_accessor :hp, :dmg, :name
    def initialize(name, hp, dmg)
        @hp = hp
        @dmg = dmg
        @name = name
    end

    def pick_up(player)
        puts "Do you want to pick up #{self.name}"
        player.pick_up(self)
    end

end

