-- Warning and Kick
local maxwarnings = 3 -- set max warnings


local Warning = class('Warning')
local Player = PlayerManager:GetLocalPlayer()
print("Player:" .. Player.name)

function Warning:__init()
  self.warnings = 0
end

function Warning:AddOne(reallybad)
  self.warnings = self.warnings + 1
  print("Received " .. self.warnings .. " of " .. maxwarnings .. " Chat Warnings")
  ChatManager:SendMessage("I Received A Warning for Bad Language: ".. self.warnings .. " out of " .. maxwarnings)
end

-- Receive NETEVENT
NetEvents:Subscribe("Warning", function(arg)

  Warning:AddOne()
  if Warning.warnings == maxwarnings then
    NetEvents:Send("Kick", Player)
  end

end)


--Init
Events:Subscribe('Player:Connected', function(player)
    Warning:__init()
end)
