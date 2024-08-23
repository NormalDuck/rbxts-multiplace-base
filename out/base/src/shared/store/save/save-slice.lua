-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _immut = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "immut", "src")
local Immut = _immut
local produce = _immut.produce
local createProducer = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "reflex", "src").createProducer
local initalState = {}
local saveSlice = createProducer(initalState, {
	setPlayerSave = function(state, player, save)
		return produce(state, function(draft)
			local _draft = draft
			local _player = player
			local _save = save
			_draft[_player] = _save
		end)
	end,
	deletePlayerSave = function(state, player)
		return produce(state, function(draft)
			local _draft = draft
			local _player = player
			_draft[_player] = nil
		end)
	end,
	patchPlayerSave = function(state, player, patch)
		return produce(state, function(draft)
			local _draft = draft
			local _exp = player
			local _state = state
			local _player = player
			local _object = table.clone((_state[_player]))
			setmetatable(_object, nil)
			for _k, _v in patch do
				_object[_k] = _v
			end
			_draft[_exp] = _object
		end)
	end,
	patchPurchaseHistory = function(state, player, purchaseInfo)
		return produce(state, function(draft)
			print("ee")
			local _table = Immut.table
			local _draft = draft
			local _player = player
			_table.insert(_draft[_player].purchaseHistory, purchaseInfo)
		end)
	end,
})
return {
	saveSlice = saveSlice,
}
