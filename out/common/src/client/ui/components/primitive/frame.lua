-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _react = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local React = _react
local forwardRef = _react.forwardRef
--[[
	*
	 * A wrapper around the `Frame` component, a GuiObject that renders as a plain
	 * rectangle with no other content. If you intend to use this component as a
	 * container for other components, consider using the `Group` component
	 * instead.
	 *
	 * @example
	 *
	 * ```tsx
	 * <Frame CornerRadius={new UDim(0, 8)} Native={{ Size: new UDim2(0, 100, 0, 100) }}>
	 * ```
	 *
	 * @note A frame defaults to being centered in the parent container (anchor point and
	 * position are set to 0.5).
	 *
	 * @component
	 *
	 * @see https://create.roblox.com/docs/reference/engine/classes/Frame
	 
]]
local Frame = forwardRef(function(_param, ref)
	local CornerRadius = _param.CornerRadius
	local Native = _param.Native
	local children = _param.children
	local _attributes = {
		ref = ref,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
	}
	if Native then
		for _k, _v in Native do
			_attributes[_k] = _v
		end
	end
	return React.createElement("frame", _attributes, children, if CornerRadius then React.createElement("uicorner", {
		CornerRadius = CornerRadius,
	}) else nil)
end)
local default = Frame
return {
	default = default,
}
