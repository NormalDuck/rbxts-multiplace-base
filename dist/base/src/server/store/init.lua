
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","reflex","src").combineProducers
local c=a.import(script,game:GetService"ReplicatedStorage","TS","store").slices
local d={}
local function createStore()
local e=table.clone(c)
setmetatable(e,nil)
for f,g in d do
e[f]=g
end
local h=b(e)
return h
end
local e=createStore()
return{
createStore=createStore,
store=e,
}