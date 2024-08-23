
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","pretty-react-hooks","out").useLatest
local function isEqualOrUndefined(c,d)
return c==d or d==nil
end









local function useDefined(c,d)
local e=b(c,isEqualOrUndefined).current
if e==nil then
e=d
end
return e
end
return{
useDefined=useDefined,
}