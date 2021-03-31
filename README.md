<p align="center">
  <img src="graphics/LinboBig.png" alt="Linbo logo" height="300px" />
</p>

---

<p align="center">
  <a href="https://github.com/linuxmuster/linuxmuster-linbo/releases/latest"><img src="https://img.shields.io/github/v/release/linuxmuster/linuxmuster-linbo?logo=github&logoColor=white" alt="GitHub release"/></a>
  <a href="https://github.com/linuxmuster/linuxmuster-linbo/releases/latest"><img src="https://github.com/linuxmuster/linuxmuster-linbo/workflows/Build%20Release/badge.svg" /></a>
  <a href="https://ask.linuxmuster.net"><img src="https://img.shields.io/discourse/users?logo=discourse&logoColor=white&server=https%3A%2F%2Fask.linuxmuster.net" alt="Community Forum"/></a>
</p>

**linuxmuster-linbo** is the free and opensource imaging solution for linuxmuster.net. It handles Windows 7 & 10 and Linux operating systems. Via TFTP and Grub's PXE implementation it boots a small linux system (linbofs) and optionally downloads the [linuxmuster-linbo-gui](https://github.com/linuxmuster/linuxmuster-linbo-gui), which can manage all the imaging tasks on the client. Console tools are also available to manage clients and imaging remotely via the server.  
For more information take a look at the  [wiki](https://github.com/linuxmuster/linuxmuster-linbo/wiki)

# Releases
The latest release can be found [here](https://github.com/linuxmuster/linuxmuster-linbo/releases/latest)  
The attached files `linuxmuster-linbo7_*.deb` and `linuxmuster-linbo-common7_*.deb` are the Packages which you can install on your server.

# Building yourself

* Install 64bit Ubuntu 18.04.

* Add 32bit Architecture:  
  `sudo dpkg --add-architecture i386`  
  `sudo apt update`

* If you are using Ubuntu server or minimal:
  `sudo apt install dpkg-dev`

* Install build depends (uses sudo):  
  `./get-depends.sh`

* Build package:  
  `./buildpackage.sh`

# Creating a release
The following steps have to be followed to create a release:
1. Update the changelog file
3. commit all changes
4. Do a git push: `git push`
6. Create a git tag in the format v+VERSION (eg. v7.0.0): `git tag vVERSION`
7. Push tags: `git push --tags`

In case of a mistake, the tag can be deleted:
1. Locally: `git tag -d vVERSION`
2. Remotely: `git push --delete origin vVERSION`
