include("opurge_config.lua")

--<>-- Offshorp Copyright
--<>-- Please don't edit if you respect my job
print(" ")
--<>-- Offshorp Copyright
--<>-- Please don't edit if you respect my job
MsgC( Color( 255, 255, 0 ), "###################################" )
--<>-- Offshorp Copyright
--<>-- Please don't edit if you respect my job
print(" ")
--<>-- Offshorp Copyright
--<>-- Please don't edit if you respect my job
print("O'Purge - A new Purge System")
--<>-- Offshorp Copyright
--<>-- Please don't edit if you respect my job
print("version 1.0.0")
--<>-- Offshorp Copyright
--<>-- Please don't edit if you respect my job
print(" ")
--<>-- Offshorp Copyright
--<>-- Please don't edit if you respect my job
print("by Offshorp")
--<>-- Offshorp Copyright
--<>-- Please don't edit if you respect my job
print("https://offshorp.com")
--<>-- Offshorp Copyright
--<>-- Please don't edit if you respect my job
MsgC( Color( 255, 255, 0 ), "###################################" )
--<>-- Offshorp Copyright
--<>-- Please don't edit if you respect my job
print(" ")
--<>-- Offshorp Copyright
--<>-- Please don't edit if you respect my job

--<>-- My fonts
surface.CreateFont( "KillHUDFont", {
    font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 35,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = true,
    additive = false,
    outline = false,
} )
surface.CreateFont( "OPurgeFont", {
    font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 15,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = true,
    additive = false,
    outline = false,
} )
surface.CreateFont( "OPurgeAdvert", {
    font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
    extended = false,
    size = 20,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = true,
    additive = false,
    outline = false,
} )

--<>-- Admin Panel
local function OPurgeAdminMenu()
    local frame = vgui.Create( "DFrame" )
        frame:SetTitle( "O'Purge by Offshorp" )
        frame:SetSize( 155, 75 )
        frame:Center()
        frame:MakePopup()
        frame:ShowCloseButton(false)
        frame.Paint = function()
            surface.SetDrawColor( 0, 0, 0, 200 )
            surface.DrawRect( 0, 0, 300, 275 )
        end

    local DermaButton = vgui.Create( "DButton", frame )
        DermaButton:SetText( "✖" )
        DermaButton:SetPos( 135, 5 )
        DermaButton:SetSize( 15, 15 )
        DermaButton:SetColor( Color(255,0,0,255) )
        DermaButton.Paint = function()
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.DrawRect( 0, 0, 135, 30 )
        end
        DermaButton.DoClick = function()
            frame:Close()
        end

    --<>-- 1
    local DermaButton = vgui.Create( "DButton", frame )
        DermaButton:SetText( "Launch Purge Advert" )
        DermaButton:SetPos( 10, 35 )
        DermaButton:SetSize( 135, 30 )
        DermaButton:SetColor( Color(0,0,0,255) )
        DermaButton.Paint = function()
            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.DrawRect( 0, 0, 135, 30 )
        end
        DermaButton.DoClick = function()
            surface.PlaySound( "purge_"..OPurge_Language..".mp3" )
            frame:Close()
        end
end
concommand.Add("opurge_adminmenu_open", OPurgeAdminMenu)

hook.Add( "OnPlayerChat", "AdminMenuCommand", function( ply, strText, bTeam, bDead )
    if ( ply != LocalPlayer() ) then return end

    strText = string.lower( strText )

    if ( strText == "!opurge" ) and ply:GetUserGroup() == OPurge_Ranks then
        RunConsoleCommand( "opurge_adminmenu_open" )
        return true
    end
end )