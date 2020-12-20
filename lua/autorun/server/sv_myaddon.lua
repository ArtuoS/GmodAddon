include("autorun/sh_myaddon.lua")

util.AddNetworkString("KillAllPlayers")
util.AddNetworkString("SetPlayerHealth")

local function KillAllPlayers()
    local players = player.GetAll()
    for i, ply in ipairs(players) do
        ply:Kill()    
        print(ply:Nick() .. " got killed.")
    end
end

local function SetPlayerHealth()
    local players = player.GetAll()
    for i, ply in ipairs(players) do
        ply:SetHealth(100)    
    end
end

local function NetReceiver(strNet, func)
    net.Receive(strNet, function()
        local runThisFunction = func
    end)
end

--net.Receive("KillAllPlayers", function()
--    KillAllPlayers()
--end)

--net.Receive("SetPlayerHealth", function()
--    SetPlayerHealth()
--end)