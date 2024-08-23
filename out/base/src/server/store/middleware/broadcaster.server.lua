-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _reflex = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "reflex", "src")
local createBroadcaster = _reflex.createBroadcaster
local loggerMiddleware = _reflex.loggerMiddleware
local Events = TS.import(script, game:GetService("ServerScriptService"), "TS", "network").Events
local APPLY_MIDDLEWARE = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "constants", "middleware").APPLY_MIDDLEWARE
local HydrateSerDes = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "SerDes").HydrateSerDes
local slices = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "store").slices
local store = TS.import(script, game:GetService("ServerScriptService"), "TS", "store").store
local broadcaster = createBroadcaster({
	producers = slices,
	dispatch = function(player, actions)
		Events.store.dispatch:fire(player, actions)
	end,
	hydrate = function(player, state)
		Events.store.hydrate:fire(player, HydrateSerDes.serialize(state))
	end,
	hydrateRate = 60,
})
Events.store.start:connect(function(player)
	broadcaster:start(player)
end)
store:applyMiddleware(broadcaster.middleware)
if APPLY_MIDDLEWARE then
	store:applyMiddleware(loggerMiddleware)
end
return {
	broadcaster = broadcaster,
}
