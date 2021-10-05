-- ai normal

function game.lib.ai_normal()
    local player = game.player              -- Get the current player
    local user = 0                          -- the User
    local found = -1

    if(game.player == 1) then
        user = 2

    else
        user = 1

    end

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

    --- diagonal 159
    if(game.field[1] == player and game.field[5] == player and game.field[9] == 0) then found = 9 end
    if(game.field[5] == player and game.field[9] == player and game.field[1] == 0) then found = 1 end
    if(game.field[1] == player and game.field[9] == player and game.field[5] == 0) then found = 5 end

    --- diagonal 357
    if(game.field[3] == player and game.field[5] == player and game.field[7] == 0) then found = 7 end
    if(game.field[5] == player and game.field[7] == player and game.field[3] == 0) then found = 3 end
    if(game.field[3] == player and game.field[7] == player and game.field[5] == 0) then found = 5 end

    -- No field found to win, check the user
    
    if(game.field[1] == user and game.field[2] == user and game.field[3] == 0) then found = 3 end
    if(game.field[2] == user and game.field[3] == user and game.field[1] == 0) then found = 1 end
    if(game.field[1] == user and game.field[3] == user and game.field[2] == 0) then found = 2 end
    
    -- line 2
    if(game.field[4] == user and game.field[5] == user and game.field[6] == 0) then found = 6 end
    if(game.field[4] == user and game.field[6] == user and game.field[5] == 0) then found = 5 end
    if(game.field[5] == user and game.field[6] == user and game.field[4] == 0) then found = 4 end

    -- line 3
    if(game.field[7] == user and game.field[8] == user and game.field[9] == 0) then found = 9 end
    if(game.field[8] == user and game.field[9] == user and game.field[7] == 0) then found = 7 end
    if(game.field[7] == user and game.field[9] == user and game.field[8] == 0) then found = 8 end

    --- diagonal 159
    if(game.field[1] == user and game.field[5] == user and game.field[9] == 0) then found = 9 end
    if(game.field[5] == user and game.field[9] == user and game.field[1] == 0) then found = 1 end
    if(game.field[1] == user and game.field[9] == user and game.field[5] == 0) then found = 5 end

    --- diagonal 357
    if(game.field[3] == user and game.field[5] == user and game.field[7] == 0) then found = 7 end
    if(game.field[5] == user and game.field[7] == user and game.field[3] == 0) then found = 3 end
    if(game.field[3] == user and game.field[7] == user and game.field[5] == 0) then found = 5 end

    -- No dangerous field found, make a random roll
    repeat
        found = math.random(1,9)
        if(game.field[found] == 1 or game.field[found] == 2) then
            found = -1

        end

    until(found >= 1 and found <= 9)

    game.field[found] = player
    print("Player " .. player .. " has made his turn.")
    return found

end
