-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local _core = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out")
local Modding = _core.Modding
local Service = _core.Service
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local PlayerSpawnService
do
	PlayerSpawnService = setmetatable({}, {
		__tostring = function()
			return "PlayerSpawnService"
		end,
	})
	PlayerSpawnService.__index = PlayerSpawnService
	function PlayerSpawnService.new(...)
		local self = setmetatable({}, PlayerSpawnService)
		return self:constructor(...) or self
	end
	function PlayerSpawnService:constructor()
		self.JoinListeners = {}
		self.LeaveListeners = {}
	end
	function PlayerSpawnService:onStart()
		Modding.onListenerAdded(function(obj)
			local _joinListeners = self.JoinListeners
			local _obj = obj
			_joinListeners[_obj] = true
			return _joinListeners
		end, "common/src/server/hooks/init@OnPlayerJoin")
		Modding.onListenerRemoved(function(obj)
			local _joinListeners = self.JoinListeners
			local _obj = obj
			_joinListeners[_obj] = true
			return _joinListeners
		end, "common/src/server/hooks/init@OnPlayerJoin")
		Modding.onListenerAdded(function(obj)
			local _leaveListeners = self.LeaveListeners
			local _obj = obj
			_leaveListeners[_obj] = true
			return _leaveListeners
		end, "common/src/server/hooks/init@OnPlayerLeave")
		Modding.onListenerRemoved(function(obj)
			local _leaveListeners = self.LeaveListeners
			local _obj = obj
			_leaveListeners[_obj] = true
			return _leaveListeners
		end, "common/src/server/hooks/init@OnPlayerLeave")
		for _, player in Players:GetPlayers() do
			for listener in self.JoinListeners do
				task.spawn(function()
					return listener:onPlayerJoin(player)
				end)
			end
		end
		Players.PlayerAdded:Connect(function(player)
			for listener in self.JoinListeners do
				task.spawn(function()
					return listener:onPlayerJoin(player)
				end)
			end
		end)
		Players.PlayerRemoving:Connect(function(player)
			for listener in self.LeaveListeners do
				task.spawn(function()
					return listener:onPlayerLeave(player)
				end)
			end
		end)
	end
	do
		-- (Flamework) PlayerSpawnService metadata
		Reflect.defineMetadata(PlayerSpawnService, "identifier", "common/src/server/hooks/players@PlayerSpawnService")
		Reflect.defineMetadata(PlayerSpawnService, "flamework:implements", { "$:flamework@OnStart" })
	end
end
-- (Flamework) PlayerSpawnService decorators
Reflect.decorate(PlayerSpawnService, "$:flamework@Service", Service, { {
	loadOrder = 1,
} })
return {
	PlayerSpawnService = PlayerSpawnService,
}
