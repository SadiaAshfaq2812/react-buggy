
# cd ./dependency-check/bin
# cd workspace
# pwd
ls -F
chmod +x ./dependency-check/bin/dependency-check.sh
./dependency-check/bin/dependency-check.sh --project react-project --scan ./ --out ModuleVulnerabilities
# cd ..
# cd ..