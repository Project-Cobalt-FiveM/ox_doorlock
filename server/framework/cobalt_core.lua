local core <const> = exports.cobalt_core

---@class DoorlockPlayer
---@field source integer

---@param playerId integer
---@return DoorlockPlayer?
function GetPlayer(playerId)
    if core:GetPlayer(playerId) then
        return { source = playerId }
    end
end

---@param player DoorlockPlayer
---@return string?
function GetCharacterId(player)
    return core:GetPlayer(player.source)?.PlayerData.citizenid
end

---@param group { name: string, grade?: { level: integer } }?
---@param filter string | string[] | table<string, integer>
---@return boolean
local function groupMatches(group, filter)
    if not group or not group.name then return false end

    if type(filter) == 'string' then
        return group.name == filter
    end

    if table.type(filter) == 'array' then
        return table.contains(filter, group.name)
    end

    local minGrade <const> = filter[group.name]

    return minGrade ~= nil and (group.grade?.level or 0) >= minGrade
end

---@param player DoorlockPlayer
---@param filter string | string[] | table<string, integer>
---@return string?
---@return integer?
function IsPlayerInGroup(player, filter)
    local data <const> = core:GetPlayer(player.source)?.PlayerData

    if not data then return end

    for _, group in ipairs({ data.org or false, data.job, data.gang }) do
        if group and groupMatches(group, filter) then
            return group.name, group.grade?.level
        end
    end
end
