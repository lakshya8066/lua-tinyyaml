local busted = require('busted')
local assert = require('luassert')
local yaml   = require('tinyyaml')

busted.describe("numbers in nested seq:", function ()
    local parsed_yaml = yaml.parse(io.open("spec/number.yaml"):read('*a'))
    busted.it("numbers", function ()
        assert.same(
            {
                case = {{"status", "==", 302}}
            },
            yaml.parse([[
                case:
                - - "status"
                  - "==" 
                  - 302
                ]]
            )
        )
    end)

    busted.it("numbers in inline nested seq:", function ()
        assert.same(
            {
                case = {{"status", "==", 302}}
            },
            yaml.parse([[
                case:
                - 
                  - "status"
                  - "==" 
                  - 302
                ]]
            )
        )
    end)

    busted.it("number inside [] brackets", function ()
        assert.same(
            {
                case = {{"status", "==", 302}}
            }, parsed_yaml
        )
    end)
end)
