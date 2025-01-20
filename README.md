# Chezmoi Configuration

This repository contains my personal configuration managed by [chezmoi](https://www.chezmoi.io/).

## Installation

To apply this configuration on your system, follow these steps:

1. Install chezmoi:
    ```sh
    sh -c "$(curl -fsLS get.chezmoi.io)"
    ```

2. Initialize chezmoi with this repository:
    ```sh
    chezmoi init --apply https://github.com/codingwithanxiety/dots
    ```

## Structure

- `dotfiles/`: Contains all the dotfiles managed by chezmoi.
- `scripts/`: Custom scripts for setup and maintenance.

## Usage

To update your configuration, make changes in this repository and apply them with:
```sh
chezmoi apply
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.