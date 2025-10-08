# JetBrains Rider Vim Configuration

This directory contains a comprehensive Vim configuration for JetBrains Rider using the [IdeaVim plugin](https://plugins.jetbrains.com/plugin/164-ideavim). This configuration provides a powerful Vim-like experience while leveraging Rider's advanced .NET development features.

## Overview

The `.ideavimrc` file configures IdeaVim to provide modal editing with Rider-specific IDE integrations. This setup enhances productivity by combining Vim's efficient editing patterns with Rider's powerful refactoring, debugging, and .NET development tools.

## Features

### Core Vim Settings
- **Leader Key**: `<space>` (spacebar) for easy access to IDE actions
- **Relative Line Numbers**: Efficient line-based navigation
- **Incremental Search**: Real-time search highlighting
- **Scroll Context**: 5 lines of context around cursor
- **Auto-centering**: Cursor centering after navigation

### Quick Mode Switch
- **Insert Mode Exit**: `jk` quickly exits insert mode to normal mode

### IdeaVim Plugins
- **Surround**: Text object manipulation with surrounding characters
- **Multiple Cursors**: Multi-cursor editing support
- **Commentary**: Easy comment toggling
- **Arg Text Object**: Function argument text objects
- **Easy Motion**: Fast cursor movement
- **Text Object Entire**: Entire buffer text object
- **Replace With Register**: Register-based text replacement
- **Highlighted Yank**: Visual feedback for yanked text

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
| Keys | Action | Rider Action |
|------|--------|--------------|
| `gd` | Go to Declaration | `GotoDeclaration` |
| `gi` | Go to Implementation | `ReSharperGotoImplementation` |
| `<leader>u` | Find Usages | `FindUsages` |
| `<leader>t` | Go to Type Declaration | `GotoTypeDeclaration` |

### Method Navigation
| Keys | Action | Rider Action |
|------|--------|--------------|
| `]` | Next Method | `MethodDown` |
| `[` | Previous Method | `MethodUp` |

### Leader Key Mappings

#### File and Project Management
| Keys | Action | Rider Action |
|------|--------|--------------|
| `<leader>f` | Go to File | `GotoFile` |
| `<leader>,` | Recent Files | `RecentFiles` |
| `<leader>l` | Jump to Last Change | `JumpToLastChange` |

#### Code Editing and Refactoring
| Keys | Action | Rider Action |
|------|--------|--------------|
| `<leader><leader>` | Show Intentions | `ShowIntentionActions` |
| `<leader>r` | Rename Element | `RenameElement` |
| `<leader>rr` | Refactoring Menu | `Refactorings.QuickListPopupAction` |
| `<leader>d` | Duplicate Line | `EditorDuplicate` |
| `<leader>/` | Toggle Comment | `CommentByLineCommentCR` |
| `<leader>s` | Surround With | `SurroundWith` |
| `<leader>v` | Introduce Variable | `IntroduceVariable` |
| `<leader>m` | Extract Method | `ExtractMethod` |
| `<leader>cs` | Change Signature | `ChangeSignature` |
| `<leader>o` | Move | `Move` |

#### Code Movement
| Keys | Action | Rider Action |
|------|--------|--------------|
| `<leader>h` | Move Element Left | `MoveElementLeft` |
| `<leader>j` | Move Statement Down | `MoveStatementDown` |
| `<leader>k` | Move Statement Up | `MoveStatementUp` |
| `<leader>l` | Move Element Right | `MoveElementRight` |

#### Error Navigation
| Keys | Action | Rider Action |
|------|--------|--------------|
| `<leader>e` | Next Error | `GotoNextError` |
| `<leader>E` | Previous Error | `GoToPreviousError` |

#### Build and Solution
| Keys | Action | Rider Action |
|------|--------|--------------|
| `<leader>b` | Build Solution | `BuildWholeSolutionAction` |

#### Templates and Snippets
| Keys | Action | Rider Action |
|------|--------|--------------|
| `<leader>lt` | Insert Live Template | `InsertLiveTemplate` |

#### Testing
| Keys | Action | Rider Action |
|------|--------|--------------|
| `<leader>tr` | Run Test at Cursor | `RiderUnitTestRunContextAction` |
| `<leader>td` | Debug Test at Cursor | `RiderUnitTestDebugContextAction` |
| `<leader>ta` | Run All Tests | `RiderUnitTestRunSolutionAction` |
| `<leader>tl` | Repeat Last Test Run | `RiderUnitTestRepeatPreviousRunAction` |
| `<leader>tt` | Unit Tests Tool Window | `ActivateUnitTestsToolWindow` |

#### NuGet Management
| Keys | Action | Rider Action |
|------|--------|--------------|
| `<leader>na` | NuGet Quick Actions | `RiderNuGetQuickListPopupAction` |
| `<leader>n` | NuGet Tool Window | `ActivateNuGetToolWindow` |

#### Version Control
| Keys | Action | Rider Action |
|------|--------|--------------|
| `<leader>g` | VCS Tool Window | `ActivateCommitToolWindow` |

### Visual Mode Enhancements
| Keys | Action | Description |
|------|--------|-------------|
| `p` | Smart Paste | Paste without overwriting clipboard |

### Additional Mappings
| Keys | Action | Description |
|------|--------|-------------|
| `Q` | Format Text | Maps to `gq` for text formatting |

## Plugin Configuration

### Arg Text Object
Configured to work with multiple bracket types:
```vim
let g:argtextobj_pairs="[:],(:),<:>"
```

### IdeaVim-Specific Settings
- **Join Lines**: `ideajoin` - Use IDE's smart line joining
- **Status Icon**: Gray icon for IdeaVim status
- **Refactor Mode**: Keep refactoring mode active

## Installation

1. Install the [IdeaVim plugin](https://plugins.jetbrains.com/plugin/164-ideavim) in JetBrains Rider
2. Copy `.ideavimrc` to your home directory (`~/.ideavimrc`)
3. Restart Rider or use `Tools → Vim → Reload .ideavimrc`

## Configuration Location

The `.ideavimrc` file should be placed in your home directory:
- **macOS/Linux**: `~/.ideavimrc`
- **Windows**: `%USERPROFILE%\.ideavimrc`

## Tips for Usage

1. **Leader Key**: Use spacebar as leader for easy access to IDE features
2. **Auto-centering**: Navigation automatically centers cursor for better visibility
3. **Testing Workflow**: Use `<leader>t` prefixed commands for comprehensive test management
4. **Refactoring**: `<leader>rr` opens the refactoring menu for complex refactoring operations
5. **Code Movement**: Use `<leader>hjkl` for moving code elements around
6. **Method Navigation**: Use `[]` for quick method-to-method navigation

## .NET Development Features

This configuration is specifically tailored for .NET development in Rider:

### ReSharper Integration
- Go to Implementation (`gi`) uses ReSharper's enhanced navigation
- Refactoring actions leverage ReSharper's powerful refactoring engine
- Error navigation uses ReSharper's code analysis

### Testing Support
- Comprehensive test running and debugging support
- Test window management
- Repeat last test run functionality

### NuGet Integration
- Quick access to NuGet package management
- NuGet tool window toggle

### Solution Management
- Solution-wide build actions
- Recent files navigation
- VCS integration

## Customization

The configuration is designed to be:
- **IDE-Integrated**: Leverages Rider's full feature set
- **ReSharper-Aware**: Uses ReSharper actions where beneficial
- **Testing-Focused**: Comprehensive test management shortcuts
- **Refactoring-Friendly**: Easy access to refactoring operations
- **.NET-Optimized**: Tailored for .NET development workflows

Feel free to modify key bindings to match your specific workflow preferences.

## Dependencies

- [IdeaVim Plugin](https://plugins.jetbrains.com/plugin/164-ideavim)
- JetBrains Rider (with ReSharper built-in)

## Contributing

If you have suggestions for improvements or additional key bindings specific to .NET development in Rider, feel free to contribute to this configuration.