# 📊📲 telog

📊📲 telog is an aggregate logs from multiple sources and send real-time notifications to Telegram for efficient monitoring.

## 🛠️ Building

If you need to build Telog manually, follow these steps:

1. **Clone the repository**:

```bash
git clone git@github.com:trinhminhtriet/telog.git
```

2. **Choose the features you want**:

   - `bin_core` - Required for all log sources
   - `ls_counter` - Counter log source
   - `ls_filesystem` - Filesystem log source
   - `ls_journald` - Journald log source
   - `ls_docker` - Docker log source

3. **Build the project** with the selected features:

```bash
cargo build --release --features=bin_core,ls_filesystem
```

### Making `.deb` package 📦

1. **Install** [`cargo-deb`](https://github.com/mmstick/cargo-deb):

```bash
cargo install cargo-deb
```

2. **Edit** `package.metadata.deb.features` in `Cargo.toml`.

3. **Build the package**:

```bash
cargo deb
```

4. **Use** the generated package:

```bash
target/debian/telog_..._amd64.deb
```

### Making `.rpm` package 📦

1. **Install** [`cargo-generate-rpm`](https://github.com/cat-in-136/cargo-generate-rpm):

```bash
cargo install cargo-generate-rpm
```

2. **Build the project**:

```bash
cargo build --release --features=bin_core,...
```

3. **Strip debug symbols**:

```bash
strip -s target/release/telog
```

4. **Build the package**:

```bash
cargo generate-rpm
```

5. **Use** the generated package:

```bash
target/generate-rpm/telog-...x86_64.rpm
```

## 🗑️ Uninstallation

Running the below command will globally uninstall the `telog` binary.

```bash
cargo uninstall telog
```

Remove the project repo

```bash
rm -rf /path/to/git/clone/telog
```

## 🚀 Usage

1. **Create a Telegram bot** via [@BotFather](https://t.me/BotFather) 🤖

2. **Download the latest Telog release** from [GitHub](https://github.com/trinhminhtriet/telog/releases/tag/latest) 📥

3. **Install it**:

- For `.deb` based Linux:

```bash
sudo dpkg -i telog-...amd64.deb
```

- For `.rpm` based Linux:

```bash
sudo rpm -i telog-...x86_64.rpm
```

4. **Find out the chat ID** with your bot (see chat_id.md for details) 🆔

5. **Change the configuration** file (`/etc/telog.yaml` in Linux) (see config.md for details) ⚙️

6. **Run Telog**:

```bash
sudo systemctl start telog
```

7. **Add it to autostart**:

```bash
sudo systemctl enable telog
```

## 🤝 How to contribute

We welcome contributions!

- Fork this repository;
- Create a branch with your feature: `git checkout -b my-feature`;
- Commit your changes: `git commit -m "feat: my new feature"`;
- Push to your branch: `git push origin my-feature`.

Once your pull request has been merged, you can delete your branch.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
