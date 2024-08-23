
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Reflect
local c=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Service
local d=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","services").MarketplaceService
local e=a.import(script,game:GetService"ReplicatedStorage","common","utils","retrier").retry






local f
do
f=setmetatable({},{
__tostring=function()
return"MarketService"
end,
})
f.__index=f
function f.new(...)
local g=setmetatable({},f)
return g:constructor(...)or g
end
function f.constructor(g)
end
f.GetDeveloperProductsAsync=a.async(function(g)
return a.await(e(function()
return d:GetDeveloperProductsAsync()
end))
end)
f.GetProductInfo=a.async(function(g,h,i)
return a.await(e(function()
return d:GetProductInfo(h,i)
end))
end)
f.GetSubscriptionProductInfoAsync=a.async(function(g,h)end)
do

b.defineMetadata(f,"identifier","common/src/server/services/market-service@MarketService")
end
end

b.decorate(f,"$:flamework@Service",c,{})
return{
MarketService=f,
}