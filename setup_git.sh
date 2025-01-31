#!/bin/bash

# Variables
SSH_KEY_NAME="jemish.harsora.github_id_rsa"
SSH_KEY_PATH="$HOME/.ssh/$SSH_KEY_NAME"
GITHUB_USERNAME="your_github_username"
GITHUB_EMAIL="your_email@example.com"

# Function to detect the operating system
detect_os() {
    case "$(uname -s)" in
        Linux*)     OS="Linux";;
        Darwin*)    OS="macOS";;
        CYGWIN*|MINGW*|MSYS*) OS="Windows";;
        *)          OS="Unknown";;
    esac
    echo "Detected OS: $OS"
}

# Function to start SSH agent and add SSH key
start_ssh_agent() {
    echo "Starting SSH agent..."
    eval "$(ssh-agent -s)"

    echo "Adding SSH key to the agent..."
    ssh-add "$SSH_KEY_PATH"
}

# Part 1: Generate SSH Key and Configure Git
generate_ssh_key() {
    # Step 1: Generate SSH Key (if it doesn't exist)
    if [ ! -f "$SSH_KEY_PATH" ]; then
        echo "SSH key not found. Generating a new SSH key..."
        ssh-keygen -t rsa -b 4096 -C "$GITHUB_EMAIL" -f "$SSH_KEY_PATH"
        echo "SSH key generated at $SSH_KEY_PATH."
    else
        echo "SSH key already exists at $SSH_KEY_PATH."
    fi

    # Step 2: Start SSH Agent and Add SSH Key
    detect_os
    if [ "$OS" = "Windows" ]; then
        # Windows-specific SSH agent setup
        if ! pgrep ssh-agent > /dev/null; then
            echo "Starting SSH agent on Windows..."
            eval $(ssh-agent -s)
        fi
        ssh-add "$SSH_KEY_PATH"
    else
        # macOS and Linux
        start_ssh_agent
    fi

    # Step 3: Test SSH Connection to GitHub
    echo "Testing SSH connection to GitHub..."
    ssh -T -i "$SSH_KEY_PATH" git@github.com

    # Step 4: Configure Git
    echo "Configuring Git..."
    git config --global user.name "$GITHUB_USERNAME"
    git config --global user.email "$GITHUB_EMAIL"
}

# Part 2: Perform Git Operations
git_operations() {
    while true; do
        echo -e "\nSelect an option:"
        echo "1. Clone a repository"
        echo "2. Pull changes"
        echo "3. Fetch changes"
        echo "4. Push changes"
        echo "5. Exit"
        read -p "Enter your choice (1-5): " choice

        case $choice in
            1)
                read -p "Enter the SSH URL of the repository to clone: " repo_url
                git -c core.sshCommand="ssh -i $SSH_KEY_PATH" clone "$repo_url"
                ;;
            2)
                read -p "Enter the path to the repository directory: " repo_dir
                cd "$repo_dir" || { echo "Directory not found!"; continue; }
                git -c core.sshCommand="ssh -i $SSH_KEY_PATH" pull origin main
                ;;
            3)
                read -p "Enter the path to the repository directory: " repo_dir
                cd "$repo_dir" || { echo "Directory not found!"; continue; }
                git -c core.sshCommand="ssh -i $SSH_KEY_PATH" fetch origin
                ;;
            4)
                read -p "Enter the path to the repository directory: " repo_dir
                cd "$repo_dir" || { echo "Directory not found!"; continue; }
                git add .
                read -p "Enter your commit message: " commit_message
                git commit -m "$commit_message"
                git -c core.sshCommand="ssh -i $SSH_KEY_PATH" push origin main
                ;;
            5)
                echo "Exiting..."
                break
                ;;
            *)
                echo "Invalid choice! Please try again."
                ;;
        esac
    done
}

# Main Menu
while true; do
    echo -e "\nSelect an option:"
    echo "1. Generate SSH Key and Configure Git"
    echo "2. Perform Git Operations"
    echo "3. Exit"
    read -p "Enter your choice (1-3): " main_choice

    case $main_choice in
        1)
            generate_ssh_key
            ;;
        2)
            git_operations
            ;;
        3)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice! Please try again."
            ;;
    esac
done
