local prevKeyCode = null
local prevTime = os.clock()
local now = null

function debouncingKeypress(e)
    now = os.clock()
    if e:getKeyCode() == prevKeyCode then
        print("prev Key !! "..prevKeyCode)
        if (now - prevTime) <= 0.05 then
            print("time !! "..now - prevTime)
            print("blocked Key !! "..prevKeyCode)
            return true
        end
    end

    prevKeyCode = e:getKeyCode()
    prevTime = now
end

hs.eventtap.new(
    {hs.eventtap.event.types.keyDown},
    debouncingKeypress
):start()
