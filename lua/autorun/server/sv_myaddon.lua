include("autorun/sh_myaddon.lua")

util.AddNetworkString("WantedLevelSender")

PLAYER_STATUS = {
    WantedLevel = 0,
    MinWantedLevel = 0,
    MaxWantedLevel = 5,
    Message = ""
}

function PLAYER_STATUS.AddWantedLevel(i)
    if ((PLAYER_STATUS.WantedLevel + i) > PLAYER_STATUS.MaxWantedLevel) then
        PLAYER_STATUS.Message = "FAILED! Bounty Level parameter violated."
    else
        PLAYER_STATUS.WantedLevel = PLAYER_STATUS.WantedLevel + i
        PLAYER_STATUS.Message = "SUCCESS! Bounty Level increased."
    end
end

function PLAYER_STATUS.RemoveWantedLevel(i)
    if ((PLAYER_STATUS.WantedLevel - i) < PLAYER_STATUS.MinWantedLevel) then
        PLAYER_STATUS.Message = "FAILED! Bounty Level parameter violated."
    else
        PLAYER_STATUS.WantedLevel = PLAYER_STATUS.WantedLevel - i
        PLAYER_STATUS.Message = "SUCCESS! Bounty Level decreased."
    end
end

function PLAYER_STATUS.AddMaxWantedLevel()
    if (PLAYER_STATUS.WantedLevel ~= PLAYER_STATUS.MaxWantedLevel) then
        PLAYER_STATUS.WantedLevel = PLAYER_STATUS.MaxWantedLevel
        PLAYER_STATUS.Message = "SUCCESS! Bounty Level is on max level."
    else
        PLAYER_STATUS.Message = "FAILED! Already in max level"
    end
end

table.insert(PLAYER_STATUS, BountyAdd)
table.insert(PLAYER_STATUS, BountyDecrease)
table.insert(PLAYER_STATUS, BountyAddMax)
PLAYER_STATUS.BountyAdd = PLAYER_STATUS.AddWantedLevel
PLAYER_STATUS.BountyDecrease = PLAYER_STATUS.RemoveWantedLevel
PLAYER_STATUS.BountyAddMax = PLAYER_STATUS.AddMaxWantedLevel

function PLAYER_STATUS:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

Account = PLAYER_STATUS:new()

Account.BountyAdd(2)
Account.BountyAdd(2)

function SendWantedLvl(lvl, max, min)
    net.Start("WantedLevelSender")
    net.WriteString(Account.WantedLevel)
    net.WriteString(Account.MaxWantedLevel)
    net.WriteString(Account.MinWantedLevel)
    net.Broadcast()
end

SendWantedLvl()