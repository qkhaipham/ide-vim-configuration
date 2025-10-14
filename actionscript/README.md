# macOS Application Toggle Scripts

This directory contains AppleScript files that provide quick application toggling functionality on macOS. These scripts allow you to show/hide/launch applications with a single hotkey, creating a seamless workflow for .NET development.

## Overview

Each script provides intelligent application toggling:
- **If app is not running**: Launch the application
- **If app is running but not in front**: Bring it to the front
- **If app is already in front**: Hide it

This creates a toggle behavior similar to a "boss key" for quick context switching during development.

## Available Scripts

| Script | Application | Suggested Hotkey |
|--------|-------------|------------------|
| `toggleVisualStudioCode.actionscript` | Visual Studio Code | `⌃⇧⌘K` |
| `toggleRider.actionscript` | JetBrains Rider | `⌃⇧⌘J` |
| `toggleGoogleChrome.actionscript` | Google Chrome | `⌃⇧⌘G` |
| `toggleProjects.actionscript` | Projects Folder | `⌃⇧⌘P` |
| `toggleDocuments.actionscript` | Documents Folder | `⌃⇧⌘L` |

> **Note**: The suggested hotkeys match those shown in your screenshot and align with common .NET development workflows.

## Setup Guide

### Method 1: Using Automator (Recommended)

#### Step 1: Create Quick Action
1. Open **Automator** (`⌘ + Space`, type "Automator")
2. Choose **New Document**
3. Select **Quick Action** (or "Service" on older macOS versions)
4. Click **Choose**

#### Step 2: Configure the Quick Action
1. At the top of the workflow:
   - Set **"Workflow receives"** to: `no input`
   - Set **"in"** to: `any application`

2. In the search box on the left, search for: **"Run AppleScript"**
3. Drag **"Run AppleScript"** action to the workflow area
4. Delete the default script code in the text box

#### Step 3: Add Your Script
1. Open one of the `.actionscript` files from this directory (e.g., `toggleVisualStudioCode.actionscript`)
2. Copy the entire script content
3. Paste it into the AppleScript text box in Automator

#### Step 4: Save the Quick Action
1. Press `⌘ + S` to save
2. Give it a descriptive name (e.g., `toggleVisualStudioCode`)
3. The service will be saved to: `~/Library/Services/`

#### Step 5: Assign a Keyboard Shortcut
1. Open **System Settings** (or **System Preferences**)
2. Go to **Keyboard** → **Keyboard Shortcuts** (or **Shortcuts**)
3. Select **App Shortcuts** from the left sidebar
4. Click the **"+"** button to add a new shortcut
5. Configure:
   - **Application**: Select "All Applications"
   - **Menu Title**: Enter the exact name you gave the Quick Action (e.g., `toggleVisualStudioCode`)
   - **Keyboard Shortcut**: Press your desired key combination (e.g., `⌃⇧⌘K`)
6. Click **Add**

## Recommended Hotkey Setup

Based on ergonomic .NET development workflow, here's the suggested setup:

```
⌃⇧⌘H  - Toggle Home (Finder home directory)
⌃⇧⌘K  - Toggle Visual Studio Code
⌃⇧⌘P  - Toggle Projects folder
⌃⇧⌘G  - Toggle Google Chrome
⌃⇧⌘J  - Toggle Rider
⌃⇧⌘L  - Toggle Documents folder
⌃⇧⌘I  - Toggle Invoices folder
```

These hotkeys:
- Use `⌃⇧⌘` (Control + Shift + Command) as the base modifier
- Map to logical letters related to the application/folder
- Avoid conflicts with common system shortcuts
- Are easy to remember and quick to execute

## Customization

### Creating New Toggle Scripts

To create a toggle script for any macOS application:

1. Copy an existing `.actionscript` file
2. Change the `appName` variable to your target application:
   ```applescript
   set appName to "Your Application Name"
   ```
3. Save with a descriptive filename
4. Follow the setup guide above to create a Quick Action and assign a hotkey

### Finding Application Names

To find the exact application name to use in the script:

1. Open **Activity Monitor**
2. Find your application in the list
3. Use the exact name shown (case-sensitive)

Common examples:
- `"Visual Studio Code"` (not "VSCode")
- `"Google Chrome"` (not "Chrome")
- `"Rider"` (not "JetBrains Rider")

## Troubleshooting

### Script Not Working
1. **Check Application Name**: Ensure the exact application name matches what's in Activity Monitor
2. **Grant Permissions**: Go to **System Settings** → **Privacy & Security** → **Accessibility** and ensure the app running the script (Automator, Keyboard Maestro, etc.) has permission
3. **Test Script Directly**: Open the `.actionscript` file in **Script Editor** and click Run to test

### Hotkey Not Triggering
1. **Check for Conflicts**: Go to **System Settings** → **Keyboard** → **Keyboard Shortcuts** and search for conflicting shortcuts
2. **Restart System Settings**: Sometimes changes require closing and reopening System Settings
3. **Verify Service Name**: The menu title in keyboard shortcuts must exactly match your Quick Action name

### Permission Errors
If you get permission errors:
1. Open **System Settings** → **Privacy & Security**
2. Go to **Automation**
3. Find the app running your script (e.g., Automator)
4. Grant it permission to control other applications

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
- `⌃⇧⌘G`: Switch to Chrome to see results
- `⌃⇧⌘J`: Toggle back to Rider

### Creating Context-Aware Scripts

You can extend these scripts to be context-aware. For example, toggling different IDEs based on the current project directory or time of day.

---

**Enhance your .NET development workflow with quick application toggling!** ⚡