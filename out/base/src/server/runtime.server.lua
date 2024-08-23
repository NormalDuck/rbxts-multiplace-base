-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Flamework = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
-- Flamework.addPaths("src/server/components");
Flamework._addPaths({ { "ServerScriptService", "TS", "services" } })
-- Flamework.addPaths("src/shared/components");
-- Flamework.addPaths("../common/src/server/components");
-- Flamework.addPaths("../common/src/server/services");
Flamework._addPaths({ { "ServerScriptService", "common", "hooks" } })
-- Flamework.addPaths("../common/src/shared/components");
Flamework.ignite()
