local New = require(script.Parent.Parent.Instance.New)
local Hydrate = require(script.Parent.Parent.Instance.Hydrate)

function Component(className: string)
    return function(baseProps: {})
        return function(props: {}?)
            local rbx = New(className)(baseProps)
            
            if props then
                Hydrate(rbx, props)
            end
            
            return rbx
        end
    end
end

return Component