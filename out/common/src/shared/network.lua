-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
-- eslint-disable @typescript-eslint/no-empty-object-type 
local Networking = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "networking", "out").Networking
local GlobalEvents = Networking.createEvent("common/src/shared/network@GlobalEvents")
local GlobalFunctions = Networking.createFunction("common/src/shared/network@GlobalFunctions")
return {
	GlobalEvents = GlobalEvents,
	GlobalFunctions = GlobalFunctions,
}
