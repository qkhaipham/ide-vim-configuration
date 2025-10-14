-- Hammerspoon Configuration
-- Load the appToggle helper module
local appToggle = require("appToggle")

-- Base modifier keys for all hotkeys (Control + Option + Command)
local baseModifiers = {"ctrl", "alt", "cmd"}

-- Configuration: Define hotkey bindings with their targets
local toggles = {
    -- Applications
    {
        key = "g",
        type = "app",
        target = "Google Chrome",
        description = "Toggle Google Chrome"
    },
    {
        key = "k",
        type = "app",
        target = "Visual Studio Code",
        description = "Toggle Visual Studio Code"
    },
    {
        key = "j",
        type = "app",
        target = "Rider",
        description = "Toggle Rider"
    },
    -- Folders
    {
        key = "l",
        type = "folder",
        target = "/Users/khai/Documents",
        description = "Toggle Documents folder"
    },
    {
        key = "p",
        type = "folder",
        target = "/Users/khai/projects/",
        description = "Toggle Projects folder"
    }
}

-- Bind hotkeys based on configuration
for _, toggle in ipairs(toggles) do
    hs.hotkey.bind(baseModifiers, toggle.key, function()
        if toggle.type == "app" then
            appToggle.toggleApp(toggle.target)
        elseif toggle.type == "folder" then
            appToggle.toggleFinderFolder(toggle.target)
        end
    end)
end

-- Reload configuration notification
hs.alert.show("Hammerspoon Config Loaded")

-- Export configuration for reference
return {
    toggles = toggles,
    baseModifiers = baseModifiers
}
