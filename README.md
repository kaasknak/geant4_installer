# geant4_installer
This script will install CERN's GEANT4 on the WSL running ubuntu 18.04.
It should work with other versions as well assuming the dependencies are present but I have not tested it.
It does call for apt so if your distribution does not use apt you might want to change the script or omit this part form the script.

# Why does it need sudo access?
The script installs the dependencies from the repos and later installs and compiles the program in /opt
If you don't want this you can manually install the dependencies and from your repos or compile them yourself and comment this part of the code out and you can edit it to compile the program in your home folder.

# What are some of the limitations of this script?
It is dependent on the tar file from the geant website and it requests version geant4.10.06.p02. If there is an update this might not be the most recent version. If this file is unavailable online the script will not work.
It does not check your input. If you put nonsense there it will try to execute it as such.
It does not know which package manager you are using nor does it know which distribution you have installed. This might affect your experience if you want to install it on anything but ubuntu 18.04 on the WSL.

# Which improvements need to be made?
The script is MIT licensed so you can use it however you want. If you have ideas on how to improve upon it feel free to do so and I shall merge commits that are helpful.
The following things should be added at some point. Feel free to commit them:
* Check to see whether the input is valid.
* Check to see whether the file download succeeded.
* Check to see whether the compilation succeeded
* Option to install in the home folder without sudo access
* Optional: packagemanager / distro check
