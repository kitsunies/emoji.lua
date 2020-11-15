<h1 align=center>emoji.lua 💬</h1>
<h3 align=center>Basic emoji support for Lua</h3>

# lurror.lua

[lurror.lua](lurror.lua) is a module that adds structured exceptions to Lua. Exceptions, like coroutines are not used very frequently in Lua because they solve cross-cutting concerns(*) that don't appear very often in code. But when they do appear, these devices are invaluable code decluttering tools.

Structured exceptions are an enhancement over string exceptions that enable _selective catching_ and allow _providing a context_ for the failure to help with recovery or logging.

> (*) Coroutines address the problem of inversion-of-control head-on.\
> Exceptions address the problem of recoverable failure head-on, so they're most useful in network I/O contexts.

The name Lurror comes from the amalgamation of the two phonetic sounds of the two words _"Lua"_ and _"Error"_; Combined together to create **Lurror**!

### NOTE!

**In the API `classes` can be given as `'classname1 ...'` or `{class1 -> true}`. When in table form, you must include all the superclasses in the table as they are not added automatically!**

# Installation

Copy the [emoji](emoji) folder somewhere where your Lua interpreter will be able to find it and require it accordingly:

```lua
local emoji = require('emoji')
```

# Interface

### lurror.error

Returns the base class for errors.

```lua
lurror.error
```

- `lurror` is the module returned by [lurror.lua](lurror.lua)
- `error` is the base class for errors

# License

This library is free software; You may redistribute and/or modify it under the terms of the MIT license. See [LICENSE](LICENSE) for details.

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE3NjM2NTI4MjVdfQ==
-->