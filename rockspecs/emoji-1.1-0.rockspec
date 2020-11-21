package = "emoji"
version = "1.1-0"
source = {
    url = "git+https://github.com/kitsunies/emoji.lua.git",
    tag = "v1.1-0"
}
description = {
    homepage = "https://github.com/kitsunies/emoji.lua",
    license = "MIT",
}
dependencies = {
    "lua >= 5.1"
}
build = {
    type = "builtin",
    modules = {
        emoji = "emoji.lua"
    }
}
