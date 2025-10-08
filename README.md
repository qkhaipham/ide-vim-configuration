# IDE Vim Configuration

A collection of Vim configurations for modern IDEs, specifically optimized for .NET development workflows. These configurations bring the power and efficiency of Vim modal editing to your .NET development environment.

## Overview

This repository contains Vim configurations that integrate seamlessly with popular .NET development IDEs while maintaining the ergonomic and efficient editing experience that makes Vim so powerful. Each configuration is tailored to leverage .NET-specific features and development workflows.

## Supported IDEs

### 🖥️ Visual Studio Code
**Location**: [`vscode/`](./vscode/)  
**Plugin**: [VSCodeVim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)

VSCode configuration optimized for .NET development featuring:
- Space-based leader key mappings for ergonomic access
- Seamless integration with C# Dev Kit and .NET tools
- Auto-centering navigation for better visibility
- Testing workflow shortcuts for .NET projects
- Build and debug integration

**Key Features**:
- Quick mode switching with `jk`
- Integrated error navigation
- Code formatting and refactoring shortcuts
- .NET solution management via leader key

### 🏗️ JetBrains Rider
**Location**: [`rider/`](./rider/)  
**Plugin**: [IdeaVim](https://plugins.jetbrains.com/plugin/164-ideavim)

The primary .NET development configuration optimized for Rider's capabilities:
- ReSharper-powered navigation and refactoring
- Comprehensive unit testing workflow (xUnit, NUnit, MSTest)
- NuGet package management integration
- Solution-wide build and analysis tools
- Method-to-method navigation shortcuts
- Live template insertion for .NET patterns

**Key Features**:
- ReSharper-enhanced code navigation
- Extensive testing shortcuts (`<leader>t*`)
- Smart code movement and refactoring
- Built-in VCS integration for .NET projects

## .NET Development Focus

These configurations are specifically designed for .NET development workflows:

### 🎯 **Ergonomic .NET Coding**
- **Space Leader Key**: Easy access to .NET-specific commands
- **Testing Integration**: Quick access to unit test running and debugging
- **Solution Management**: Efficient navigation of .NET solutions and projects

### 🔧 **IDE Integration**
- **ReSharper Power**: Leverage ReSharper's advanced .NET analysis and refactoring
- **NuGet Management**: Seamless package management workflows
- **Build Integration**: Quick access to solution building and debugging

### ⚡ **Productivity Focus**
- **Quick Testing**: Fast test execution and debugging workflows
- **Smart Navigation**: Method-to-method and class-to-class navigation
- **Refactoring Support**: Easy access to .NET-specific refactoring operations

## Quick Start

### Prerequisites
1. Install the appropriate Vim plugin for your IDE
2. Choose the configuration directory for your IDE
3. Follow the specific installation instructions in each IDE's README

### Installation Steps
1. Clone this repository:
   ```bash
   git clone https://github.com/qkhaipham/ide-vim-configuration.git
   cd ide-vim-configuration
   ```

2. Navigate to your IDE's configuration directory:
   ```bash
   # For VSCode
   cd vscode
   
   # For Rider
   cd rider
   ```

3. Follow the installation instructions in the respective README.md file

## Configuration Structure

```
ide-vim-configuration/
├── README.md                 # This file
├── vscode/
│   ├── README.md            # VSCode-specific documentation
│   └── settings.json        # VSCode Vim configuration
└── rider/
    ├── README.md            # Rider-specific documentation
    └── .ideavimrc           # IdeaVim configuration
```

## Key Binding Highlights

### Universal Mappings
These key bindings work consistently across all configurations:

| Keys | Action | Description |
|------|--------|-------------|
| `jk` | Exit Insert Mode | Quick escape from insert mode |
| `<Space>` | Leader Key | Access to custom command mappings |
| `<C-hjkl>` | Navigation | Arrow key navigation with Ctrl |
| `<leader>/` | Toggle Comment | Comment/uncomment lines |
| `<leader>f` | Format/File | Format document or open file (context-dependent) |
| `<leader>r` | Rename | Rename symbol under cursor |
| `<leader>d` | Duplicate | Duplicate current line |

### IDE-Specific Power Features

#### VSCode Specialties
- `<leader>p` - Quick open file
- `<leader>c` - Command palette
- `<leader>i` - Inline chat (AI integration)
- `s*` combinations for sidebar navigation

#### Rider Specialties  
- `<leader>tr/td/ta` - Test run/debug/all (.NET test frameworks)
- `<leader>na` - NuGet package actions
- `<leader>rr` - ReSharper refactoring menu
- `[]` - Method navigation in .NET classes

## Customization

Each configuration is designed to be easily customizable:

1. **Leader Key**: Change from space to your preferred key
2. **Key Mappings**: Modify any key binding to match your workflow
3. **IDE Actions**: Replace mapped actions with different IDE commands
4. **Testing Frameworks**: Adapt test shortcuts for your preferred .NET testing framework

## Support

For questions or issues:
- **GitHub Issues**: Open an issue in this repository
- **Documentation**: Check the README files in each IDE directory

---

**Happy .NET Development with Vim!** 🚀