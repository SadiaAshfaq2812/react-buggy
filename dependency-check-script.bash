
cd ./dependency-check/bin
chmod +x ./dependency-check.bash
./dependency-check.bash --project react-project --scan ./ --out ModuleVulnerabilities
cd ..
cd ..