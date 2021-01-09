class('CleanChat')

--Initialize
function CleanChat:__init()
    local Common = require '__shared/common'
    --local RequireServer = require '__server/__init__'
    print('Version:')
    print(MyModVersion)
    print('VU Clean Chat Client ready!')
    print('Placeholder')
end

CleanChat:__init()

--ChatFunction [WIP]

NetEvents:Subscribe('CleanChat', function(data)
    print('Got NetEvent from server with data:')
    print(data)
      Hooks:Install('UI:CreateChatMessage', 100, function(hookCtx, message, channelId, playerId, recipientMask, isSenderDead)
        if data=='Word is Banned' then
          hookCtx:Pass('[deleted]', channelId, playerId, recipientMask, isSenderDead)
          function reset()
            if data==('Word is Banned') then
              data = 'reset'
            end
          end
          reset()
        else
          hookCtx:Pass(message, channelId, playerId, recipientMask, isSenderDead)
        end
      end)
end)









return CleanChat
