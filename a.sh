sudo yum -y update
sudo yum -y install wget
sudo yum -y groupinstall "Development tools" # C compiler

cd ~
mkdir glibc
cd glibc
wget http://ftp.gnu.org/gnu/glibc/glibc-2.18.tar.gz
tar xvzf glibc-2.18.tar.gz
cd glibc-2.18
mkdir build
cd build
../configure --prefix='/opt/glibc-2.18'
sudo make
sudo make install
cd ~
sudo rm -rf glibc

wget https://www.factorio.com/get-download/stable/headless/linux64
tar xvf linux64
rm linux64

wget https://github.com/TundraFizz/Factorio-Server/raw/master/all-mods.zip
unzip -d all-mods all-mods.zip

mkdir factorio/mods
mv all-mods/* factorio/mods
rm all-mods -r
rm all-mods.zip

cd factorio

sudo /opt/glibc-2.18/lib/ld-2.18.so --library-path /opt/glibc-2.18/lib ./bin/x64/factorio --create test.zip --executable-path ./bin/x64/factorio
sudo /opt/glibc-2.18/lib/ld-2.18.so --library-path /opt/glibc-2.18/lib ./bin/x64/factorio --start-server test.zip --executable-path ./bin/x64/factorio
