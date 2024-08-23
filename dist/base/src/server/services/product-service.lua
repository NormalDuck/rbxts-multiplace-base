
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Reflect
local c=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Service
local d=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","services").MarketplaceService
local e
do
e=setmetatable({},{
__tostring=function()
return"ProductService"
end,
})
e.__index=e
function e.new(...)
local f=setmetatable({},e)
return f:constructor(...)or f
end
function e.constructor(f,g)
f.saveService=g
end
function e.onStart(f)
print"hello worldS"
end
function e.ProcessReceipt(f,g)
print"ok"
return Enum.ProductPurchaseDecision.PurchaseGranted
end
do

b.defineMetadata(e,"identifier","base/src/server/services/product-service@ProductService")
b.defineMetadata(e,"flamework:parameters",{"base/src/server/services/save-service@SaveService"})
b.defineMetadata(e,"flamework:implements",{"$:flamework@OnStart"})
end
end

b.decorate(e,"$:flamework@Service",c,{})
print"aa"
local function ProcessReceipt(f)
print"e"
return Enum.ProductPurchaseDecision.PurchaseGranted
end
d.ProcessReceipt=ProcessReceipt
return{
ProductService=e,
}