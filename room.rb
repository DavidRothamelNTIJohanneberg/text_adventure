class Room
    #Perhaps add so that different room has an effect on spawn chance
    @@room_design = [["Fire", [0, 1],[1, 2]], ["Water", [2, 3], [3, 4]], ["Common", [2, 3], [3, 4]], ["Hall", [3, 4], [4, 5]]]
    def initialize(number)
        @room_type = @@room_design[number]
    end

    def puts_description(door)
        i = 0
        if door
            text = File.open("room_description.txt")
            lines = text.readlines
            text.close
            lines = lines[@room_type[2][0]...@room_type[2][1]]

            lines = lines[0].split("\\n")

            while i < lines.length
                puts lines[i]
                sleep 2
                i += 1
            end
        else
            text = File.open("room_description.txt")
            lines = text.readlines
            text.close
            lines = lines[@room_type[1][0]...@room_type[1][1]]

            lines = lines[0].split("\\n")

            while i < lines.length
                puts lines[i]
                sleep 2
                i += 1
            end
            
            
        end
    end
end