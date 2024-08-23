
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","immut","src")
local c=b
local d=b.produce
local e=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","reflex","src").createProducer
local f={}
local g=e(f,{
setPlayerSave=function(g,h,i)
return d(g,function(j)
local k=j
local l=h
local m=i
k[l]=m
end)
end,
deletePlayerSave=function(g,h)
return d(g,function(i)
local j=i
local k=h
j[k]=nil
end)
end,
patchPlayerSave=function(g,h,i)
return d(g,function(j)
local k=j
local l=h
local m=g
local n=h
local o=table.clone((m[n]))
setmetatable(o,nil)
for p,q in i do
o[p]=q
end
k[l]=o
end)
end,
patchPurchaseHistory=function(g,h,i)
return d(g,function(j)
print"ee"
local k=c.table
local l=j
local m=h
k.insert(l[m].purchaseHistory,i)
end)
end,
})
return{
saveSlice=g,
}