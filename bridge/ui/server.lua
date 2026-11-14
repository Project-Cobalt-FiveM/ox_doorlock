local core <const> = exports.cobalt_core

---@param playerId integer
---@param data table
---@diagnostic disable-next-line: duplicate-set-field
function lib.notify(playerId, data)
    data.description = data.description and locale(data.description)
    core:Notify(playerId, data)
end
