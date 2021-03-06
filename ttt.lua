-- *****************************************
-- **                                     **
-- **            Tic Tac Toe              **
-- **                                     **
-- **         (?) 05.10.2021 by           **
-- **               A.C.M.                **
-- **                                     **
-- *****************************************


game = {}
game.field = {}
game.lib = {}
game.memory = {}

dofile("reset_field.lua")
dofile("show_field.lua")
dofile("get_field.lua")
dofile("check_win.lua")
dofile("change_player.lua")
dofile("clear_screen.lua")
dofile("ai_normal.lua")
dofile("write2memory.lua")
dofile("store_memory.lua")

math.randomseed(os.time())                  -- Initalize the random-seed

game.player = 1                             -- Game is 0 stopped, 1 - 2 Player.
game.win = 0                                -- Game is drawn. -1 the game is running
game.exit = 0
game.count = 0
game.ai = 0                                 -- No AI-Player
game.file = nil                             -- Logfile

local answer = ""
game.lib.clrscr()

repeat -- The programm itself
    -- Start the Programm
    print("Tic Tac Toe")
    print()
    print("A game for 2 Player")
    print("Do you want to start a new game (y/n)?")
    answer = io.read(1)
    answer = string.lower(answer)

    if(string.lower(answer) == "n") then
        game.exit = 1

    else                                    -- Ok, User want to play a game

         game.player = 1
         game.win = 0
         game.exit = 0
         game.lib.reset_field()

         answer = ""
         print("Do you want to start an AI (y/n)?")
         io.read()
         answer = io.read(1)
         answer = string.lower(answer)

         if(answer == "n") then
             game.ai = 0

         else

             repeat
                print("Which Player is the AI (1/2)?")
                answer = io.read("*n")

            until(answer >= 1 and answer <= 2)

            game.ai = answer

        end -- if(answer == "n"


         repeat                                         -- Start the Game
            game.lib.clrscr()
            game.lib.show_field()

            if(game.player == game.ai) then             -- Player is a bot
                local choose = game.lib.ai_normal()
                print(choose)
                game.field[choose] = game.player

            else                                        -- Player is an Human
                game.lib.get_field()

            end

            game.lib.write2memory(game.count)           -- Writes the Board to the Memory
            game.count = game.count + 1                 -- next Move
            game.lib.change_player()
            game.win = game.lib.check_win()

         until(game.win >= 0)

         print("\n")
         game.lib.show_field()
         local weight = 0                               -- Game is Drawn, Weight = 0
         
         if(game.win == 0) then
            print("Nobody has won, the game is drawn.")

         else
            print("Congratulations Player " .. game.win .. ". You have won the Game.")
            if(game.win == 1) then 
                weight = -100                           -- Player 1 has won, Weight = -100
                
            else
                weight = 100                            -- Player 2 has won, Weight = 100
                
            end -- if(game.win == 1
                
        end -- if(game.win == 0
            
        game.lib.store_memory(weight)                         -- Write the Log to brain
         print("\n\n")
         io.read(1)

    end -- if(string.lower

until(game.exit == 1)

print("Thanks for playing the Game.")
print("Bye.")
