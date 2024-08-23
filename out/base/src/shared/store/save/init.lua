-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local exports = {}
for _k, _v in TS.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "save", "save-slice") or {} do
	exports[_k] = _v
end
return exports
