-- Writes all Boards to the file

function game.lib.write2memory(count)

    local memory = game.memory
    local fs = ""                                   -- Entry as String

    fs = tostring(count) .. ","                     -- add the counter
    for i = 1,9 do                                  -- with the current field
        fs = fs .. tostring(game.field[i])

    end
    memory[#memory+1] = fs .. "\n"                   -- and insert the string to the memory

end
