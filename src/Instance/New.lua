local Instantiate = require(script.Parent.Instantiate)
local Hydrate = require(script.Parent.Hydrate)

function New(className: string)
    return function(props: {}?)
        local rbx = Instantiate(className)
        
        if props then
            Hydrate(rbx, props)
        end

        return rbx
    end
end

return New