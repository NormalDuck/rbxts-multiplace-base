
local a=require(game:GetService"ReplicatedStorage":WaitForChild"rbxts_include":WaitForChild"RuntimeLib")
local b=a.import(script,game:GetService"ReplicatedStorage","rbxts_include","node_modules","@rbxts","services").Players
local c=a.import(script,game:GetService"ServerScriptService","TS","store").store
local d=a.import(script,game:GetService"ReplicatedStorage","common","utils","retrier").retry
local function processReceipt(e)local
f, g=pcall(function()
d(function()
local f=b:GetPlayerByUserId(e.PlayerId)
c.patchPurchaseHistory(f,{
assetid=e.ProductId,
timestamp=DateTime.now():ToIsoDate(),
robux=e.CurrencySpent,
})
end,3,1):await()
end)
if f then
return Enum.ProductPurchaseDecision.PurchaseGranted
end
return Enum.ProductPurchaseDecision.NotProcessedYet
end
return{
processReceipt=processReceipt,
}