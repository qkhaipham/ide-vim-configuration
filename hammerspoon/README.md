# Hammerspoon Application Toggle Scripts

This directory contains Lua scripts for [Hammerspoon](https://www.hammerspoon.org/) that provide quick application toggling functionality on macOS. These scripts allow you to show/hide/launch applications with a single hotkey, creating a seamless workflow for development.

## Overview

The configuration uses a modular approach with shared helper functions:
- **`appToggle.lua`**: Reusable module for app and folder toggling logic
- **`init.lua`**: Main configuration file with centralized settings and hotkey bindings

Each script provides intelligent application toggling:
- **If app is not running**: Launch the application
- **If app is running but not in front**: Bring it to the front
- **If app is already in front**: Hide it (except VS Code and Finder - macOS limitations)

For Finder folders:
- **If folder is not open**: Open the folder in Finder
- **If folder is open but Finder not in front**: Bring Finder to the front

This creates a toggle behavior similar to a "boss key" for quick context switching during development.

> **Note**: Due to macOS limitations, VS Code and Finder cannot be reliably hidden via Hammerspoon. VS Code uses special window management that prevents standard hiding, and Finder is a system app that cannot be hidden.

## Available Scripts

| File | Purpose | Default Hotkey |
|------|---------|----------------|
| `init.lua` | Main configuration file | N/A |
| `appToggle.lua` | Helper module with shared functions | N/A |

### Configured Hotkeys

All hotkeys use **Control + Option + Command** (⌃⌥⌘) as the base modifier:

| Hotkey | Target | Type | Can Hide? |
|--------|--------|------|-----------|
| `⌃⌥⌘G` | Google Chrome | Application | ✅ Yes |
| `⌃⌥⌘K` | Visual Studio Code | Application | ❌ No (macOS limitation) |
| `⌃⌥⌘J` | Rider | Application | ✅ Yes |
| `⌃⌥⌘L` | Documents Folder | Folder | ❌ N/A |
| `⌃⌥⌘P` | Projects Folder | Folder | ❌ N/A |

## Prerequisites

1. **Install Hammerspoon**: Download from [hammerspoon.org](https://www.hammerspoon.org/) or via Homebrew:
   ```bash
   brew install --cask hammerspoon
   ```

2. **Grant Accessibility Permissions**:
   - Open **System Settings** → **Privacy & Security** → **Accessibility**
   - Add Hammerspoon to the allowed apps

## Setup Guide

### Quick Setup (Recommended)

1. Copy all `.lua` files to your Hammerspoon config directory:
   ```bash
   cp hammerspoon/*.lua ~/.hammerspoon/
   ```

2. Reload Hammerspoon configuration:
   - Click the Hammerspoon icon in the menu bar
   - Select "Reload Config"

   That's it! The `init.lua` file includes all configuration and hotkey bindings.

### Customizing Hotkeys

Edit `~/.hammerspoon/init.lua` and modify the `toggles` table. Each toggle is defined as an object:

```lua
local toggles = {
    {
        key = "g",                      -- The key to press (with base modifiers)
        type = "app",                   -- Type: "app" or "folder"
        target = "Google Chrome",       -- App name or folder path
        description = "Toggle Google Chrome"
    },
    -- Add more toggles here...
}
```

To change the base modifiers (default: Control+Option+Command):

```lua
local baseModifiers = {"ctrl", "alt", "cmd"}  -- ⌃⌥⌘
-- Or use: {"ctrl", "shift", "cmd"}           -- ⌃⇧⌘
-- Or use: {"cmd", "alt"}                     -- ⌘⌥
```

## Recommended Hotkey Setup

Based on ergonomic development workflow using **Control + Option + Command** (⌃⌥⌘):

```
⌃⌥⌘G  - Toggle Google Chrome
⌃⌥⌘K  - Toggle Visual Studio Code
⌃⌥⌘J  - Toggle Rider
⌃⌥⌘L  - Toggle Documents folder
⌃⌥⌘P  - Toggle Projects folder
```

These hotkeys:
- Use `⌃⌥⌘` (Control + Option + Command) as the base modifier
- Map to logical letters related to the application/folder
- Avoid conflicts with common system shortcuts
- Are easy to remember and quick to execute with one hand

## Customization

### Adding New Applications

To add a new application toggle, simply add a new object to the `toggles` array in `init.lua`:

```lua
local toggles = {
    -- ... existing toggles ...
    {
        key = "s",
        type = "app",
        target = "Slack",
        description = "Toggle Slack"
    }
}
```

That's it! The hotkey will automatically be bound to ⌃⌥⌘S.

### Finding Application Names

Use the Hammerspoon console to find exact application names:

```lua
hs.application.runningApplications()
```

Common examples:
- `"Visual Studio Code"` (not "VSCode")
- `"Google Chrome"` (not "Chrome")
- `"Rider"` (not "JetBrains Rider")

### Adding New Folders

To add a new folder toggle, add a folder-type object to the `toggles` array:

```lua
local toggles = {
    -- ... existing toggles ...
    {
        key = "d",
        type = "folder",
        target = "/Users/khai/Downloads",
        description = "Toggle Downloads folder"
    }
}
```

### Advanced Customization

You can add custom modifiers per-toggle if needed:

```lua
{
    key = "x",
    type = "app",
    target = "Xcode",
    modifiers = {"cmd", "shift"},  -- Override baseModifiers for this specific toggle
    description = "Toggle Xcode"
}
```

Then update the binding loop in `init.lua`:

```lua
for _, toggle in ipairs(toggles) do
    local mods = toggle.modifiers or baseModifiers
    hs.hotkey.bind(mods, toggle.key, function()
        -- ... rest of the code
    end)
end
```

## Troubleshooting

### Script Not Working
1. **Check Hammerspoon Console**: Open Hammerspoon → Console to see error messages
2. **Verify Application Name**: Use `hs.application.runningApplications()` to confirm the exact name
3. **Grant Permissions**: Ensure Hammerspoon has Accessibility permissions in System Settings

### Hotkey Not Triggering
1. **Check for Conflicts**: Look for conflicting hotkeys in System Settings → Keyboard → Keyboard Shortcuts
2. **Reload Config**: Always reload Hammerspoon after editing `init.lua`
3. **Verify Syntax**: Check the Hammerspoon console for Lua syntax errors

### Permission Errors
If you get permission errors:
1. Open **System Settings** → **Privacy & Security** → **Automation**
2. Grant Hammerspoon permission to control Finder and other applications

### Application Won't Hide
- **VS Code**: Cannot be hidden due to macOS Electron app limitations
- **Finder**: Cannot be hidden as it's a system app that always runs
- **Other apps**: Most standard macOS apps should hide properly with `app:hide()`

## Architecture Benefits

This modular Hammerspoon setup offers several advantages:

### Over AppleScript
- **Centralized Configuration**: All settings and hotkeys in one `init.lua` file
- **More Powerful**: Full Lua scripting with extensive API
- **Better Performance**: Runs as a native daemon, not script-by-script
- **Real-time Reload**: Changes take effect immediately
- **Rich Ecosystem**: Access to community-contributed modules (Spoons)

### Modular Design
- **DRY Principle**: No code repetition - all logic in `appToggle.lua`
- **Easy Maintenance**: Update behavior in one place, affects all toggles
- **Declarative Configuration**: Single array of toggle objects defines everything
- **Type Safety**: Lua provides better error messages than AppleScript
- **Extensible**: Add new apps or folders by adding one object to the array

## Integration with Vim Configuration

These toggle scripts complement the Vim configurations in this repository by providing:

1. **Quick Context Switching**: Instantly switch between IDE and browser for testing
2. **Distraction-Free Workflow**: Hide applications when not needed
3. **Keyboard-Driven**: Stay in the keyboard flow without reaching for the mouse
4. **Multi-IDE Support**: Quickly switch between VSCode and Rider for different .NET projects

## Tips for .NET Development Workflow

1. **IDE Toggle**: Use `⌃⇧⌘K` (VSCode) or `⌃⇧⌘J` (Rider) to quickly show/hide your IDE
2. **Browser Toggle**: Use `⌃⇧⌘G` to toggle Chrome for testing web applications
3. **Project Navigation**: Use `⌃⇧⌘P` to quickly access your Projects folder
4. **Document Management**: Use `⌃⇧⌘L` for quick access to documentation or notes
5. **Clean Workspace**: Hide all non-essential apps with their respective toggles when focusing on code

## Advanced Usage

### Chaining with Vim Leader Keys

You can combine these system-level toggles with your Vim leader key mappings:

1. Use Vim leader keys (`<leader>*`) for in-editor actions
2. Use system hotkeys (`⌃⇧⌘*`) for application-level switching
3. This creates a consistent two-tier keyboard workflow

Example workflow:
- `<leader>tr` in Rider: Run tests
- `⌃⌥⌘G`: Switch to Chrome to see results
- `⌃⌥⌘J`: Toggle back to Rider

### Creating Context-Aware Scripts

The `appToggle` module makes it easy to create sophisticated behaviors:

```lua
-- Example: Toggle different IDEs based on current project
local appToggle = require("appToggle")

function smartIDEToggle()
    local focusedWindow = hs.window.focusedWindow()
    if focusedWindow then
        local app = focusedWindow:application()
        local appName = app:name()
        
        if appName == "Rider" then
            appToggle.toggleApp("Visual Studio Code")
        else
            appToggle.toggleApp("Rider")
        end
    end
end

-- Bind to a hotkey
hs.hotkey.bind({"ctrl", "shift", "cmd"}, "i", smartIDEToggle)
```

### Extending the appToggle Module

You can extend `appToggle.lua` with additional helper functions:

```lua
-- Add to appToggle.lua
function M.toggleBrowser()
    local chrome = hs.application.find("Google Chrome")
    local safari = hs.application.find("Safari")
    
    if chrome and chrome:isFrontmost() then
        chrome:hide()
    elseif safari and safari:isFrontmost() then
        safari:hide()
    elseif chrome then
        chrome:activate()
    else
        hs.application.launchOrFocus("Google Chrome")
    end
end
```

## Further Reading

- [Hammerspoon Documentation](https://www.hammerspoon.org/docs/)
- [Hammerspoon Getting Started Guide](https://www.hammerspoon.org/go/)
- [Spoons (Hammerspoon Plugins)](https://www.hammerspoon.org/Spoons/)

---

**Enhance your .NET development workflow with Hammerspoon!** ⚡
