
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Reflect
local c=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Controller
local d
do
d=setmetatable({},{
__tostring=function()
return"ProductController"
end,
})
d.__index=d
function d.new(...)
local e=setmetatable({},d)
return e:constructor(...)or e
end
function d.constructor(e)
end
function d.onStart(e)
end
do

b.defineMetadata(d,"identifier","base/src/client/controllers/product-controller@ProductController")
b.defineMetadata(d,"flamework:implements",{"$:flamework@OnStart"})
end
end

b.decorate(d,"$:flamework@Controller",c,{})
return{
ProductController=d,
}