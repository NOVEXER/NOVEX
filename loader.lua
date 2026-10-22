repeat task.wait() until game:IsLoaded()

local FlowAuthURL = "loadstring(game:HttpGet("https://flowauth.net/v1/loaders/NEXUSHUB.lua"))()"

local function CopyUnexpectedError(Error)
    local Raw = tostring(Error)
    if type(setclipboard) == "function" then
        pcall(setclipboard, Raw)
    end
    warn("[NOVEX Loader] " .. Raw)
end

local Success, Err = pcall(function()
    local Source = game:HttpGet(FlowAuthURL)
    if not Source or Source == "" then 
        error("Empty FlowAuth response") 
    end
    
    local Loader, LoadErr = loadstring(Source)
    if not Loader then 
        error(LoadErr) 
    end
    
    Loader()
end)

if not Success then
    CopyUnexpectedError(Err)
end
