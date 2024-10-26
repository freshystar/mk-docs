# Fix Multipass Client not Authenticated

## Describe the bug for MACOS

When trying to use multipass in any way on my MAC, for example:

```sh
multipass list
```

I get the following output:

```sh
list failed: The client is not authenticated with the Multipass service.
Please use 'multipass authenticate' before proceeding.
```

Then trying

```sh
multipass authenticate
```

results in:

```sh
Please enter passphrase:
authenticate failed: Passphrase is not set. Please 'multipass set local.passphrase' with a trusted client.
```

```sh
multipass set local.passphrase
```

results in

```sh
Please enter passphrase:
Please re-enter passphrase:
set failed: The client is not authenticated with the Multipasss service.
Please use 'multipass authenticate' before  proceeding.
```

## Solution for macOS

I resolved this issue on macOS by following these steps:

- Open the terminal and switch to the root user with:
   ```bash
   sudo -i
   ```
- Manually remove the Multipass folders from `/var/root/Application 
Support/` using (There were 2 in my case):
   ```bash
   cd /var/root/Library/Application\ Support
   rm -rf multipass*
   ```
- Manually  remove the multipass from `/usr/local/caskroom/` using :
  ```sh
   cd /usr/local/caskroom
   rm -rf multipass
   ```

- Uninstall Multipass with Homebrew using the `--zap` option, which 
removes all related files:
   ```bash
   brew --zap uninstall multipass
   ```

- Reinstall Multipass with Homebrew:
   ```bash
   brew install --cask multipass
   ```

After following these steps, everything works as expected.

