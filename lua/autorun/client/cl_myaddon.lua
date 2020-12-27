include("autorun/sh_myaddon.lua")

net.Receive("WantedLevelSender", function()
    clWantedLevel = net.ReadString()
    clMaxWantedLevel = net.ReadString()
    clMinWantedLevel = net.ReadString()
end)

print("Wanted Lvl: " .. clWantedLevel)
print("Min Lvl: " .. clMinWantedLevel)
print("Max Lvl: " .. clMaxWantedLevel)

local frame = vgui.Create( "DFrame" )
frame:SetTitle( "Dock Test" )
frame:SetSize( 256, 256 )
frame:Center()
frame:MakePopup()

local panel = vgui.Create( "DPanel", frame )
panel:Dock( FILL )
panel:DockMargin( 0, 0, 0, 0 )

for i = 1, clWantedLevel, 1 do
	local label = vgui.Create( "DLabel", panel )
	label:Dock( TOP )
	label:DockMargin( 4, 0, 0, 0 ) -- shift to the right
	label:SetColor( color_black )
	label:SetText( "Wanted Lvl " .. i )
end