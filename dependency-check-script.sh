ls -la

wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install -y apt-transport-https && sudo apt-get update && sudo apt-get install -y dotnet-sdk-5.0

chmod +x ./dependency-check/bin/dependency-check.sh

./dependency-check/bin/dependency-check.sh --project react-project --scan ./ --out ModuleVulnerabilities