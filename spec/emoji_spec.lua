local emoji = require("emoji")
local s = require("say")

local function is_emoji_block(test)
    return (test.emoji and test.key) and true or false
end

say:set("assertion.is_emoji_block.positive", "Expected %s \nto have property: %s")
say:set("assertion.is_emoji_block.negative", "Expected %s \nto not have property: %s")
assert:register("assertion", "is_emoji_block", is_emoji_block, "assertion.is_emoji_block.positive", "assertion.is_emoji_block.negative")

describe("emoji", function()

    it("get", function()
        assert.are.same("☕", emoji.get("coffee"))
    end)
    
    it("which", function()
        assert.are.same("coffee", emoji.which("☕")) 
    end)
    
    it("emojify", function()
        assert.are.same("I 😍 ☕!", emoji.emojify("I :hearteyes: :coffee:!"))
    end)
    
    it("unemojify", function()
        assert.are.same("I :heart: :tea:!", emoji.unemojify("I ❤️ ☕!"))
    end)
    
    it("random", function()
        assert.is_emoji_block(emoji.random())
    end)
    
    it("search", function()
        assert.is_emoji_block(emoji.search("coff")[1])
    end)
    
    it("find", function()
        assert.is_emoji_block(emoji.find("🍵"))
    end)
    
    it("has", function()
        assert.True(emoji.has("🍵"))
    end)
    
    it("strip", function()
        assert.are.same("I see you... ", emoji.strip("I see you... 👀"))
    end)
    
    it("replace", function()
        assert.are.same("I see you... eyes", emoji.replace("I see you... 👀", function(emoji) return emoji.key end))
    end)
    
end)
