
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Reflect
local c=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Service
local d=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","lapis","out")
local e=d.createCollection
local f=d.setConfig
local g=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","lapis-mockdatastore","src")
local h=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","services").RunService
local i=a.import(script,game:GetService"ServerScriptService","TS","store").store
local j=a.import(script,game:GetService"ReplicatedStorage","TS","SerDes").PlayerSerDes
local k=a.import(script,game:GetService"ReplicatedStorage","TS","store","save","save-selectors").selectPlayerSave
local l=a.import(script,game:GetService"ReplicatedStorage","TS","store","save","save-types").DefaultPlayerSave
local m=a.import(script,game:GetService"ReplicatedStorage","common","utils","retrier").retry
local n
do
n=setmetatable({},{
__tostring=function()
return"SaveService"
end,
})
n.__index=n
function n.new(...)
local o=setmetatable({},n)
return o:constructor(...)or o
end
function n.constructor(o)
o.Documents={}
if h:IsStudio()then
f{
dataStoreService=g.new(),
}
end
o.PlayerSaveCollection=e("PlayerSave",{
defaultData=j.serialize(l),
})
end
n.onPlayerJoin=a.async(function(o,p)
local q=a.await(o.PlayerSaveCollection:load("PlayerSave",{p.UserId}))
i.setPlayerSave(p,j.deserialize(q:read().buffer,q:read().blobs))
local r=o.Documents
local s=p
r[s]=q
q:beforeSave(function()
return q:write(j.serialize(i:getState(k(p))))
end)
q:beforeClose(function()
i.deletePlayerSave(p)
local t=o.Documents
local u=p
t[u]=nil
end)
end)
function n.ForceSave(o,p)
m(function()
local q=o.Documents
local r=p
local s=q[r]
if s~=nil then
s=s:save()
end
return s
end)
end
do

b.defineMetadata(n,"identifier","base/src/server/services/save-service@SaveService")
b.defineMetadata(n,"flamework:implements",{"common/src/server/hooks/init@OnPlayerJoin"})
end
end

b.decorate(n,"$:flamework@Service",c,{})
return{
SaveService=n,
}