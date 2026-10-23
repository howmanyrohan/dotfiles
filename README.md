# dotfiles

My setup for Windows (with WSL) and Linux.

## Windows

Run each step in PowerShell.

1. Install WSL, then restart.

   ```
   wsl --install
   ```

2. Install VS Code, then close and reopen PowerShell.

   ```
   winget install Microsoft.VisualStudioCode
   ```

3. Install the WSL extension.

   ```
   code --install-extension ms-vscode-remote.remote-wsl
   ```

4. Get the dotfiles into WSL, and link the manifesto for Claude Code.

   ```
   wsl bash -c "git clone https://github.com/howmanyrohan/dotfiles ~/dotfiles && mkdir -p ~/.claude && ln -sf ~/dotfiles/MANIFESTO.md ~/.claude/CLAUDE.md"
   ```

5. Copy the VS Code settings.

   ```
   New-Item -ItemType Directory -Force $env:APPDATA\Code\User; Copy-Item \\wsl$\Ubuntu\home\$(wsl whoami)\dotfiles\vscode\settings.json $env:APPDATA\Code\User\settings.json
   ```

6. Test it. VS Code should show `WSL: Ubuntu`.

   ```
   wsl bash -c "cd ~/dotfiles && code ."
   ```

   The first time, it installs a helper. Let it finish.

## Linux

Run in a terminal.

1. Install VS Code: https://code.visualstudio.com/download

2. Get the dotfiles.

   ```
   git clone https://github.com/howmanyrohan/dotfiles ~/dotfiles
   ```

3. Link the manifesto for Claude Code.

   ```
   mkdir -p ~/.claude && ln -sf ~/dotfiles/MANIFESTO.md ~/.claude/CLAUDE.md
   ```

4. Link the VS Code settings.

   ```
   mkdir -p ~/.config/Code/User && ln -sf ~/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
   ```

## What's in here

- `MANIFESTO.md`: my values. Linked to `~/.claude/CLAUDE.md` for Claude Code.
- `vscode/settings.json`: VS Code settings.
- `vscode/extensions.txt`: VS Code extensions.
