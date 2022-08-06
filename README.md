# Local Installation for Moodle

Nowadays it is very common the use of web apps to help the learning process. However, servers need maintenance and sometimes connections are not available. In such circumstances (and in many others) it is desirable to have a local installation to ensure continuity of work.

This repo allows a fast installation of Moodle v3 (it is trivial to change the version) through docker installed in a VM. This architecture (host -> VM -> Docker -> Moodle) might seem too complex, but it really isn't and:

* It is a multi-platform solution, it should work in Linux, Windows and Mac
* It is very fast. Once downloaded the project, you could use your Moodle in just a few minutes
* It does not affect host configurations. All the components are encapsulated in a virtual machine,
local applications and configurations are safe, as virtual machines are isolated sandboxes.

# Requirements

The host machine should be an x86 platform with a minimum of:

* 4 cores
* 8 GB of RAM

If the capacity is lower than prescribed, it is possible to tweak the Vagrantfile to reduce the requirements.

Regarding the software, you should have installed:

* VirtualBox. You should have a virtual host adapter with the IP address 192.168.56.1 (this is the default configuration in usual installations)
* Vagrant


# User guide

The first time you use the machine you should:
1. Create a folder (e.g. c:\VagBoxes\MoodleV3)
1. Use a console (cmd, powershell, bash, etc.) to go to that folder.
1. Execute vagrant up
1. Wait until the process finishes.
1. Wait a couple more minutes to let moodle self configure.
1. Access to moodle by http://192.168.56.100 (through the host-only adapter). To login, the user is admin
and the password is moodle

To stop the machine:
1. Use a console to go to the folder where the Vagrantfile is located
1. Execute vagrant halt

All other times, except the first time, to start the virtual machine:
1. Use a console to go to the folder where the Vagrantfile is located
1. Execute vagrant up

You may also execute vagrant up \<machine id\> or vagrant halt \<machine id\> if you know which
is \<machine id\>. You may find it out executing:

```bash
vagrabt global-status
```

You could also (though it shoudn't be necessary) enter to the virtual machine with:

```bash
vagrant ssh <machine id>
```

You should note that everything that is created with vagrant should be managed with vagrant. DON'T USE THE VIRTUALBOX CONSOLE OR THE VIRTUALBOX CLI TO START OR STOP VAGRANT MACHINES