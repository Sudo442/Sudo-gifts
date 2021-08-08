# Sudo-gifts
This is a FiveM script for the QBCore framework.

The script allows new players to receive a 'welcome' gift for joining the server. Gifts and probabilities can be configured in sudo-gifts/server.lua

Gifts can also be given out by an admin typing /gift

How to install?

1. Download the repository to your resources folder, anywhere is fine.
2. Go to your Qbus Core, in my case this is named QB-Core and add the following in the shared.lua file 

["welcomegift"] 				 = {["name"] = "welcomegift", 			 	  	["label"] = "Welcome Gift", 		    ["weight"] = 0, 		["type"] = "item", 		["image"] = "kadoo.png", 		    	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Awarded to every player as a thanks for playing!"},

3. In your shared.lua, navigate to 'Shared.StarterItems' and add this - ["welcomegift"] = {amount = 1, item = "joint"},
4. Add to your CFG and enjoy!!!
