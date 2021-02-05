-- Warning and Kick
local maxwarnings = 3 -- set max warnings


local Warning = class('Warning')
local Player = PlayerManager:GetLocalPlayer()
print("Player:" .. Player.name)

local censor = nil

function Warning:__init()
  self.warnings = 0
end

function Warning:AddOne()
  self.warnings = self.warnings + 1
  print("Received " .. self.warnings .. " of " .. maxwarnings .. " Chat Warnings")
  ChatManager:SendMessage("Received Warning for Bad Language: ".. self.warnings .. " / " .. maxwarnings)
end

-- Receive NETEVENT
NetEvents:Subscribe("Warning", function()
  censor = badmessage
  -- Add Warning
  Warning:AddOne()
  -- Kick on Maximum Warnings
  if Warning.warnings == maxwarnings then
    NetEvents:Send("Kick", Player)
  end

end)

-- Block Message
NetEvents:Subscribe("Censor", function(badmessage)
  censor = badmessage
end)

Hooks:Install('ClientChatManager:IncomingMessage', 1, function(hook, message, playerId, recipientMask, channelId, isSenderDead)
  if message == censor then
    hook:Pass('[deleted]', message, playerId, recipientMask, channelId, isSenderDead)
    print("Censored Message")
  end
end)

--Init
Events:Subscribe('Extension:Loaded', function()
    Warning:__init()
end)
