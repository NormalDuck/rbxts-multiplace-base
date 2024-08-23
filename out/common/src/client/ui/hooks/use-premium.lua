-- Compiled with roblox-ts v2.3.0-dev-8137656
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local useEventListener = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "pretty-react-hooks", "out").useEventListener
local useState = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react").useState
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local LocalPlayer = TS.import(script, script.Parent.Parent.Parent, "constants", "localplayer").LocalPlayer
--[[
	*
	 * Returns whether the local player has a premium membership or not. This will
	 * update when the player's membership changes.
	 *
	 * @returns True if the local player has a premium membership.
	 
]]
local function usePremium()
	local isPremium, setIsPremium = useState(LocalPlayer.MembershipType == Enum.MembershipType.Premium)
	useEventListener(Players.PlayerMembershipChanged, function(player)
		if player == LocalPlayer then
			setIsPremium(player.MembershipType == Enum.MembershipType.Premium)
		end
	end)
	return isPremium
end
return {
	usePremium = usePremium,
}
