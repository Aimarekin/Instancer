local Instancer = require(game.ReplicatedStorage.Instancer)

local New, Interface, Children, On = Instancer.New, Instancer.Interface, Instancer.Children, Instancer.On

Interface "InstancerTest" {
    [ Children ] = {
        New "Frame" {
            Size = UDim2.new(0.5, 0, 0.5, 0),
            MaxSize = Vector2.new(300, 300),
            AspectRatio = 3/2,
            Align = "center",

            [ Children ] = {
                New "TextLabel" {
                    Size = UDim2.fromScale(1, 1),
                    Text = "Hello, world!"
                }
            }
        }
    }
}