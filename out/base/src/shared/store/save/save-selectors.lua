-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local createSelector = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "reflex", "src").createSelector
local selectSave = function(state)
	return state.saves
end
local selectPlayerSave = function(player)
	return createSelector(selectSave, function(save)
		local _save = save
		local _player = player
		return _save[_player]
	end)
end
return {
	selectSave = selectSave,
	selectPlayerSave = selectPlayerSave,
}
