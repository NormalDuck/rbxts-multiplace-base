-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local React = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
--[[
	*
	 * Button component.
	 *
	 * @example
	 *
	 * ```tsx
	 * <Button
	 * 	CornerRadius={new UDim(0, 8)}
	 * 	Native={{ Size: new UDim2(0, 100, 0, 100) }}
	 * 	onClick={useCallback(() => {
	 * 		print("Hello World!");
	 * 	}, [])}
	 * />;
	 * ```
	 *
	 * Button is released on the button.
	 *
	 * @param buttonProps - The properties of the Button component.
	 * @returns The rendered Button component.
	 * @component
	 *
	 * @see https://create.roblox.com/docs/reference/engine/classes/TextButton
	 
]]
local function Button(_param)
	local CornerRadius = _param.CornerRadius
	local Native = _param.Native
	local onClick = _param.onClick
	local onMouseDown = _param.onMouseDown
	local onMouseEnter = _param.onMouseEnter
	local onMouseLeave = _param.onMouseLeave
	local onMouseUp = _param.onMouseUp
	local children = _param.children
	local _object = {
		Activated = function()
			local _result = onClick
			if _result ~= nil then
				_result()
			end
		end,
		MouseButton1Down = function()
			local _result = onMouseDown
			if _result ~= nil then
				_result()
			end
		end,
		MouseButton1Up = function()
			local _result = onMouseUp
			if _result ~= nil then
				_result()
			end
		end,
		MouseEnter = function()
			local _result = onMouseEnter
			if _result ~= nil then
				_result()
			end
		end,
		MouseLeave = function()
			local _result = onMouseLeave
			if _result ~= nil then
				_result()
			end
		end,
	}
	local _result = Native
	if _result ~= nil then
		_result = _result.Event
	end
	if _result then
		for _k, _v in _result do
			_object[_k] = _v
		end
	end
	local event = _object
	local _attributes = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Event = event,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Text = "",
	}
	if Native then
		for _k, _v in Native do
			_attributes[_k] = _v
		end
	end
	return React.createElement("textbutton", _attributes, if CornerRadius then React.createElement("uicorner", {
		CornerRadius = CornerRadius,
	}) else nil, children)
end
return {
	default = Button,
}
