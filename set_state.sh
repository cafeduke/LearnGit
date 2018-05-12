if [ $# -ne 1 ]
then
   echo "Usage : $0 <commit id>"
   exit 1
fi
commitId=${1}

git reset --hard ${commitId}  

# Change both fruit.txt and version.txt
cp fruit.3.1.txt fruit.txt
cp version.3.1.txt version.txt

# Stage only fruit.txt
git add fruit.txt

# Modify fruit.txt after staging
cp fruit.3.1.mod.txt fruit.txt

echo "------------------------------------------------"
echo "Files"
echo "------------------------------------------------"
pr -m -t fruit.txt version.txt

echo "------------------------------------------------"
echo "Status"
echo "------------------------------------------------"
git status -s
