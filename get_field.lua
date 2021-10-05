--[[

get_field()

Reads the input.
Checks if the field is occupied.

]]--

function game.lib.get_field()

    local value = 0
    local valid = false
    local player = game.player

    if(player == 0) then
        print("The Game isn't running.")
        return

    end -- if(player ==

    repeat
        print("Player " .. player .. ". Which field do you choose?")
        value = io.read("*n")           -- Get a Number
        if(value < 1) or (value > 9) then
            print("The number must be between 1 and 9.")
            valid = false

        elseif (game.field[value] ~= 0) then
            print("This Field is occupied.")
            valid = false

        else
            print("Ok.")
            game.field[value] = game.player
            valid = true

        end -- if(value < 1

    until(valid == true) -- repeat

end
