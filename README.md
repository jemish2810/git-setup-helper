# Git Setup Helper

A cross-platform script to automate SSH key generation, Git configuration, and common Git operations (clone, pull, fetch, push).
## Features

- **SSH Key Generation**: Automatically generates an SSH key if it doesn't exist.
- **Git Configuration**: Configures Git with your username and email.
- **Git Operations**: Provides a menu to clone, pull, fetch, and push repositories.
- **Cross-Platform**: Works on **Linux**, **macOS**, and **Windows**.


## Prerequisites

- **Git**: Ensure Git is installed on your system.
  - Download Git: [https://git-scm.com/](https://git-scm.com/)
- **Bash**: The script is written in Bash and requires a Bash shell.
  - On Windows, use **Git Bash**, **WSL**, or **Cygwin**.

## Installation

### Linux and macOS

1. **Clone the Repository**:
```bash
   git clone https://github.com/your-username/git-setup-helper.git
   cd git-setup-helper
```

2. Make the Script Executable:
```bash
chmod +x setup_git.sh
```

3. Run the Script:
```bash
./setup_git.sh
```

### Windows

1. Clone the Repository:
```bash
git clone https://github.com/your-username/git-setup-helper.git
cd git-setup-helper
```

2. Make the Script Executable (if using Git Bash):
```bash
chmod +x setup_git.sh
```

3. Run the Script:
```bash
./setup_git.sh
```
    
## Usage/Examples

### Main Menu
When you run the script, you'll see the following menu:

#### Select an option:
1. Generate SSH Key and Configure Git
2. Perform Git Operations
3. Exit

#### Option 1: Generate SSH Key and Configure Git
- Generates an SSH key (if it doesn't exist).
- Adds the SSH key to the SSH agent.
- Tests the SSH connection to GitHub.
- Configures Git with your username and email.

#### Option 2: Perform Git Operations
Provides a submenu to:
- Clone a repository.
- Pull changes.
- Fetch changes.
- Push changes.


## Script Location

### Linux and macOS

- Place the script in a directory included in your $PATH (e.g., ~/bin/).
- Add the following line to your shell configuration file (~/.bashrc, ~/.zshrc, etc.):

```bash
export PATH="$HOME/bin:$PATH"
```

Reload the configuration:
```bash
source ~/.bashrc
```

### Windows

- Place the script in a directory included in your %PATH% (e.g., %USERPROFILE%\bin\).
- Add the directory to your Path environment variable.


## Steps to Create the Repository

1. Create a New Repository on GitHub:
   - Go to [GitHub](https://github.com) and click **New**.
   - Name the repository `git-setup-helper`.
   - Add the description: **A cross-platform script to automate SSH key generation, Git configuration, and common Git operations (clone, pull, fetch, push).**
   - Choose **Public** or **Private**.
   - Click **Create Repository**.

2. Clone the Repository Locally:
   ```bash
   git clone https://github.com/your-username/git-setup-helper.git
   cd git-setup-helper
   ```
3. Add the Script and README:
- Save the setup_git.sh script and README.md file in the repository directory.

4. Commit and Push:
```bash
git add .
git commit -m "Initial commit"
git push origin main
```
## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## Authors

- [@jemish2810](https://www.github.com/jemish2810)
