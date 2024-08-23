
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","pretty-react-hooks","out")
local c=b.getBindingValue
local d=b.useEventListener
local e=b.useMotion
local f=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","react").useRef
local g=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","services").RunService
local function useSpring(h,i)
local j,k=e(c(h))
local l=f(c(h))
d(g.Heartbeat,function()
local m=c(h)
if m~=l.current then
l.current=m
k:spring(m,i)
end
end)
return j
end
return{
useSpring=useSpring,
}