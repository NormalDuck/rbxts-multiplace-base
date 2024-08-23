
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")

local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","t","lib","ts").t
local c=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","core","out").Flamework
local d={
purchaseHistory={},
}
local e=c.createGuard(b.interface{
purchaseHistory=b.array(b.interface{
assetid=b.number,
robux=b.number,
timestamp=b.string,
}),
})
return{
DefaultPlayerSave=d,
PlayerSaveGuard=e,
}