local emoji = require("emoji")
local say = require("say")

local function block(test)
    return (test.emoji and test.key) and true or false
end

describe("emoji", function()

    it("get", function()
        assert.are.same("🍪", emoji.get("🍪"))
    end)
    
    it("which", function()
        assert.are.same("🍪", emoji.which("🍪")) 
    end)
    
    it("emojify", function()
        assert.are.same("I ❤️ 🍪!", emoji.emojify("I :redheart: :cookie:!"))
    end)
    
    it("unemojify", function()
        assert.are.same("I :redheart: :cookie:!", emoji.unemojify("I ❤️ 🍪!"))
    end)
    
    it("random", function()
        assert.True(block(emoji.random()))
    end)
    
    it("search", function()
        assert.True(block(emoji.search("cof")[1]))
    end)
    
    it("find", function()
        assert.True(block(emoji.find("🍪")))
    end)
    
    it("has", function()
        assert.True(emoji.has("🍪"))
    end)
    
    it("strip", function()
        assert.are.same("I see you... ", emoji.strip("I see you... 👀"))
    end)
    
    it("replace", function()
        assert.are.same("I see you... eyes", emoji.replace("I see you... 👀", function(emoji) return emoji.key end))
    end)
    
end)
