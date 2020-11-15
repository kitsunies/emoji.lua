<h1 align=center>emoji.lua 💬</h1>
<h3 align=center>A basic emoji support module for Lua</h3>

# Installation

Copy the [emoji](emoji) folder somewhere where your Lua interpreter will be able to find it and require it accordingly:

```lua
local emoji = require('emoji')
```

# Interface

### emoji.get

```lua
emoji.get("tea") -> "🍵"
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

Replaces emojis by callback method

# License

This library is free software; You may redistribute and/or modify it under the terms of the MIT license. See [LICENSE](LICENSE) for details.
