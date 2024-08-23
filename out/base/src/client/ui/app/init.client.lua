-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _react = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local React = _react
local StrictMode = _react.StrictMode
local _react_roblox = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react-roblox")
local createPortal = _react_roblox.createPortal
local createRoot = _react_roblox.createRoot
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local App = TS.import(script, script, "app").App
local root = createRoot(Instance.new("Folder"))
local target = Players.LocalPlayer:WaitForChild("PlayerGui")
root:render(createPortal(React.createElement(StrictMode, nil, React.createElement(App)), target))
