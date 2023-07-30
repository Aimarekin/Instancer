local propPriority = require(script.Parent.Parent.Definitions.propPriorities).Bindings

function ResizeExecute(self, rbx: Instance, callback: (Instance, Vector2) -> ())
    local connection: RBXScriptConnection? = nil

    local function ResizeConnection()
        callback(rbx, (rbx.Parent :: GuiBase2d).AbsoluteSize)
    end

    local function AttemptToConnect()
        if connection then
            connection:Disconnect()
            connection = nil
        end

        if rbx.Parent and rbx.Parent:IsA("GuiBase2d") then
            ResizeConnection()
            connection = rbx.Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(ResizeConnection)
        end
    end

    AttemptToConnect()
    rbx:GetPropertyChangedSignal("Parent"):Connect(AttemptToConnect)
end

return {
    type = "SpecialProp",
    propName = "Resize",
    priority = propPriority,
    execute =  ResizeExecute
}