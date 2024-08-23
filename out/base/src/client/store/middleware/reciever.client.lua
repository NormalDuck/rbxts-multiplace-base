-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _reflex = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "reflex", "src")
local createBroadcastReceiver = _reflex.createBroadcastReceiver
local loggerMiddleware = _reflex.loggerMiddleware
local Events = TS.import(script, script.Parent.Parent.Parent, "network").Events
local APPLY_MIDDLEWARE = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "constants", "middleware").APPLY_MIDDLEWARE
local HydrateSerDes = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "SerDes").HydrateSerDes
local store = TS.import(script, script.Parent.Parent).store
local receiver = createBroadcastReceiver({
	start = function()
		Events.store.start:fire()
	end,
})
Events.store.dispatch:connect(function(actions)
	receiver:dispatch(actions)
end)
Events.store.hydrate:connect(function(_param)
	local buffer = _param.buffer
	local blobs = _param.blobs
	receiver:hydrate(HydrateSerDes.deserialize(buffer, blobs))
end)
store:applyMiddleware(receiver.middleware)
if APPLY_MIDDLEWARE then
	store:applyMiddleware(loggerMiddleware)
end
