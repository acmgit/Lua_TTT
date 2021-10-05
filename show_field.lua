-- show_field()

local stone = {}
stone[0] = " "
stone[1] = "X"
stone[2] = "O"

function game.lib.show_field()

    local count = 0
    local line = ""

    for i = 1,9 do
        count = count +1
        if (count <= 2) then
            line = line .. stone[game.field[i]] .. "|"

        else
            line = line .. stone[game.field[i]]

            if(i < 9) then
                print(line)
                print("-----")
                line = ""
                count = 0

            else
                print(line)

            end -- if(count ~= 9

        end -- if(count <= 2

    end -- for
end
