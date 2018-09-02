git
===

Installs and configures git.

## Signing commits with GPG

In `group_vars/local`, set `git_signing_key` to the ID of the GPG key you use to sign commits.

```bash
$ gpg --list-secret-keys
```

```yaml
# In group_vars/local

git_signing_key: E870EE00
```
