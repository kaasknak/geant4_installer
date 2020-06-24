#!/bin/bash
# Installer for geant4 for the WSL ubuntu.
if [[ $(id -u) -ne 0 ]]
  then echo "This installer needs to run as root. Rerun using sudo."
  exit
fi
echo "<<<<<>>>>>"
echo "Installing required packages"
apt-get install libxerces-c3-dev qt4-dev-tools freeglut3-dev libmotif-dev tk-dev cmake libxpm-dev libxmu-dev libxi-dev
echo "<<<<<>>>>>"
echo "Creating work enviroment"
cd /opt
mkdir geant4
cd geant4
echo "<<<<<>>>>>"
echo "Downloading source code"
wget http://geant4-data.web.cern.ch/geant4-data/releases/geant4.10.06.p02.tar.gz
tar -zxf geant4.10.06.p02.tar.gz
mkdir geant4.10.06.p02-build
cd geant4.10.06.p02-build
cmake -DCMAKE_INSTALL_PREFIX=../geant4.10.06.p02-install -DGEANT4_INSTALL_DATA=ON -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_GDML=ON -DGEANT4_USE_XM=ON  -DGEANT4_USE_QT=ON -DGEANT4_BUILD_MULTITHREADED=ON ../geant4.10.06.p02
echo "<<<<<>>>>>"
echo "How many cores do you want GEANT4 to use?"
read coreN
echo "<<<<<>>>>>"
echo "Start compiling"
make -j$coreN
make install -j$coreN
echo "<<<<<>>>>>"
echo "Setting enviroment variables"
cd $HOME
echo "# GEANT4" >> .bashrc
echo "source /opt/geant4/geant4.10.06.p02-install/bin/geant4.sh" >> .bashrc
source /opt/geant4/geant4.10.06.p02-install/bin/geant4.sh
echo "<<<<<>>>>>"
echo "Testing GEANT4"
mkdir geant4-test
mkdir geant4-test/g4work
mkdir geant4-test/g4work/basic
cd geant4-test/g4work/basic
cp -r /opt/geant4/geant4.10.06.p02/examples/basic/B2 .
mkdir B2-build
cd B2-build
cmake ../B2
make -j$coreN
cd B2b
./exampleB2b
cd $HOME
chown -R $USER geant4-test
