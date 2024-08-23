
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","pretty-react-hooks","out").useEventListener
local c=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","react").useState
local d=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","services").Players
local e=a.import(script,script.Parent.Parent.Parent,"constants","localplayer").LocalPlayer








local function usePremium()
local f,g=c(e.MembershipType==Enum.MembershipType.Premium)
b(d.PlayerMembershipChanged,function(h)
if h==e then
g(h.MembershipType==Enum.MembershipType.Premium)
end
end)
return f
end
return{
usePremium=usePremium,
}