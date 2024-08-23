
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Reflect
local c=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Service
local d=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","services").MarketplaceService
local e
do
e=setmetatable({},{
__tostring=function()
return"TestService"
end,
})
e.__index=e
function e.new(...)
local f=setmetatable({},e)
return f:constructor(...)or f
end
function e.constructor(f)
end
function e.onPlayerJoin(f,g)
d:PromptGamePassPurchase(g,1645608670)
end
do

b.defineMetadata(e,"identifier","base/src/server/services/test-service@TestService")
b.defineMetadata(e,"flamework:implements",{"common/src/server/hooks/init@OnPlayerJoin"})
end
end

b.decorate(e,"$:flamework@Service",c,{})
return{
TestService=e,
}