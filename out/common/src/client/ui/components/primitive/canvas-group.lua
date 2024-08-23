-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _react = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local React = _react
local forwardRef = _react.forwardRef
--[[
	*
	 * A wrapper around the `CanvasGroup` component, a GuiObject that renders
	 * descendants as a group with color and transparency applied to the render
	 * result.
	 *
	 * @example
	 *
	 * ```tsx
	 * <CanvasGroup Native={{ Size: new UDim2(0, 100, 0, 100) }}>
	 * ```
	 *
	 * @component
	 *
	 * @see https://developer.roblox.com/en-us/api-reference/class/CanvasGroup
	 
]]
local CanvasGroup = forwardRef(function(props, ref)
	local _binding = props
	local CornerRadius = _binding.CornerRadius
	local Native = _binding.Native
	local children = _binding.children
	local _attributes = {
		ref = ref,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
	}
	if Native then
		for _k, _v in Native do
			_attributes[_k] = _v
		end
	end
	return React.createElement("canvasgroup", _attributes, if CornerRadius then React.createElement("uicorner", {
		key = "corner",
		CornerRadius = CornerRadius,
	}) else nil, children)
end)
local default = CanvasGroup
return {
	default = default,
}
