-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local _core = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out")
local Controller = _core.Controller
local Modding = _core.Modding
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local CharacterAddController
do
	CharacterAddController = setmetatable({}, {
		__tostring = function()
			return "CharacterAddController"
		end,
	})
	CharacterAddController.__index = CharacterAddController
	function CharacterAddController.new(...)
		local self = setmetatable({}, CharacterAddController)
		return self:constructor(...) or self
	end
	function CharacterAddController:constructor()
		self.AddListener = {}
		self.RemoveListener = {}
	end
	function CharacterAddController:onStart()
		Modding.onListenerAdded(function(obj)
			local _addListener = self.AddListener
			local _obj = obj
			_addListener[_obj] = true
			return _addListener
		end, "common/src/client/hooks/init@OnCharacterAdd")
		Modding.onListenerRemoved(function(obj)
			local _addListener = self.AddListener
			local _obj = obj
			-- ▼ Set.delete ▼
			local _valueExisted = _addListener[_obj] ~= nil
			_addListener[_obj] = nil
			-- ▲ Set.delete ▲
			return _valueExisted
		end, "common/src/client/hooks/init@OnCharacterAdd")
		Modding.onListenerAdded(function(obj)
			local _removeListener = self.RemoveListener
			local _obj = obj
			_removeListener[_obj] = true
			return _removeListener
		end, "common/src/client/hooks/init@OnCharacterRemove")
		Modding.onListenerRemoved(function(obj)
			local _removeListener = self.RemoveListener
			local _obj = obj
			-- ▼ Set.delete ▼
			local _valueExisted = _removeListener[_obj] ~= nil
			_removeListener[_obj] = nil
			-- ▲ Set.delete ▲
			return _valueExisted
		end, "common/src/client/hooks/init@OnCharacterRemove")
		Players.LocalPlayer.CharacterAdded:Connect(function(character)
			for listener in self.AddListener do
				listener:onCharacterAdd(character)
			end
		end)
		Players.LocalPlayer.CharacterRemoving:Connect(function(character)
			for listener in self.RemoveListener do
				listener:onCharacterRemove(character)
			end
		end)
		if Players.LocalPlayer.Character then
			for listener in self.AddListener do
				listener:onCharacterAdd(Players.LocalPlayer.Character)
			end
		end
	end
	do
		-- (Flamework) CharacterAddController metadata
		Reflect.defineMetadata(CharacterAddController, "identifier", "common/src/client/hooks/character@CharacterAddController")
		Reflect.defineMetadata(CharacterAddController, "flamework:implements", { "$:flamework@OnStart" })
	end
end
-- (Flamework) CharacterAddController decorators
Reflect.decorate(CharacterAddController, "@flamework/core:out/flamework@Controller", Controller, { {
	loadOrder = 1,
} })
return {
	CharacterAddController = CharacterAddController,
}
