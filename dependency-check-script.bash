echo "Hello there"
echo "My name is $(whoami)"
echo "Nice to meet you"

# ./dependency-check.sh -h
# ./dependency-check.sh --out . --scan ./
cd ./dependency-check/bin
chmod +x ./dependency-check.sh
pwd
# ls -F
./dependency-check.sh --project react-project --scan ../../../react-buggy --out ModuleVulnerabilities