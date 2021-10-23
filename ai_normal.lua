-- ai normal

function game.lib.ai_normal()
    local player = game.player              -- Get the current player
    local user = 0                          -- the User
    local found = -1
    local count = 0
    if(game.player == 1) then
        user = 2

    else
        user = 1

    end

    repeat
        -- line 1
        if(game.field[1] == player and game.field[2] == player and game.field[3] == 0) then found = 3 end
        if(game.field[2] == player and game.field[3] == player and game.field[1] == 0) then found = 1 end
        if(game.field[1] == player and game.field[3] == player and game.field[2] == 0) then found = 2 end

        -- line 2
        if(game.field[4] == player and game.field[5] == player and game.field[6] == 0) then found = 6 end
        if(game.field[4] == player and game.field[6] == player and game.field[5] == 0) then found = 5 end
        if(game.field[5] == player and game.field[6] == player and game.field[4] == 0) then found = 4 end

        -- line 3
        if(game.field[7] == player and game.field[8] == player and game.field[9] == 0) then found = 9 end
        if(game.field[8] == player and game.field[9] == player and game.field[7] == 0) then found = 7 end
        if(game.field[7] == player and game.field[9] == player and game.field[8] == 0) then found = 8 end

        -- row 1
        if(game.field[1] == player and game.field[4] == player and game.field[7] == 0) then found = 7 end
        if(game.field[4] == player and game.field[7] == player and game.field[1] == 0) then found = 1 end
        if(game.field[7] == player and game.field[1] == player and game.field[4] == 0) then found = 4 end

        -- row 2
        if(game.field[2] == player and game.field[5] == player and game.field[8] == 0) then found = 8 end
        if(game.field[5] == player and game.field[8] == player and game.field[2] == 0) then found = 2 end
        if(game.field[8] == player and game.field[2] == player and game.field[5] == 0) then found = 5 end

        -- row 3
        if(game.field[3] == player and game.field[6] == player and game.field[9] == 0) then found = 9 end
        if(game.field[6] == player and game.field[9] == player and game.field[3] == 0) then found = 3 end
        if(game.field[9] == player and game.field[3] == player and game.field[6] == 0) then found = 6 end

        --- diagonal 159
        if(game.field[1] == player and game.field[5] == player and game.field[9] == 0) then found = 9 end
        if(game.field[5] == player and game.field[9] == player and game.field[1] == 0) then found = 1 end
        if(game.field[1] == player and game.field[9] == player and game.field[5] == 0) then found = 5 end

        --- diagonal 357
        if(game.field[3] == player and game.field[5] == player and game.field[7] == 0) then found = 7 end
        if(game.field[5] == player and game.field[7] == player and game.field[3] == 0) then found = 3 end
        if(game.field[3] == player and game.field[7] == player and game.field[5] == 0) then found = 5 end
        
        count = count + 1
        if(found > -1) then 
            count = count + 1                       -- was a winner found? yes, then leave repeat
            
        end
        
        player = user                               -- change the player
                                                    -- No field found to win, check the opponent
    until(count > 1)
    player = game.player

    -- No dangerous field found, make a random roll
    if(found == -1) then
        repeat
            found = math.random(1,9)
            if(game.field[found] == 1 or game.field[found] == 2) then
                found = -1

            end -- if(game.field

        until(found >= 1 and found <= 9) -- repeat

    end -- if(found ==

    game.field[found] = player
    print("Player " .. player .. " has made his turn.")
    return found

end
