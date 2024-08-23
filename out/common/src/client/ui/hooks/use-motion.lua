-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local useLatestCallback = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "pretty-react-hooks", "out").useLatestCallback
local _react = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local useBinding = _react.useBinding
local useEffect = _react.useEffect
local useMemo = _react.useMemo
local createMotion = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "ripple", "src").createMotion
local RunService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
--[[
	*
	 * Creates a memoized Motion object set to the given initial value. Returns a
	 * binding that updates with the Motion, along with the Motion object.
	 *
	 * @template T - The type of the Motion goal.
	 * @template U - The type of the mapped value.
	 * @param goal - The initial value of the Motion.
	 * @param mapper - A function to map the Motion value to a different type.
	 * @returns A tuple containing the binding and the Motion object.
	 * @see https://github.com/littensy/slither/blob/6540d0fa974c2bc8945a3969968b9a4d267388a6/src/client/hooks/use-motion.ts
	 
]]
local function useMotion(goal, mapper)
	local motion = useMemo(function()
		return createMotion(goal)
	end, { goal })
	local get = useLatestCallback(function()
		local value = motion:get()
		return if mapper then mapper(value) else value
	end)
	local binding, setValue = useBinding(get())
	useEffect(function()
		setValue(get())
	end, { get, mapper, setValue })
	useEffect(function()
		local connection = RunService.Heartbeat:Connect(function(delta)
			motion:step(delta)
			setValue(get())
		end)
		return function()
			connection:Disconnect()
			motion:destroy()
		end
	end, { get, motion, setValue })
	return binding, motion
end
return {
	useMotion = useMotion,
}
