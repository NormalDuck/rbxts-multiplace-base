-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local t = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local _network = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "network")
local GlobalEvents = _network.GlobalEvents
local GlobalFunctions = _network.GlobalFunctions
local Events = GlobalEvents:createClient({}, {
	incomingIds = {},
	incoming = {},
	incomingUnreliable = {},
	outgoingIds = {},
	outgoingUnreliable = {},
	namespaceIds = { "store" },
	namespaces = {
		store = {
			incomingIds = { "dispatch", "hydrate" },
			incoming = {
				dispatch = { { t.array(t.interface({
					name = t.string,
					arguments = t.array(t.union(t.any, t.none)),
				})) }, nil },
				hydrate = { { t.interface({
					buffer = t.typeof("buffer"),
					blobs = t.array(t.any),
				}) }, nil },
			},
			incomingUnreliable = {},
			outgoingIds = { "start" },
			outgoingUnreliable = {},
			namespaceIds = {},
			namespaces = {},
		},
	},
})
local Functions = GlobalFunctions:createClient({}, {
	incomingIds = {},
	incoming = {},
	outgoingIds = {},
	outgoing = {},
	namespaceIds = {},
	namespaces = {},
})
return {
	Events = Events,
	Functions = Functions,
}
