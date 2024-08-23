-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _network = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "network")
local GlobalEvents = _network.GlobalEvents
local GlobalFunctions = _network.GlobalFunctions
local Events = GlobalEvents:createServer({}, {
	incomingIds = {},
	incoming = {},
	incomingUnreliable = {},
	outgoingIds = {},
	outgoingUnreliable = {},
	namespaceIds = { "store" },
	namespaces = {
		store = {
			incomingIds = { "start" },
			incoming = {
				start = { {}, nil },
			},
			incomingUnreliable = {},
			outgoingIds = { "dispatch", "hydrate" },
			outgoingUnreliable = {},
			namespaceIds = {},
			namespaces = {},
		},
	},
})
local Functions = GlobalFunctions:createServer({}, {
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
