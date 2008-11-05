--[[
    This change log was meant to be viewed in game.
    You may do so by typing: /wim changelog
]]

local log = {};
local t_insert = table.insert;

local function addEntry(version, rdate, description)
    t_insert(log, {v = version, r = rdate, d = description});
end


-- ChangeLog Entries.
addEntry("3.0.4", "10/??/2008", [[
    *History frame was named incorrectly. 'WIM3_HistoryFrame' is its new name.
    *Socket only compresses large transmissions to minimize resource usage.
    *Optimized tabs.
    *Tabs scroll correctly now.
    *Location button on shortcut uses special W2W tooltip if applicable.
    *History viewer wasn't displaying realms which had punctuation characters in it.
]]);
addEntry("3.0.3", "10/23/2008", [[
    +Added Tab Management module. (Auto grouping of windows.)
    *Avoid any chances of dividing by 0 in window animation.
    *Changed window behavior priorities to: Arena, Combat, PvP, Raid, Party, Resting Other.
    *Fixed bug when running WIM on WOTLK.
    +W2W Typing notifiction is triggered from the default chat frame now too.
    -W2W will no longer notify user as typing if user is typing a slash command.
    *Fixed a resizing bug when using tabs. Entire tab group inherrits size until removed.
    +Added ChangeLog.lua (contains release information to be used later.)
    *Corrected shaman class color.
    *Focus gain also respects Blizzard's ChatEditFrame.
    *Filters are no longer trimmed.
    +Added deDE localizations.
    +Added sound options.
    +Added some stock sound files.
]]);