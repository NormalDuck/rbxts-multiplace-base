-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Service = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Service
local _lapis = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "lapis", "out")
local createCollection = _lapis.createCollection
local setConfig = _lapis.setConfig
local DataStoreServiceMock = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "lapis-mockdatastore", "src")
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local store = TS.import(script, game:GetService("ServerScriptService"), "TS", "store").store
local PlayerSerDes = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "SerDes").PlayerSerDes
local selectPlayerSave = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "save", "save-selectors").selectPlayerSave
local DefaultPlayerSave = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "save", "save-types").DefaultPlayerSave
local retry = TS.import(script, game:GetService("ReplicatedStorage"), "common", "utils", "retrier").retry
local SaveService
do
	SaveService = setmetatable({}, {
		__tostring = function()
			return "SaveService"
		end,
	})
	SaveService.__index = SaveService
	function SaveService.new(...)
		local self = setmetatable({}, SaveService)
		return self:constructor(...) or self
	end
	function SaveService:constructor()
		self.Documents = {}
		if RunService:IsStudio() then
			setConfig({
				dataStoreService = DataStoreServiceMock.new(),
			})
		end
		self.PlayerSaveCollection = createCollection("PlayerSave", {
			defaultData = PlayerSerDes.serialize(DefaultPlayerSave),
		})
	end
	SaveService.onPlayerJoin = TS.async(function(self, player)
		local document = TS.await(self.PlayerSaveCollection:load("PlayerSave", { player.UserId }))
		store.setPlayerSave(player, PlayerSerDes.deserialize(document:read().buffer, document:read().blobs))
		local _documents = self.Documents
		local _player = player
		_documents[_player] = document
		document:beforeSave(function()
			return document:write(PlayerSerDes.serialize(store:getState(selectPlayerSave(player))))
		end)
		document:beforeClose(function()
			store.deletePlayerSave(player)
			local _documents_1 = self.Documents
			local _player_1 = player
			_documents_1[_player_1] = nil
		end)
	end)
	function SaveService:ForceSave(player)
		retry(function()
			local _documents = self.Documents
			local _player = player
			local _result = _documents[_player]
			if _result ~= nil then
				_result = _result:save()
			end
			return _result
		end)
	end
	do
		-- (Flamework) SaveService metadata
		Reflect.defineMetadata(SaveService, "identifier", "base/src/server/services/save-service@SaveService")
		Reflect.defineMetadata(SaveService, "flamework:implements", { "common/src/server/hooks/init@OnPlayerJoin" })
	end
end
-- (Flamework) SaveService decorators
Reflect.decorate(SaveService, "$:flamework@Service", Service, {})
return {
	SaveService = SaveService,
}
