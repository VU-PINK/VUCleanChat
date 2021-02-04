# VUCleanChat
A mod to keep the VU servers/chats clean of bad language

Edit banned words in /ext/server/banned.lua

Change maximum warnings in /ext/server/_ _init_ _.lua

## How it works:

Add your banned words into the table, don´t forget to add a comma between words:

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

