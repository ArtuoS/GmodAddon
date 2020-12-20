include("autorun/sh_myaddon.lua")

local Frame = vgui.Create( "DFrame" )
Frame:SetTitle( "Simple Panel" )
Frame:SetSize(300, 300)
Frame:Center()
Frame:MakePopup()
Frame.Paint = function(self, w, h)
    draw.RoundedBox(5, 0, 0, w, h, Color(50, 94, 168))
end

ButtonKillAll = vgui.Create( "DButton", Frame )
ButtonKillAll:SetText( "Kill All Players" )
ButtonKillAll:SetTextColor(Color(255, 255, 255))
ButtonKillAll:SetPos(5, 30)
ButtonKillAll:SetSize(100, 30)
ButtonKillAll.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(81, 115, 173))
end
ButtonKillAll.DoClick = function()
    net.Start("KillAllPlayers")
    net.SendToServer()
end

ButtonSetLife = vgui.Create( "DButton", Frame )
ButtonSetLife:SetText( "Kill All Players" )
ButtonSetLife:SetTextColor(Color(255, 255, 255))
ButtonSetLife:SetPos(110, 30)
ButtonSetLife:SetSize(100, 30)
ButtonSetLife.Paint = function(self, w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(81, 115, 173))
end
ButtonSetLife.DoClick = function()
    net.Start("SetPlayerHealth")
    net.SendToServer()
end