
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")

local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@flamework","networking","out").Networking
local c=b.createEvent"common/src/shared/network@GlobalEvents"
local d=b.createFunction"common/src/shared/network@GlobalFunctions"
return{
GlobalEvents=c,
GlobalFunctions=d,
}