-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local createProducer = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "reflex", "src").createProducer
local initalState = {}
local duck
local productSlice = createProducer(initalState, {})
return {
	productSlice = productSlice,
}
