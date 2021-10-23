-- Saves the Game like a Log

function game.lib.store_memory(weight)

    local filename = "brain.txt"
    local file = io.open(filename ,"r")
    local add_weight = 0
    
    if(file == nil) then                            -- No brain there, install a new one
        file = io.open(filename ,"w")

    else
        file:close()                                -- File exists
        file = io.open(filename ,"a")               -- Opens it to append

    end -- if file

    for i = 1, #game.memory do                      -- Writes the moves to the file
        file:write(game.memory[i])
        game.memory[i] = nil                        -- Clear's the Memory
        add_weight = i
    end

    add_weight = 9 - add_weight
    if(weight < 0) then 
       add_weight = add_weight * -1

    end

    file:write(tostring(weight + add_weight) .. "\n")            -- Writes the Winner
    file:close()                                    -- and close the file

end
