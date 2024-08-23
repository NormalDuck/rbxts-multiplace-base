-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _pretty_react_hooks = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "pretty-react-hooks", "out")
local getBindingValue = _pretty_react_hooks.getBindingValue
local useEventListener = _pretty_react_hooks.useEventListener
local useMotion = _pretty_react_hooks.useMotion
local useRef = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react").useRef
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local function useSpring(goal, options)
	local binding, motion = useMotion(getBindingValue(goal))
	local previousValue = useRef(getBindingValue(goal))
	useEventListener(RunService.Heartbeat, function()
		local currentValue = getBindingValue(goal)
		if currentValue ~= previousValue.current then
			previousValue.current = currentValue
			motion:spring(currentValue, options)
		end
	end)
	return binding
end
return {
	useSpring = useSpring,
}
