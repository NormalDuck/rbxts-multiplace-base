-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local saveSlice = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "save").saveSlice
local slices = {
	saves = saveSlice,
}
return {
	slices = slices,
}
