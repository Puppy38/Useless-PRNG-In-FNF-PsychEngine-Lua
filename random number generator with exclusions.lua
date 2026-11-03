local number = nil -- this is where we will store the number
local ogmin = nil -- this is where the previous minimum will be stored
local try = nil
local isExcluded = false
local whattoreturn = nil

function onSongStart()
    debugPrint(rand(2, 8, {5, 3})) -- picks a random number from 2 to 8 except 5 and 3 and displays it on the screen
end

function opponentNoteHit()
    debugPrint(rand(1, 10, {4, 5})) -- picks a random number from 1 to 10 except 4 and 5 and displays it on the screen
end

function rnd(input)
    number = (number * 9301 + 49297) % 233280 -- shoutout to Zanzlanz for showing it in his video
    ogmin = input -- the original minimum is set to the new minimum
    return number / 233280.0
end

function rand(min, max, exclusions)
    if ogmin ~= min then -- if the original mimimum is not the same as the new minimum
        number = min -- it sets the number to the new minimum
    end
    
    try = math.ceil(rnd(min) * max)
    isExcluded = false -- reset

    for curExclusion = 1, #exclusions do
        if try == exclusions[curExclusion] then -- if it generates an excluded number
            isExcluded = true -- in enables this
        end
    end

    if isExcluded then -- if the number is excluded
        rand(min, max, exclusions) -- it runs itself
    else -- but if it isnt excluded
        whattoreturn = try -- it sets this to the generated number
    end

    return whattoreturn -- returns the generated number
end