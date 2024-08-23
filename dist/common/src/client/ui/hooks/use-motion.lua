
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","pretty-react-hooks","out").useLatestCallback
local c=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","react")
local d=c.useBinding
local e=c.useEffect
local f=c.useMemo
local g=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","ripple","src").createMotion
local h=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","services").RunService













local function useMotion(i,j)
local k=f(function()
return g(i)
end,{i})
local l=b(function()
local l=k:get()
return if j then j(l)else l
end)
local m,n=d(l())
e(function()
n(l())
end,{l,j,n})
e(function()
local o=h.Heartbeat:Connect(function(o)
k:step(o)
n(l())
end)
return function()
o:Disconnect()
k:destroy()
end
end,{l,k,n})
return m,k
end
return{
useMotion=useMotion,
}