Config = {}
Config.keys = {
    -- change the hashes to the keys u want, do not change the writings in qoutes. for example if u wana change B do ["B"] = (CHANGE THIS 0x8AAA0AD4), do not change whats inside those brackets > ["B"]
    ["G"] = 0x760A9C6F,
}


Config.devmode = false  
Config.anonwebhook = ""

Config.locationonly = false -- set to true if you want mail to only be used at the mail box location. otherwise /mail will open up mail interface 
-- note normaly it is not locationonly and it uses a pigeon to send the letters
Config.proptied = false -- enable this if you want mail to be accessable at a prop
Config.prop = "p_mailbox01x" -- you can add this prop to your furniture system and players who buy it will be able to access their mail here 
-- this goes well with location only.
Config.command = "mail"
Config.mailregisterprice = 10

Config.shownmame = true -- if false the letter will not include the senders name but will include the senders address. this allows replies 
-- and annonymos msgs 
Config.showdate = false 

Config.mailregistery = { 
    Valentine = {	   
        Pos = {x= -183.68, y=624.6, z=114.089}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Mail Office', -- blip name 
    },
	Rhodes = {	   
        Pos = {x= 1223.29, y=-1292.9, z=76.9}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Mail Office', -- blip name 
    },
	SD = {	   
        Pos = {x= 2731.3, y=-1402.4, z=46.2}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Mail Office', -- blip name 
    },
	tw = {	   
        Pos = {x = -5529.9033203125, y = -2956.2438964844, z = -0.74007713794708}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Mail Office', -- blip name 
    },
	arma = {	   
        Pos = {x=-3648.1,y=-2549.33,z=-12.83,}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Mail Office', -- blip name 
    },
    annesburg = {	   
        Pos = {x=2940.11,y=1291.12,z=44.5,}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Mail Office', -- blip name 
    },
	
}



Config.Language = {
    ["mailregistered"] = "Mail Address Registered PO Box: ",
    ['anonymous'] = "anonymous mail",
    
	["presstoshop"] = "Press ~e~G~q~ For Mail",
	["mailmenu"] = "Mail Menu",
	["registerplease"] = "You Need To Register A Mail Address At The Mail Office",
	["rigster"] = "Register Mail Address",
	["dollar"] = " $",
	["nocash"] = "Not Enough Cash",
	["addressnotfound"] = "Wrong Address",
	["already"] = "You Already have an Address. type /",
	["openmail"] = "Open Mailbox",
    ["invalidaddress"] = "Invalid addresses: ~e~",

    
}