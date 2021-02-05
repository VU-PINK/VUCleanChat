# VUCleanChat
A smol mod to keep the VU servers/chats clean of bad language

Edit banned words in /ext/server/banned.lua

Change maximum warnings in /ext/client/init.lua

Scans for "Banned Words" in Chat Messages. Every detection adds a warning. If max warnings are exceeded -> Player gets kicked


## How it works:

Add your banned words (lowercase) into the table, don´t forget to add a comma between words:

banned = {

"bannedword1",
"bannedword2",
.
.
.

}

Words in instantkick{} will lead to instant kick duh:

instantkick = {

"word",
.
.
.

}



