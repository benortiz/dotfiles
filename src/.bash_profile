# bashrc v bash_profile v profile
# 
# profile
# Will be included in any shell loaded, include common items such as PATH and
# other environment variables.
#
# bashrc
# For configuring bash specifically. Automatically loaded for non-login shells.
#
# bash_profile
# Loaded on login, so it's great for making sure that both profile and bashrc
# are loaded for login shells (like SSH).
. ~/.profile
. ~/.bashrc
