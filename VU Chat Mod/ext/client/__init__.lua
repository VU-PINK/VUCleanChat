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
--local RequireServer = require ('__server.__init__')
--function UserChat()
    --if BannedWordDetected()==true then
    --end
--end



return CleanChat
