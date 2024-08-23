-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
-- eslint-disable @typescript-eslint/no-empty-object-type 
local t = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local Flamework = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local DefaultPlayerSave = {
	purchaseHistory = {},
}
local PlayerSaveGuard = Flamework.createGuard(t.interface({
	purchaseHistory = t.array(t.interface({
		assetid = t.number,
		robux = t.number,
		timestamp = t.string,
	})),
}))
return {
	DefaultPlayerSave = DefaultPlayerSave,
	PlayerSaveGuard = PlayerSaveGuard,
}
