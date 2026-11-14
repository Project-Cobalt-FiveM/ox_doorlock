local ox_inventory <const> = exports.ox_inventory

---@class DoorlockInventorySlot
---@field slot integer
---@field count integer

---@class DoorlockInventory
local inventory <const> = {}

---@param playerId integer
---@param search 'slots'
---@param itemName string
---@param metadata? table | string
---@return DoorlockInventorySlot[]
function inventory:Search(playerId, search, itemName, metadata)
    return ox_inventory:Search(playerId, search, itemName, metadata) or {}
end

---@param playerId integer
---@param itemName string
---@param count integer
---@param metadata? table | string
---@param slot? integer
---@return boolean
function inventory:RemoveItem(playerId, itemName, count, metadata, slot)
    return ox_inventory:RemoveItem(playerId, itemName, count, metadata, slot)
end

return inventory
