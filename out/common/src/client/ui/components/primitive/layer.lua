-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local React = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local IS_EDIT = TS.import(script, game:GetService("ReplicatedStorage"), "common", "constants", "game").IS_EDIT
local UltraWideContainer = TS.import(script, script.Parent.Parent, "ultra-wide-container").default
local Group = TS.import(script, script.Parent, "group").default
--[[
	*
	 * Renders a collection of components under a screengui.
	 *
	 * If the game is running, the components are rendered under a `screengui`
	 * object, otherwise they are rendered under a `Group` object while in edit mode
	 * for storybook support.
	 *
	 * @example
	 *
	 * ```tsx
	 * <Layer DisplayOrder={1}>
	 * 	<TextButton Text="Button 1" />
	 * 	<TextButton Text="Button 2" />
	 * </Layer>;
	 * ```
	 *
	 * @param props - The component props.
	 * @returns The rendered Layer component.
	 * @note By default, the `ClampUltraWide` property is set to `true`. This means
	 * that the layer will be constrained to a 16:9 aspect ratio on ultra wide
	 * monitors. If you want to disable this behavior, set the property to `false`.
	 *
	 * @component
	 *
	 * @see https://developer.roblox.com/en-us/api-reference/class/ScreenGui
	 
]]
local function Layer(_param)
	local ClampUltraWide = _param.ClampUltraWide
	if ClampUltraWide == nil then
		ClampUltraWide = true
	end
	local DisplayOrder = _param.DisplayOrder
	local children = _param.children
	return if IS_EDIT then (React.createElement(Group, {
		Native = {
			ZIndex = DisplayOrder,
		},
	}, if ClampUltraWide then React.createElement(UltraWideContainer, nil, children) else children)) else (React.createElement("screengui", {
		DisplayOrder = DisplayOrder,
		IgnoreGuiInset = true,
		ResetOnSpawn = false,
		ZIndexBehavior = "Sibling",
	}, if ClampUltraWide then React.createElement(UltraWideContainer, nil, children) else children))
end
return {
	default = Layer,
}
