
class Weapon < Equipment
    attr_accessor :hp, :dmg, :name
    @@weapon_types = [["Axe", 10000, 2],["Sword", 10000, 3],["Spear", 10000, 1]]
    def initialize(type)
        what_weapon = @@weapon_types[type]
        super(what_weapon[0], what_weapon[1], what_weapon[2])
    end
    
    def self.weapon_types
        @@weapon_types
    end
    #template
end

class Pokal < Equipment
    attr_accessor :name
    @name = "Pokal"
    def initialize
        super(@name, 1, 1)
    end
end


class Armour < Equipment
    attr_accessor :hp, :dmg, :name, :arm
    def initialize(name, hp, dmg, arm)
        super(name, hp, dmg)
        @arm = arm
    end
end

class Potion
    def initialize(name, hp)
        @hp = hp
        @name = name
        @in_use = false
    end

    def start_use()
        self.in_use = true
    end

    def pick_up()
        puts "Do you want to pick up #{self.name}"
        sleep 1
    end
end


class Heal_potion < Potion
    attr_accessor :hp, :name, :heal 
    def initialize(name, hp, heal)
        super(hp, name)
        @heal = heal
    end 
end


class Dmg_potion < Potion
    attr_accessor :hp, :dmg, :name
    def initialize(name, hp, dmg)
        super(name, hp)
        @dmg = dmg
    end


    def uses()
        self.hp -= 1
    end
end