dotmod() {
    if [ -z "$1" ]; then
        echo "Usage: dotmod <file>"
        return 1
    fi

    chezmoi edit "$1"
}

dotadd() {
    if [ -z "$1" ]; then
        echo "Usage: dotadd <file>"
        return 1
    fi

    # Check if the file exists
    if [ ! -f "$1" ] && [ ! -d "$1" ]; then
        echo "File or directory '$1' does not exist."
        return 1
    fi

    # Add the file to Chezmoi
    chezmoi add "$1"
}
