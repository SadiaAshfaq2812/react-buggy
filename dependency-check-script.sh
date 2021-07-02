
cd ./dependency-check/bin
chmod +x ./dependency-check.sh
./dependency-check.sh --project react-project --scan ../../../react-buggy --out ModuleVulnerabilities
cd ..
cd ..