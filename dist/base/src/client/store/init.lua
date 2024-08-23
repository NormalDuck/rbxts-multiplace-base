
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","jecs","src").World
local c=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","reflex","src").combineProducers
local d=a.import(script,game:GetService"ReplicatedStorage","TS","store").slices
local e={}
local function createStore()
local f=table.clone(d)
setmetatable(f,nil)
for g,h in e do
f[g]=h
end
local i=c(f)
return i
end
local f=createStore()
local g=b.new()
g:component()
g:component()
g:entity()
return{
createStore=createStore,
store=f,
}