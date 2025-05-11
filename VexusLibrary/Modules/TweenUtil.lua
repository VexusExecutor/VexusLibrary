local TweenService = game:GetService("TweenService")

local TweenUtil = {}

function TweenUtil:FadeIn(guiObject)
    guiObject.Transparency = 1
    local tween = TweenService:Create(guiObject, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Transparency = 0})
    tween:Play()
end

return TweenUtil
