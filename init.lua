local pressed = false
local prevKeyCode = null

function debouncingKeypress(e)
    if e:getKeyCode() == prevKeyCode then
        print("prev Key !! "..prevKeyCode)
        -- return true
    end

    prevKeyCode = e:getKeyCode()

    if pressed then
        print("blocked Key !! "..prevKeyCode)
        return true
    else
        pressed = true
        hs.timer.doAfter(0.01, function() pressed = false end)
        print("INPUT Key !! "..prevKeyCode)
        return false
    end
end

hs.eventtap.new(
    {hs.eventtap.event.types.keyDown},
    debouncingKeypress
):start()
