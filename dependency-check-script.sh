
cd ./dependency-check/bin
chmod +x ./dependency-check.sh
./dependency-check.sh --project react-project --scan ./ --out ModuleVulnerabilities
cd ..
cd ..