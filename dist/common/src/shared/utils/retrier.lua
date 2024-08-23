
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.async(function(b,c,d)
if c==nil then
c=5
end
if d==nil then
d=0
end
local e
local f=0
while not(e~=0 and e==e and e~=""and e)do
local g,h=pcall(b)
if not g then
if not(d==0)then
task.wait(d)
end
f+=1
else
e=h
end
if f==c then
warn(`retrier failed to retry in {f} times of retrying. `)
end
end
return e
end)
return{
retry=b,
}