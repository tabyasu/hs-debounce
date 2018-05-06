local hPressed = false

function debouncingKeypress(e)
    -- if e:getKeyCode() ~= 4 then return false end
    if hPressed then
        print("INPUT Key !!")
        -- hs.alert.show("Hello World!")
        return true
    else
        hPressed = true
        hs.timer.doAfter(0.01, function() hPressed = false end)
        print("blocked Key !!")
        return false
    end
end

hs.eventtap.new(
    {hs.eventtap.event.types.keyDown},
    debouncingKeypress
):start()
