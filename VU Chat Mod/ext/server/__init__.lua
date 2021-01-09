local CleanChat = class('CleanChat')

--Initialize
function CleanChat:__init()
    local Common = require '__shared/common'
    print('getting Server')
    print('VU Clean Chat Server initializing')
    print('Version:')
    print(MyModVersion)
    local RequireBanList = require 'banned'
    if RequireBanList=='Ban-List loaded' then
      print(RequireBanList)
      print('VU Clean Chat Server ready!')
    end
end

--Print Player joining to Chat & Console [FOR_TESTING]
--Events:Subscribe('Player:Joining', function(name, playerGuid, ipAddress, accountGuid)
    --print('Player "' .. name .. '" is joining!')
    --ChatManager:SendMessage('Player "' .. name .. '" is joining!')
--end)

--Analyze Messages [WIP]
Events:Subscribe('Player:Chat', function(player, recipientMask, message)
    print('Message analyzed')
    if string.find(message, table.concat(BannedWords, ' ')) then
      function BannedWordDetected()
        print('Banned Word Detected')
        print('add Warning/Kick function here')
        NetEvents:Broadcast('CleanChat', 'Word is Banned, player')
      end
    BannedWordDetected()
    end
end)


--Run
CleanChat:__init()

return 'Server loaded'
