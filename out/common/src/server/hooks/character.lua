-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local _core = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out")
local Modding = _core.Modding
local Service = _core.Service
local CharacterAddService
do
	CharacterAddService = setmetatable({}, {
		__tostring = function()
			return "CharacterAddService"
		end,
	})
	CharacterAddService.__index = CharacterAddService
	function CharacterAddService.new(...)
		local self = setmetatable({}, CharacterAddService)
		return self:constructor(...) or self
	end
	function CharacterAddService:constructor()
		self.AddListener = {}
		self.RemoveListener = {}
	end
	function CharacterAddService:onStart()
		Modding.onListenerAdded(function(obj)
			local _addListener = self.AddListener
			local _obj = obj
			_addListener[_obj] = true
			return _addListener
		end, "common/src/server/hooks/init@OnCharacterAdd")
		Modding.onListenerRemoved(function(obj)
			local _addListener = self.AddListener
			local _obj = obj
			-- ▼ Set.delete ▼
			local _valueExisted = _addListener[_obj] ~= nil
			_addListener[_obj] = nil
			-- ▲ Set.delete ▲
			return _valueExisted
		end, "common/src/server/hooks/init@OnCharacterAdd")
		Modding.onListenerAdded(function(obj)
			local _removeListener = self.RemoveListener
			local _obj = obj
			_removeListener[_obj] = true
			return _removeListener
		end, "common/src/server/hooks/init@OnCharacterRemove")
		Modding.onListenerRemoved(function(obj)
			local _removeListener = self.RemoveListener
			local _obj = obj
			-- ▼ Set.delete ▼
			local _valueExisted = _removeListener[_obj] ~= nil
			_removeListener[_obj] = nil
			-- ▲ Set.delete ▲
			return _valueExisted
		end, "common/src/server/hooks/init@OnCharacterRemove")
	end
	function CharacterAddService:onPlayerJoin(player)
		player.CharacterAdded:Connect(function(character)
			return self:characterAdded(character)
		end)
		player.CharacterRemoving:Connect(function(character)
			for listener in self.RemoveListener do
				listener:onCharacterRemove(character)
			end
		end)
		if player.Character ~= nil then
			self:characterAdded(player.Character)
		end
	end
	CharacterAddService.characterAdded = TS.async(function(self, character)
		for listener in self.AddListener do
			task.spawn(function()
				return listener:onCharacterAdd(character)
			end)
		end
	end)
	do
		-- (Flamework) CharacterAddService metadata
		Reflect.defineMetadata(CharacterAddService, "identifier", "common/src/server/hooks/character@CharacterAddService")
		Reflect.defineMetadata(CharacterAddService, "flamework:implements", { "$:flamework@OnStart", "common/src/server/hooks/init@OnPlayerJoin" })
	end
end
-- (Flamework) CharacterAddService decorators
Reflect.decorate(CharacterAddService, "$:flamework@Service", Service, { {
	loadOrder = 0,
} })
return {
	default = CharacterAddService,
}
