local f3x = {}
local plr = game.LocalPlayer
local bck = plr.Backpack
local character = plr.Character
local btools = character:FindFirstChild("Building Tools") or bck:FindFirstChild("Building Tools")
function f3x:printtest(var1)
print(var1)
end

function f3x:new(thing,x,y,z,parent)
local arg1 = "CreatePart"
local arg2 = thing
local arg3 = CFrame.new(x,y,z)
local arg4 = parent
btools.SyncAPI.ServerEndpoint:InvokeServer(arg1, arg2, arg3, arg4)
end

return f3x
