--// BLACKZX HUB
--// AUTOBALL - MOBILE

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--// GUI
local Gui = Instance.new("ScreenGui")
Gui.Name = "BlackzxHub"
Gui.ResetOnSpawn = false
Gui.Parent = PlayerGui

--// BOLINHA
local Button = Instance.new("TextButton")
Button.Name = "BlackzxButton"
Button.Size = UDim2.fromOffset(62, 62)
Button.Position = UDim2.new(0, 25, 0.5, -31)
Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Button.Text = "⚽"
Button.TextSize = 28
Button.TextColor3 = Color3.new(1, 1, 1)
Button.BorderSizePixel = 0
Button.Parent = Gui

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(1, 0)
ButtonCorner.Parent = Button

local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(80, 80, 80)
Stroke.Parent = Button

--// MENU
local Menu = Instance.new("Frame")
Menu.Name = "BlackzxMenu"
Menu.Size = UDim2.fromOffset(210, 125)
Menu.Position = UDim2.new(0, 95, 0.5, -62)
Menu.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Menu.BorderSizePixel = 0
Menu.Visible = false
Menu.Parent = Gui

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 14)
MenuCorner.Parent = Menu

local MenuStroke = Instance.new("UIStroke")
MenuStroke.Thickness = 2
MenuStroke.Color = Color3.fromRGB(55, 55, 55)
MenuStroke.Parent = Menu

--// TÍTULO
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 38)
Title.BackgroundTransparency = 1
Title.Text = "Blackzx Hub"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 19
Title.Font = Enum.Font.GothamBold
Title.Parent = Menu

--// AUTOBALL
local AutoButton = Instance.new("TextButton")
AutoButton.Size = UDim2.new(1, -20, 0, 55)
AutoButton.Position = UDim2.new(0, 10, 0, 48)
AutoButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AutoButton.Text = "⚽  Autoball: OFF"
AutoButton.TextColor3 = Color3.new(1, 1, 1)
AutoButton.TextSize = 17
AutoButton.Font = Enum.Font.GothamBold
AutoButton.BorderSizePixel = 0
AutoButton.Parent = Menu

local AutoCorner = Instance.new("UICorner")
AutoCorner.CornerRadius = UDim.new(0, 10)
AutoCorner.Parent = AutoButton

local Enabled = false
local MenuOpen = false

--// ABRIR / FECHAR MENU
Button.Activated:Connect(function()
    MenuOpen = not MenuOpen
    Menu.Visible = MenuOpen
end)

--// AUTOBALL ON / OFF
AutoButton.Activated:Connect(function()
    Enabled = not Enabled

    if Enabled then
        AutoButton.Text = "⚽  Autoball: ON"
        AutoButton.BackgroundColor3 = Color3.fromRGB(35, 135, 65)
        Stroke.Color = Color3.fromRGB(70, 220, 100)

        -- Coloque aqui a função permitida do seu próprio jogo.

    else
        AutoButton.Text = "⚽  Autoball: OFF"
        AutoButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Stroke.Color = Color3.fromRGB(80, 80, 80)

        -- Desative aqui a função do seu próprio jogo.
    end
end)

--// ARRASTAR A BOLINHA NO CELULAR
local Dragging = false
local DragStart
local StartPosition
local Moved = false

Button.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.Touch
    or Input.UserInputType == Enum.UserInputType.MouseButton1 then

        Dragging = true
        Moved = false
        DragStart = Input.Position
        StartPosition = Button.Position
    end
end)

UIS.InputChanged:Connect(function(Input)
    if not Dragging then
        return
    end

    if Input.UserInputType == Enum.UserInputType.Touch
    or Input.UserInputType == Enum.UserInputType.MouseMovement then

        local Delta = Input.Position - DragStart

        if Delta.Magnitude > 5 then
            Moved = true

            Button.Position = UDim2.new(
                StartPosition.X.Scale,
                StartPosition.X.Offset + Delta.X,
                StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y
            )

            Menu.Position = UDim2.new(
                Button.Position.X.Scale,
                Button.Position.X.Offset + 70,
                Button.Position.Y.Scale,
                Button.Position.Y.Offset - 30
            )
        end
    end
end)

UIS.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.Touch
    or Input.UserInputType == Enum.UserInputType.MouseButton1 then

        Dragging = false
    end
end)

print("Blackzx Hub carregado!")