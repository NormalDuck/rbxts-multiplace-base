-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local useViewport = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "pretty-react-hooks", "out").useViewport
local React = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local Group = TS.import(script, script.Parent, "primitive", "group").default
local MAX_ASPECT_RATIO = 19 / 9
local BASE_RESOLUTION = Vector2.new(1920, 1020)
--[[
	*
	 * Creates a 1920x1080 scaling container to handle ultra wide monitors and
	 * screens in a reasonable way. This helps keep UI centered and available for
	 * ultra wide screens.
	 *
	 * @param props - The component props.
	 * @param props.children - The content to render inside the container.
	 * @returns The rendesred container component.
	 * @see https://github.com/Quenty/NevermoreEngine/tree/a9256cab3584bea4bd32c327d00b9a52f2a3ec95/src/ultrawidecontainerutils
	 
]]
local function UltraWideContainer(_param)
	local children = _param.children
	local viewport = useViewport()
	return React.createElement(Group, nil, React.createElement("uisizeconstraint", {
		MaxSize = viewport:map(function(size)
			local resolution = Vector2.new(math.min(size.X, size.Y * MAX_ASPECT_RATIO), size.Y)
			local scale = resolution.Magnitude / BASE_RESOLUTION.Magnitude
			local desktop = resolution.X > resolution.Y or scale >= 1
			if not desktop then
				return Vector2.new(1920, 1080)
			end
			return Vector2.new(1920 * scale, size.Y)
		end),
	}), children)
end
return {
	default = UltraWideContainer,
}
