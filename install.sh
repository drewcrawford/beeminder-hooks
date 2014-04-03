set -e
git config --global init.templatedir '~/.git-templates'
mkdir -p ~/.git-templates/hooks
cp post-commit ~/.git-templates/hooks
chmod a+x ~/.git-templates/hooks/post-commit
curl -Ol https://raw.githubusercontent.com/lydgate/bmndr/master/bmndr
mv bmndr /usr/local/bin/bmndr
chmod a+x /usr/local/bin/bmndr
bmndr #confirm this actually works, also emits a nice message prompting you to enter your API key
echo "Checking your API key..."
GOALS=`bmndr`
if echo "$GOALS" | grep -q "commits"; then
	true
else
	echo "You don't have a goal called commits.  Create that goal and run this again."
	exit 1
fi
echo "Installed.  You will have to run 'git init' in all your repos for this to actually work."