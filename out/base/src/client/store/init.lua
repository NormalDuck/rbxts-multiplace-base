-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local World = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "jecs", "src").World
local combineProducers = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "reflex", "src").combineProducers
local slices = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "store").slices
local clientSlices = {}
local function createStore()
	local _object = table.clone(slices)
	setmetatable(_object, nil)
	for _k, _v in clientSlices do
		_object[_k] = _v
	end
	local store = combineProducers(_object)
	return store
end
local store = createStore()
local world = World.new()
local Name = world:component()
local Animal = world:component()
local Duck = world:entity()
return {
	createStore = createStore,
	store = store,
}
