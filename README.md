dotfiles
========

a few neat features
-------------------

- vim with all my settings.
- Mac packages installed with homebrew. Mac apps installed with homebrew-cask.
- Useful git aliases
- git commit signing with GPG

install
-------

- ansible `pip install ansible`
- homebrew
- git `brew install git`
- Latest version of Xcode `xcode-select --install`

- Clone.

```bash
# NOTE: It is important that you clone to ~/dotfiles
git clone https://github.com/benortiz/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

- Update the following variables in `group_vars/local` (at a minimum)
    - `full_name`: Your name, which will be attached to commit messages, e.g.
      "Benjamin Ortiz"
    - `git_user`: Your Github username.
    - `git_email`: Your git email address.
- Optional, but recommended: Update `group_vars/local` with the programs you want installed by [homebrew][], [homebrew-cask][], and npm.
    - `homebrew_packages`:  Utilities that don't get installed by the roles.
    - `homebrew_cask_packages`: Mac Apps you want installed with [homebrew-cask][].
- Run the installation script.

```bash
./bin/dot-bootstrap
```

updating your local environment
-------------------------------

Once you have the dotfiles installed you can run the following command to rerun the ansible playbook:

```bash
./bin/dot-update
```

You can optionally pass role names

```bash
./bin/dot-update dotfiles 
```

commands
--------

There are two main commands in the `bin` directory for setting up and updating development environments:

- `dot-bootstrap`: sets up local environment by executing all roles in `local_env.yml`.
- `dot-update`: updates local environment by executing all roles in `local_env.yml` except for the ones tagged with "bootstrap".

troubleshooting
---------------

todo
----

- [ ] rvm support

license
-------

[MIT Licensed](http://sloria.mit-license.org/).
