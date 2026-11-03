local number = nil -- this is where we will store the number
local ogmin = nil -- this is where the previous minimum will be stored

function onSongStart()
    debugPrint(rand(2, 8)) -- picks a random number from 2 to 8 and displays it on the screen
end

function opponentNoteHit()
    debugPrint(rand(1, 100)) -- picks a random number from 1 to 100 and displays it on the screen
end

function rnd(input)
    number = (number * 9301 + 49297) % 233280 -- shoutout to Zanzlanz for showing it in his video
    ogmin = input -- the original minimum is set to the new minimum
    return number / 233280.0
end

function rand(min, max)
    if ogmin ~= min then -- if the original mimimum is not the same as the new minimum
        number = min -- it sets the number to the new minimum
    end
    
    return math.ceil(rnd(min) * max) -- idk
end