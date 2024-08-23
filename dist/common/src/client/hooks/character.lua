
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Reflect
local c=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out")
local d=c.Controller
local e=c.Modding
local f=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","services").Players
local g
do
g=setmetatable({},{
__tostring=function()
return"CharacterAddController"
end,
})
g.__index=g
function g.new(...)
local h=setmetatable({},g)
return h:constructor(...)or h
end
function g.constructor(h)
h.AddListener={}
h.RemoveListener={}
end
function g.onStart(h)
e.onListenerAdded(function(i)
local j=h.AddListener
local k=i
j[k]=true
return j
end,"common/src/client/hooks/init@OnCharacterAdd")
e.onListenerRemoved(function(i)
local j=h.AddListener
local k=i

local l=j[k]~=nil
j[k]=nil

return l
end,"common/src/client/hooks/init@OnCharacterAdd")
e.onListenerAdded(function(i)
local j=h.RemoveListener
local k=i
j[k]=true
return j
end,"common/src/client/hooks/init@OnCharacterRemove")
e.onListenerRemoved(function(i)
local j=h.RemoveListener
local k=i

local l=j[k]~=nil
j[k]=nil

return l
end,"common/src/client/hooks/init@OnCharacterRemove")
f.LocalPlayer.CharacterAdded:Connect(function(i)
for j in h.AddListener do
j:onCharacterAdd(i)
end
end)
f.LocalPlayer.CharacterRemoving:Connect(function(i)
for j in h.RemoveListener do
j:onCharacterRemove(i)
end
end)
if f.LocalPlayer.Character then
for i in h.AddListener do
i:onCharacterAdd(f.LocalPlayer.Character)
end
end
end
do

b.defineMetadata(g,"identifier","common/src/client/hooks/character@CharacterAddController")
b.defineMetadata(g,"flamework:implements",{"$:flamework@OnStart"})
end
end

b.decorate(g,"@flamework/core:out/flamework@Controller",d,{{
loadOrder=1,
}})
return{
CharacterAddController=g,
}