echo "Hello there"
echo "My name is $(whoami)"
echo "Nice to meet you"

pwd
# ./dependency-check.sh -h
# ./dependency-check.sh --out . --scan ./

/workspace:/dependency-check.sh --project react-project --scan gcr.io/thesisproject1859/react --out ModuleVulnerabilities