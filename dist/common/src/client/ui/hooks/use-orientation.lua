
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","pretty-react-hooks","out").useViewport
local c=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","react").useState
local function useOrientation()
local d
local e=b(function(e)
d(if e.Y>e.X then"portrait"else"landscape")
end)
local f={c(e:map(function(f)
return if f.Y>f.X then"portrait"else"landscape"
end):getValue())}
local g=f[1]
d=f[2]
return g
end
return{
useOrientation=useOrientation,
}