
# cd ./dependency-check/bin
pwd
ls -F
chmod +x ./dependency-check/bin/dependency-check.sh
./dependency-check/bin/dependency-check.sh --project react-project --scan ./react-buggy --out ModuleVulnerabilities
# cd ..
# cd ..