-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _react = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local React = _react
local forwardRef = _react.forwardRef
--[[
	*
	 * A container for grouping multiple components together.
	 *
	 * @example
	 *
	 * ```tsx
	 * <Group Native={{ Position: new UDim2(0, 0, 0, 0) }}>
	 * 	<TextButton Text="Button 1" />
	 * 	<TextButton Text="Button 2" />
	 * </Group>;
	 * ```
	 *
	 * @note A group defaults to being centered in the parent container (anchor point and
	 * position are set to 0.5).
	 *
	 * @component
	 
]]
local Group = forwardRef(function(_param, ref)
	local Native = _param.Native
	local children = _param.children
	local _attributes = {
		ref = ref,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
	}
	if Native then
		for _k, _v in Native do
			_attributes[_k] = _v
		end
	end
	return React.createElement("frame", _attributes, children)
end)
local default = Group
return {
	default = default,
}
