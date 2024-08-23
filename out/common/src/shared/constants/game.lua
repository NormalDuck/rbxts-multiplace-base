-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local GAME_NAME = "Template for roblox-ts"
local IS_EDIT = RunService:IsStudio() and not RunService:IsRunning()
return {
	GAME_NAME = GAME_NAME,
	IS_EDIT = IS_EDIT,
}
