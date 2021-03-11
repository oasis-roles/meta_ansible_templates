A set of Ansible templates that we need to do our work well.

The subdir "collection" creates a new collection along with all the OASIS-determined scaffolding.
After you create a new collection, run the shell script in the root of that folder to add and update
the appropriate tests directory, which we can't do well with these template directories.

The subdir "role" creates a new role to go into one of our collections.

Both of these can be targeted with your .ansible.cfg or with command line arguments to use with the
`ansible-galaxy init` command or `ansible-galaxy collection init` for the appropriate folders.
