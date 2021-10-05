--[[
    check_win

    Returns:
    if a Player has won then Player
    if Game is drawn then 0
    if Nobody then -1 (Game is running again)

]]--

function game.lib.check_win()

    local win = 0


    for i = 1,2 do -- check Player 1 and 2

        -- horizontal
        if(game.field[1] == i and game.field[2] == i and game.field[3] == i) then win = i return win end
        if(game.field[4] == i and game.field[5] == i and game.field[6] == i) then win = i return win end
        if(game.field[7] == i and game.field[8] == i and game.field[9] == i) then win = i return win end

        -- vertikal
        if(game.field[1] == i and game.field[4] == i and game.field[7] == i) then win = i return win end
        if(game.field[2] == i and game.field[5] == i and game.field[8] == i) then win = i return win end
        if(game.field[3] == i and game.field[6] == i and game.field[9] == i) then win = i return win end

        -- diagonal
        if(game.field[1] == i and game.field[5] == i and game.field[9] == i) then win = i return win end
        if(game.field[3] == i and game.field[5] == i and game.field[7] == i) then win = i return win end

    end -- for i=

    -- is a field free?
    for i = 1,9 do
        if( game.field[i] == 0) then win = -1 return win end

    end -- for i,

    return win -- Ok, nobody has won, no field is free, game is drawn

end -- function check_win()
