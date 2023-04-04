local f3x = {}
local plr = game.Players.LocalPlayer
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
function f3x:resize(part,x,y,z,x2,y2,z2)
local arg1 = "SyncResize"
local arg2 = {
[1] = {
["Part"] = part,
["CFrame"] = CFrame.new(x,y,z),
["Size"] = Vector3.new(x2,y2,z2)
}
}
btools.SyncAPI.ServerEndpoint:InvokeServer(arg1, arg2)
end
function f3x:rotate(part,cframe)
local arg1 = "SyncRotate"
local arg2 = {
[1] = {
["Part"] = part,
["CFrame"] = cframe

}
}
btools.SyncAPI.ServerEndpoint:InvokeServer(arg1, arg2)
end
function f3x:color(part,color)
local arg1 = "SyncColor"
local arg2 = {
[1] = {
["Part"] = part,
["Color"] = color,
["UnionColoring"] = true

}
}
btools.SyncAPI.ServerEndpoint:InvokeServer(arg1, arg2)
end
return f3x
