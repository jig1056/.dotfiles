# Dotfiles Setup with GNU Stow

Manage your dotfiles easily and cleanly using [GNU Stow](https://www.gnu.org/software/stow/).

---

## 🚀 Getting Started

1. Clone this repo into your home directory:
   ```bash
   git clone https://github.com/<your-username>/dotfiles.git ~/.dotfiles
   ```

2. Change into the `.dotfiles` directory:
   ```bash
   cd ~/.dotfiles
   ```

3. Use Stow to symlink your configs:
   ```bash
   stow .
   ```

That’s it! 🎉 Your dotfiles are now symlinked into place.

---
### Setup and export $HOMEDIR

This is will create the ~/.localvars.sh and include HOMEDIR.  Make sure you are in the directory you want to be your $HOMEDIR
```bash
echo "export HOMEDIR=\"$(pwd)\"" >> ~/.localvars.sh
```
---

## 🛠 Manual Setup 

If you’re migrating from an existing setup, follow these steps to back up and prepare.

### 1. Create a Backup Directory
```bash
mkdir ~/backup-pre-dotfiles
```

### 2. Backup Files and Folders
```bash
cd ~
cp .p10k.zsh .zprofile .zshrc backup-pre-dotfiles
cp -R .oh-my-zsh backup-pre-dotfiles
```

### 3. Create the `.dotfiles` Directory
```bash
cd ~
mkdir .dotfiles
```

### 4. Move Files to `.dotfiles`
```bash
mv .p10k.zsh .zprofile .zshrc .dotfiles
```

### 5. Copy `oh-my-zsh/custom` into `.dotfiles`
```bash
cp -R ~/.oh-my-zsh/custom ~/.dotfiles/.oh-my-zsh
```

### 6. Rename and Move `~/.oh-my-zsh/custom`
```bash
mv ~/.oh-my-zsh/custom ~/.oh-my-zsh/custom.bak
```

### 7. Install GNU Stow
```bash
brew install stow
```

### 8. Apply Dotfiles with Stow
```bash
cd ~/.dotfiles
stow .
```

---

## 📂 Folder Structure

After setup, your `.dotfiles` directory should look like this:

```
.dotfiles/
├── .p10k.zsh
├── .zprofile
├── .zshrc
└── .oh-my-zsh/
    └── custom/
        ├── aliases.zsh
        ├── functions.zsh
        └── themes/
```

*(Files inside `custom/` are just examples — add your own.)*

---

## 📌 Common Stow Commands

Here are some useful commands you’ll use often:

- **Stow everything**  
  ```bash
  stow .
  ```

- **Stow a single package (e.g., zsh configs)**  
  ```bash
  stow zsh
  ```

- **Unstow (remove symlinks for a package)**  
  ```bash
  stow -D zsh
  ```

- **Restow (refresh symlinks after changes)**  
  ```bash
  stow -R zsh
  ```

- **Dry-run (see what would happen, without changing files)**  
  ```bash
  stow -nv zsh
  ```

---

✅ You’re all set — your dotfiles are now backed up, version-controlled, and symlinked with GNU Stow!
