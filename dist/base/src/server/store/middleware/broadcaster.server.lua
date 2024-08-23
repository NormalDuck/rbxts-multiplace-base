
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","reflex","src")
local c=b.createBroadcaster
local d=b.loggerMiddleware
local e=a.import(script,game:GetService"ServerScriptService","TS","network").Events
local f=a.import(script,game:GetService"ReplicatedStorage","TS","constants","middleware").APPLY_MIDDLEWARE
local g=a.import(script,game:GetService"ReplicatedStorage","TS","SerDes").HydrateSerDes
local h=a.import(script,game:GetService"ReplicatedStorage","TS","store").slices
local i=a.import(script,game:GetService"ServerScriptService","TS","store").store
local j=c{
producers=h,
dispatch=function(j,k)
e.store.dispatch:fire(j,k)
end,
hydrate=function(j,k)
e.store.hydrate:fire(j,g.serialize(k))
end,
hydrateRate=60,
}
e.store.start:connect(function(k)
j:start(k)
end)
i:applyMiddleware(j.middleware)
if f then
i:applyMiddleware(d)
end
return{
broadcaster=j,
}