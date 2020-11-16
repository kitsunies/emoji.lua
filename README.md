<h1 align=center>emoji.lua 💬</h1>
<h3 align=center>A basic emoji support module for Lua 🌙</h3>

# Example

```lua
local emoji = require("emoji")

print(emoji.emojify("I :heart: :tea:!"))
--> "I ❤️ 🍵!"
```

# Installation

## Luarocks

If you are using [luarocks](https://luarocks.org), just run:

```
luarocks install emoji
```

## Manual

Copy the [emoji](emoji) folder somewhere where your Lua interpreter will be able to find it and require it accordingly:

```lua
local emoji = require('emoji')
```

# Interface

## Methods

### emoji.get

```lua
emoji.get("wavinghand", emoji.light) -> "👋🏻"
```

Returns the emoji of the query

### emoji.which

```lua
emoji.which("🍵") -> "tea"
```

Returns the name of an emoji

### emoji.emojify

```lua
emoji.emojify("I :heart: :tea:!") -> "I ❤️ 🍵!"
```

Replaces all :emoji: with the actual emoji

### emoji.unemojify

```lua
emoji.unemojify("I ❤️ 🍵!") -> "I :heart: :tea:!"
```

Replaces all the emojis with the emoji's tag

### emoji.random

```lua
emoji.random() -> { emoji = "🌼", key = "blossom" }
```

Returns a random emoji + key table

### emoji.search

```lua
emoji.search("coff") -> {{ emoji = "☕️", key = "coffee" }, { emoji = "⚰", key = "coffin" }}
```

Returns a table of tables with matching emojis

### emoji.find

```lua
emoji.find("🍵" | "tea") -> { emoji = "🍵", key = "tea" }
```

Returns a emoji + key table of the emoji

### emoji.has

```lua
emoji.find("🍵" | "tea") -> true
```

Validates whether the given emoji exists

### emoji.strip

```lua
emoji.strip("I see you... 👀") -> "I see you..."
```

Strips the string from emojis

### emoji.replace

```lua
emoji.replace("I see you... 👀", function(emoji) return emoji.key end) -> "I see you... eyes"
```

Replaces emojis by a callback method

## Options

### missing

`emoji.emojify(str, missing)`

As second argument,  `emojify`  takes an handler to parse unknown emojis. Provide a function to add your own handler:

```lua
local missing = function(tag)
    return tag:upper()
end)

local emojified = emoji.emojify('I :unknown_emoji: :star:', onMissing);
--> emojified: "I UNKNOWN_EMOJI ⭐️"
```

### format

`emoji.emojify(str, missing, format)`

As third argument,  `emojify`  takes an handler to wrap parsed emojis. Provide a function to place emojis in custom elements, and to apply your custom styling:

```lua
local format = function(emoji)
    return '<img alt="' .. emoji.emoji .. '" src="' .. emoji.key .. '.png />'
end)

local emojified = emoji.emojify("I :heart: :tea:", nil, format)
--> emojified: "I <img alt="❤️" src="heart.png" /> <img alt="🍵" src="tea.png" />"
```

# Testing
Install busted & luacheck `luarocks install busted && luarocks install luacheck` and run:

```
$ busted
$ luacheck emoji.lua
```

# License

This library is free software; You may redistribute and/or modify it under the terms of the MIT license. See [LICENSE](LICENSE) for details.
