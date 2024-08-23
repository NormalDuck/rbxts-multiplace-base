-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local exports = {}
for _k, _v in TS.import(script, script, "use-defined") or {} do
	exports[_k] = _v
end
for _k, _v in TS.import(script, script, "use-motion") or {} do
	exports[_k] = _v
end
for _k, _v in TS.import(script, script, "use-orientation") or {} do
	exports[_k] = _v
end
for _k, _v in TS.import(script, script, "use-premium") or {} do
	exports[_k] = _v
end
return exports
