
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b={}
for c,d in a.import(script,script,"use-defined")or{}do
b[c]=d
end
for e,f in a.import(script,script,"use-motion")or{}do
b[e]=f
end
for g,h in a.import(script,script,"use-orientation")or{}do
b[g]=h
end
for i,j in a.import(script,script,"use-premium")or{}do
b[i]=j
end
return b