-- appToggle.lua
-- Reusable module for toggling applications

local M = {}

-- Toggle an application (launch/focus or hide if frontmost)
function M.toggleApp(appName, hideWhenFrontmost)
    hideWhenFrontmost = hideWhenFrontmost == nil and true or hideWhenFrontmost
    
    local app = hs.application.find(appName)
    
    if app and app:isFrontmost() then
        if hideWhenFrontmost then
            -- VS Code doesn't support hiding reliably on macOS, skip it
            if appName ~= "Visual Studio Code" and appName ~= "Code" then
                app:hide()
            end
        end
    else
        hs.application.launchOrFocus(appName)
    end
end

-- Toggle a Finder folder (open if not open, activate Finder if open but not frontmost)
function M.toggleFinderFolder(targetFolder)
    local finderApp = hs.application.find("Finder")
    local folderAlreadyOpen = false
    local finderIsFrontmost = false

    if finderApp then
        finderIsFrontmost = finderApp:isFrontmost()

        -- Check if the target folder is already open
        local script = string.format([[
            tell application "Finder"
                set folderOpen to false
                repeat with w in every Finder window
                    try
                        set winPath to POSIX path of (target of w as alias)
                        if winPath starts with "%s" then
                            set folderOpen to true
                        end if
                    end try
                end repeat
                return folderOpen
            end tell
        ]], targetFolder)

        local ok, result = hs.osascript.applescript(script)
        if ok then
            folderAlreadyOpen = result
        end
    end

    if not folderAlreadyOpen then
        -- Folder not open → open it
        hs.execute(string.format('open "%s"', targetFolder))
    elseif not finderIsFrontmost then
        -- Folder is open, but Finder is not frontmost → activate Finder
        if finderApp then
            finderApp:activate()
        end
    end
    -- If folder is open and Finder is frontmost, do nothing
    -- (Finder doesn't support reliable hiding/window closing)
end

return M
