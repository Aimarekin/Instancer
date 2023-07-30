local Instantiate = require(script.Parent.Parent.Instance.Instantiate)
local Hydrate = require(script.Parent.Parent.Instance.Hydrate)

function Interface(Name: string)
    return function(props: {}?)
        local rbx: ScreenGui = Instantiate("ScreenGui")

        if props then
            Hydrate(rbx, props)
        end

        rbx.Name = Name
        rbx.Parent = game.Players.LocalPlayer.PlayerGui

        return rbx
    end
end

return Interface