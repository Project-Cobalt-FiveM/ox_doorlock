local core <const> = exports.cobalt_core

---@param data table
---@diagnostic disable-next-line: duplicate-set-field
function lib.notify(data)
    core:Notify(data)
end

---@param text string
---@param options? table
---@diagnostic disable-next-line: duplicate-set-field
function lib.showTextUI(text, options)
    core:ShowTextUI(text, options)
end

---@diagnostic disable-next-line: duplicate-set-field
function lib.hideTextUI()
    core:HideTextUI()
end

---@param difficulty SkillCheckDifficulity | SkillCheckDifficulity[]
---@param inputs? string[]
---@return boolean?
---@diagnostic disable-next-line: duplicate-set-field
function lib.skillCheck(difficulty, inputs)
    return core:SkillCheck(difficulty, inputs)
end

---@param heading string
---@param rows (string | table)[]
---@param options? table
---@return any[]?
---@diagnostic disable-next-line: duplicate-set-field
function lib.inputDialog(heading, rows, options)
    return core:InputDialog(heading, rows, options)
end
