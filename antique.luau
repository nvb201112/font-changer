-- Script đổi font GUI thành Antique (dán vào executor)
-- Hoạt động tốt với hầu hết executor (Synapse, Fluxus, Solara, v.v.)

local player = game.Players.LocalPlayer

-- Font Antique (kiểu vui nhộn, tròn trịa)
local AntiqueFont = Enum.Font.Antique

-- Hàm đổi font cho một GUI object
local function changeFont(guiObject)
    if guiObject:IsA("TextLabel") or guiObject:IsA("TextButton") or guiObject:IsA("TextBox") then
        guiObject.Font = AntiqueFont
        -- Nếu muốn chữ to hơn một chút cho đẹp Antique:
        -- guiObject.TextSize = guiObject.TextSize * 1.1
    end
end

-- Áp dụng cho tất cả GUI hiện có trong PlayerGui
local function applyToPlayerGui()
    for _, gui in ipairs(player:WaitForChild("PlayerGui"):GetDescendants()) do
        changeFont(gui)
    end
end

-- Áp dụng cho CoreGui (chat, menu Roblox, leaderboard...) nếu executor cho phép
local function applyToCoreGui()
    pcall(function()
        for _, gui in ipairs(game:GetService("CoreGui"):GetDescendants()) do
            changeFont(gui)
        end
    end)
end

-- Chạy ngay lập tức
applyToPlayerGui()
applyToCoreGui()

-- Theo dõi GUI mới được tạo sau này (rất quan trọng)
player.PlayerGui.DescendantAdded:Connect(function(desc)
    changeFont(desc)
end)

-- Theo dõi CoreGui (nếu được)
pcall(function()
    game:GetService("CoreGui").DescendantAdded:Connect(function(desc)
        changeFont(desc)
    end)
end)

print("✅ Đã đổi font GUI thành Antique thành công!")
print("Nếu muốn font khác, thay Enum.Font.Antique bằng Enum.Font.FredokaOne hoặc Enum.Font.Bangers")
