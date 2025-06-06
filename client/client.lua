onPlayerLoaded(function()
    TriggerServerEvent('tss-achievements:CheckDB')
end, true)

RegisterNetEvent('tss-achievements:OpenAchievements',function()
    OpenAchievements()
end)

function OpenAchievements()
    local achievements = triggerCallback('tss-achievements:GetAchievements')
    if achievements then
        local Array = {}
        for key, value in pairs(achievements) do
            value.code = key
            table.insert(Array, value)
        end
        SendNUIMessage({
            action = "open-achievements",
            Achievements = Array
        })
        SetNuiFocus(true, true)
    else
        print("error getting achievements")
    end
end

RegisterNetEvent('tss-achievements:AchievementEarned',function(code)
    if not Config.Achievements[code] then return print("Error Wrong Code") end
    local timer = 10000
    if Config.NotificationTimeout ~= nil then
        timer = Config.NotificationTimeout * 1000
    end
    SendNUIMessage({
        action = "achievement-earned",
        Image = Config.Achievements[code].imgSrc,
        Title = Config.Achievements[code].title,
        Timer = timer
    })
end)

RegisterCommand(Config.OpenUICommand,   function() OpenAchievements() end, false)

RegisterNUICallback('close-ui', function(data, cb)
    SetNuiFocus(false, false)
end)