# VUCleanChat
A mod to keep the VU servers/chats clean of bad language

Edit banned words in /ext/server/banned.lua

## How it works:

Add your banned words here, don´t forget to add a comma between words:

banned = {

"bannedword1",
"bannedword2",
.
.
.

}

Words in instantkick{} will lead to instant kick duh:

instantkick = {

"word"
.
.
.

}

