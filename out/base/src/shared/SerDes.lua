-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local createBinarySerializer = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flamework-binary-serializer", "out").createBinarySerializer
local PlayerSerDes = createBinarySerializer({ "object_raw", { { "purchaseHistory", { "array", { "object_raw", { { "assetid", { "f64" } }, { "robux", { "f64" } }, { "timestamp", { "string" } } } } } } } })
local HydrateSerDes = createBinarySerializer({ "object_raw", { { "saves", { "map", { "blob" }, { "object_raw", { { "purchaseHistory", { "array", { "object_raw", { { "assetid", { "f64" } }, { "robux", { "f64" } }, { "timestamp", { "string" } } } } } } } } } } } })
return {
	PlayerSerDes = PlayerSerDes,
	HydrateSerDes = HydrateSerDes,
}
