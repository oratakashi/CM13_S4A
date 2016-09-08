Advan S4A
=========================

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | 1.2GHz Dual-Core MTK6572 Overclocked 1.4GHz
GPU     | Mali 400 MP
Memory  | 512MB RAM
Shipped Android Version | 4.2.2
Current Stable Android Version | 5.1.1
Current Android Version | 6.0.1
Storage | 4GB
Battery | 1300 mAh
Display | 4" 480x800 px
Camera  | 5.0MPx.


This branch is for building CyanogenMod 13.0 ROM.

Whats Working :
===============

Hardware   | Working
-------:|:-------------------------
Wifi     | Yes 
Bluetoth | Yes
Sensor  | Yes
Camera | No
Vidio Recording | No
Vidio Encoding | Yes
VPN | Yes
Hostspot | Yes
RIL | Yes

Getting Started
---------------
To get started with building from Orata Team sources, you'll need to get
familiar with [Git and Repo](http://source.android.com/source/version-control.html).

How To Build CM13 ROM for your device - Tutorial
--------
### New Way to set up and build CM13.

##### Simply copy and paste this in a terminal window:

     $ git clone https://github.com/oratakashi/CM13_S4A.git
     $ cd ~/platform_manifest
     $ ./setup.sh

Once done, the source code should be already set up and you can head on to build RR by using the RR Wizard which is located in the same folder so simply copy and paste this in a terminal window:

     $./build.sh

---

### Old Way to set up and build CM13.

### Build Environment

- Tested and Working on any version of Ubuntu - 14.04,14.10,15.04 (64-bit)
- Any other distribution based of the Ubuntu Distro such as Lubuntu, Xubuntu and etc.
- Any form of Terminal
- Decent hardware (minimum of at least a dual core CPU and 4 GB of RAM)
- A storage unit of any kind (We recommend utilizing SSDs as Mechanical HDDs slow down the build proccess drastically and the minimum storage size is 70GB. Having more will be useful with CCache[More on that later])
- Required Packages should have been installed

### Required Packages
##### Simply copy and paste this in a terminal window:
[Hint: This command updates the Ubuntu Packages List (Install Listing) and install the required version of Java]

     $ sudo apt-get install openjdk-7-jdk

### Let that install and then proceed.

### More copy and paste:
[Hint: Running this command installs the other required packages to build android]

     $ sudo apt-get update && sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-7-jre openjdk-7-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib

### Getting the Source
- Making required directories
- Obtaining the repo binary
- Adding repo binary to your path
- Giving the repo binary proper permissions
- Initializing an empty repo
- Syncing the repo

Alright, so now we’re getting there. I have outlined the basics of what we’re about to do and broke them down as I know them. This is all pretty much going to be copy/paste so it’ll be fairly difficult to screw this up :)

##### Make directory for the repo binary

      $ mkdir ~/bin

##### Add directory for the repo binary to its path

      $ PATH=~/bin:$PATH

##### Downloading repo binary and placing it in the proper directory

      $ curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo

##### Giving the repo binary the proper permissions

      $ chmod a+x ~/bin/repo

##### Creating directory for where the CM repo will be stored and synced

      $ mkdir ~/cm
      $ cd ~/cm

##### Initializing the CM repo and downloading the manifest

      $  repo init -u https://github.com/oratakashi/CM13_S4A.git -b master

##### Syncing the source
[Hint: This might take a long time as the source is about 13GB+]

      $  repo sync -c -f -j4 --force-sync --no-clone-bundle

###Building the CM13 ROM
- Preparing Required Binaries and Device Drivers
- Setting Up CCache (Optional)
- Building CM13

Congratulations on the succesfull build initialization! Now, we shall go ahead and prepare to build for your device!

##### Preparing CM13 ROM for devices
- Follow the AOSP Porting Instructions stated here to prepare the proprietary files for building for your device: (http://xda-university.com/as-a-developer/porting-aosp-roms-using-source-code)

##### Setting Up CCache
- CCache is a method of utilizing a specified storage space to speed up building. It can be referred to as the same caching your android device does to speed up application and system boot times. In this case, CCache will help build CM13 faster than standard build times (Able to cut-down 50% of time taken to build).
- To set up CCache, follow the following:


        $ echo "export USE_CCACHE=1" >> ~/.bashrc
      
        $ ~/RR/prebuilts/misc/linux-x86/ccache/ccache -M 50G

     -M 50G
The number before the letter G at the end specifies the amount of space CCache can use in your storage unit. As such, ensure that not too much of space is specified as this might result in unexpected errors although, the more storage you have, its recommended to have more CCache as it will increase the build times. Most efficient build systems are able to utilize CCache to about 120G or more.

##### To build CM13x ROM

      $ cd ~/cm
      $ . build/envsetup.sh && brunch <device>

##### Obtaining the zip created from the build process
To get the zip file that has been built, navigate to the following directory and find for the zip file:

      $ cd ~/cm/out/target/product/<devicename>/

If you found it, then congratulations! If you didn't, try retrying the build process but before doing so, ensure you do the following to make sure your next build is clean;

      $ cd ~/cm
      $ make clean
      $ repo sync --force-sync

After doing so, redo everything stated from the Building Section.
