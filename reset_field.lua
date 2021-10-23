-- reset_field

function game.lib.reset_field()

    for i=1,9 do
        game.field[i] = 0

    end

    game.count = 1                      -- set to the first move

end -- reset_field(
