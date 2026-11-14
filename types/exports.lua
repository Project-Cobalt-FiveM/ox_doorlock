---@meta

---@class OxDoorlockDoor
---@field id integer
---@field name string
---@field state 0|1 0 unlocked, 1 locked
---@field coords vector3
---@field characters? string[]
---@field groups? table<string, integer> group name to minimum grade
---@field items? { name: string, remove?: boolean }[] remove takes the item on use
---@field maxDistance number

---@class OxDoorlockClientDoor : OxDoorlockDoor
---@field entity? integer
---@field distance number
---@field hideUi? boolean

---@class OxDoorlockHookOptions
---@field print? boolean print each time the hook runs
---@field nameFilter? string Lua pattern the door name must match

---@class OxDoorlockAuthorizationPayload
---@field source integer
---@field door table
---@field lockpick? boolean
---@field authorised? boolean|string

---@class OxDoorlockExports
local OxDoorlockExports = {}

---**Client.** Toggles the closest door in range, as pressing E does.
function OxDoorlockExports:useClosestDoor() end

---**Client.** The closest door in range, or nil.
---@return OxDoorlockClientDoor?
function OxDoorlockExports:getClosestDoor() end

---**Client.** The id of the closest door in range, or nil.
---@return integer?
function OxDoorlockExports:getClosestDoorId() end

---**Client.** The door id of a door entity, or nil when the entity is not a door.
---@param entityId integer
---@return integer?
function OxDoorlockExports:getDoorIdFromEntity(entityId) end

---**Client.** Picks the lock of the closest door in range with the lockpick animation.
function OxDoorlockExports:pickClosestDoor() end

---**Server.** A door by id, or false when there is none.
---@param id integer
---@return OxDoorlockDoor|false
function OxDoorlockExports:getDoor(id) end

---**Server.** Every door.
---@return OxDoorlockDoor[]
function OxDoorlockExports:getAllDoors() end

---**Server.** The first door with this name, or nil.
---@param name string
---@return OxDoorlockDoor?
function OxDoorlockExports:getDoorFromName(name) end

---**Server.** Changes a door's fields, saves it and sends it to every client. An empty string clears a field.
---@param id integer
---@param data table
function OxDoorlockExports:editDoor(id, data) end

---**Server.** Saves a new door and returns its id. Needs `coords`, or `doors` for a double door.
---@param data table
---@return integer id
function OxDoorlockExports:createDoor(data) end

---**Server.** Deletes a door; errors when there is none with this id.
---@param id integer
function OxDoorlockExports:removeDoor(id) end

---**Server.** Locks (1 or true) or unlocks (0 or false) a door. Called from a server script it skips the access check.
---@param id integer
---@param state 0|1|boolean
---@param lockpick? boolean
---@return boolean
function OxDoorlockExports:setDoorState(id, state, lockpick) end

---**Server.** Runs `callback` on an event and returns the hook id. On `doorAuthorization`, returning true lets in a player the access check refused.
---@param event 'doorAuthorization'
---@param callback fun(payload: OxDoorlockAuthorizationPayload): boolean?
---@param options? OxDoorlockHookOptions
---@return integer hookId
function OxDoorlockExports:registerHook(event, callback, options) end

---**Server.** Removes one of the calling resource's hooks, or all of them when `id` is nil.
---@param id? integer
function OxDoorlockExports:removeResourceHook(id) end
