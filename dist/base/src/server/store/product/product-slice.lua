
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","reflex","src").createProducer
local c={}

local d=b(c,{})
return{
productSlice=d,
}