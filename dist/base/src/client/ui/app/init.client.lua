
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","react")
local c=b
local d=b.StrictMode
local e=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","react-roblox")
local f=e.createPortal
local g=e.createRoot
local h=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","services").Players
local i=a.import(script,script,"app").App
local j=g(Instance.new"Folder")
local k=h.LocalPlayer:WaitForChild"PlayerGui"
j:render(f(c.createElement(d,nil,c.createElement(i)),k))