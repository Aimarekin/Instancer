local Children = require(script.Parent.Parent.SpecialProps.Children)

function AttemptToAddChild(props: {}, child: Instance)
    if props[Children] ~= nil then
        table.insert(props[Children], child)
    else
        props[Children] = { child }
    end
end

return AttemptToAddChild