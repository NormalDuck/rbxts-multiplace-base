
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","reflex","src")
local c=b.createBroadcastReceiver
local d=b.loggerMiddleware
local e=a.import(script,script.Parent.Parent.Parent,"network").Events
local f=a.import(script,game:GetService"ReplicatedStorage","TS","constants","middleware").APPLY_MIDDLEWARE
local g=a.import(script,game:GetService"ReplicatedStorage","TS","SerDes").HydrateSerDes
local h=a.import(script,script.Parent.Parent).store
local i=c{
start=function()
e.store.start:fire()
end,
}
e.store.dispatch:connect(function(j)
i:dispatch(j)
end)
e.store.hydrate:connect(function(j)
local k=j.buffer
local l=j.blobs
i:hydrate(g.deserialize(k,l))
end)
h:applyMiddleware(i.middleware)
if f then
h:applyMiddleware(d)
end