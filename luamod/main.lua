local lastChat = ""
function processinput(inp)
    if lastChat == inp then return end
    lastChat = inp
    inp = string.gsub(inp, "-", " ")
    DebugPrint(inp)
end
function tryStuff()
    local hearts = Spawn("MOD/prefab/test.xml", Transform(Vec(0,10,0)))
    DebugWatch("test", tostring(hearts[1]))
    if (hearts[1] == nil) then return end
    local value = GetTagValue(hearts[1], "text") 
    DebugWatch("message content: ", tostring(value))

    processinput(value)
    Delete(hearts[1])
end
local nextupdate = 0
function update()
    if GetTime() > nextupdate then
        pcall(tryStuff)
        nextupdate = GetTime() + 0.005
    end
end
