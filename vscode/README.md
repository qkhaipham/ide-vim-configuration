# VSCode Vim Configuration

This directory contains a comprehensive Vim configuration for Visual Studio Code using the [VSCodeVim extension](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim).

## Overview

The `settings.json` file provides a powerful Vim-like experience in VSCode with custom key bindings, leader key mappings, and IDE integration commands. This configuration enhances productivity by combining Vim's modal editing with VSCode's modern IDE features.

## Features

### Core Vim Settings
- **Leader Key**: `<space>` (spacebar) for easy access to custom commands
- **Ctrl Keys**: Enabled for traditional Vim navigation
- **Incremental Search**: Real-time search highlighting
- **Relative Line Numbers**: For efficient line-based navigation

### Quick Mode Switch
- **Insert Mode Exit**: `jk` quickly exits insert mode to normal mode

## Key Bindings

### Navigation
| Keys | Action | Description |
|------|--------|-------------|
| `<C-j>` | Move Down | Navigate down one line |
| `<C-k>` | Move Up | Navigate up one line |
| `<C-h>` | Move Left | Navigate left one character |
| `<C-l>` | Move Right | Navigate right one character |

### Scrolling with Auto-Center
| Keys | Action | Description |
|------|--------|-------------|
| `<C-d>` | Scroll Down + Center | Half-page down with cursor centering |
| `<C-u>` | Scroll Up + Center | Half-page up with cursor centering |
| `n` | Next Search + Center | Next search result with cursor centering |
| `N` | Previous Search + Center | Previous search result with cursor centering |

### Code Navigation
| Keys | Action | VSCode Command |
|------|--------|----------------|
| `gd` | Go to Definition | `editor.action.revealDefinition` |
| `gi` | Go to Implementation | `editor.action.goToImplementation` |
| `gu` | Go to References | `editor.action.goToReferences` |

### Leader Key Mappings

#### File and Project Management
| Keys | Action | VSCode Command |
|------|--------|----------------|
| `<leader>p` | Quick Open File | `workbench.action.quickOpen` |
| `<leader>c` | Command Palette | `workbench.action.showCommands` |
| `<leader>,` | Open Recent | `workbench.action.openRecent` |
| `<leader>o` | Go to Symbol | `workbench.action.gotoSymbol` |

#### Code Editing
| Keys | Action | VSCode Command |
|------|--------|----------------|
| `<leader>r` | Rename Symbol | `editor.action.rename` |
| `<leader>rr` | Refactor | `editor.action.refactor` |
| `<leader>d` | Duplicate Line | `editor.action.copyLinesDownAction` |
| `<leader>/` | Toggle Comment | `editor.action.commentLine` |
| `<leader>f` | Format Document | `editor.action.formatDocument` |
| `<leader><leader>` | Quick Fix | `editor.action.quickFix` |

#### Error Navigation
| Keys | Action | VSCode Command |
|------|--------|----------------|
| `<leader>e` | Next Error | `editor.action.marker.next` |
| `<leader>E` | Previous Error | `editor.action.marker.previous` |

#### AI and Chat
| Keys | Action | VSCode Command |
|------|--------|----------------|
| `<leader>i` | Inline Chat | `inlineChat.start` |
| `<leader>a` | Open Chat Agent | `workbench.action.chat.openAgent` |

#### Selection
| Keys | Action | VSCode Command |
|------|--------|----------------|
| `<leader><Right>` | Expand Selection | `editor.action.smartSelect.expand` |
| `<leader><Left>` | Shrink Selection | `editor.action.smartSelect.shrink` |

### Testing
| Keys | Action | VSCode Command |
|------|--------|----------------|
| `td` | Debug Test at Cursor | `testing.debugAtCursor` |
| `tr` | Run Test at Cursor | `testing.runAtCursor` |
| `ta` | Run All Tests | `testing.runAll` |

### .NET Development
| Keys | Action | VSCode Command |
|------|--------|----------------|
| `<leader>b` | Build Solution | `csdevkit.buildSolution` |

### Sidebar Navigation
| Keys | Action | VSCode Command |
|------|--------|----------------|
| `st` | Test Explorer | `workbench.view.extension.test` |
| `se` | File Explorer | `workbench.view.explorer` |
| `sg` | Source Control | `workbench.view.scm` |
| `sd` | Debug Panel | `workbench.view.debug` |
| `sx` | Extensions | `workbench.view.extensions` |
| `ss` | Search | `workbench.view.search` |

### Visual Mode Enhancements
| Keys | Action | Description |
|------|--------|-------------|
| `p` | Smart Paste | Paste without overwriting clipboard |
| `<leader>s` | Surround with Snippet | Wrap selection with snippet |
| `<leader><Right>` | Expand Selection | Expand selection in visual mode |
| `<leader><Left>` | Shrink Selection | Shrink selection in visual mode |

### Additional Mappings
| Keys | Action | Description |
|------|--------|-------------|
| `Q` | Format Paragraph | Maps to `gq` for text formatting |
| `<leader>u` | Go to References | Alternative mapping for references |

## Installation

1. Install the [VSCodeVim extension](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
2. Copy the contents of `settings.json` to your VSCode user settings
3. Restart VSCode or reload the window

## Configuration Location

### Global Settings
- **macOS**: `~/Library/Application Support/Code/User/settings.json`
- **Windows**: `%APPDATA%\Code\User\settings.json`
- **Linux**: `~/.config/Code/User/settings.json`

### Workspace Settings
Place `settings.json` in `.vscode/settings.json` within your project root for project-specific configurations.

## Tips for Usage

1. **Leader Key**: The spacebar leader key provides easy access to IDE features without leaving home row
2. **Auto-centering**: Navigation commands automatically center the cursor for better visibility
3. **Smart Selection**: Use leader + arrow keys to intelligently expand/shrink selections
4. **Quick Mode Switch**: Use `jk` to quickly exit insert mode
5. **Sidebar Navigation**: Use `s` + letter combinations for quick sidebar access

## Customization

Feel free to modify the key bindings to match your workflow. The configuration is designed to be:
- **Ergonomic**: Minimal finger movement required
- **Consistent**: Similar patterns for related actions
- **IDE-integrated**: Leverages VSCode's built-in commands
- **Vim-friendly**: Maintains Vim's modal editing philosophy

## Dependencies

- [VSCodeVim Extension](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
- For .NET development features: [C# Dev Kit](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit)

## Contributing

If you have suggestions for improvements or additional key bindings, feel free to contribute to this configuration.