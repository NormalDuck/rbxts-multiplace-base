
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","reflex","src").createSelector
local c=function(c)
return c.saves
end
local d=function(d)
return b(c,function(e)
local f=e
local g=d
return f[g]
end)
end
return{
selectSave=c,
selectPlayerSave=d,
}