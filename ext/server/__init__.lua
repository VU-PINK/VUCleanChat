require 'banned'

-- Check Message
Events:Subscribe('Player:Chat', function(player, recipientMask, message)
    --Check()
    --print("Message detected")
    local loweredmessage = string.lower(message)
    local tableconcat = table.concat(banned, ' ')
    local tableconcat2 = table.concat(instantkick, ' ')
    for token in string.gmatch(tableconcat, "[^%s]+") do
      --print(token)
        if string.find(loweredmessage, token) then
          ChatManager:Yell("KEEP THE CHAT CLEAN", 20, player)
          NetEvents:SendTo("Warning", player, "Add Warning")
        end
    end
    for token in string.gmatch(tableconcat2, "[^%s]+") do
        if string.find(loweredmessage, token) then
          player:Kick("We don´t support Racism")
        end
    end
end)


-- Kick Player
NetEvents:Subscribe("Kick", function(Player)

  print("Kicked Player: " .. Player.name .. " ; Reason: Bad Chat")
  Player:Kick("Warnings exceeded.")

end)
