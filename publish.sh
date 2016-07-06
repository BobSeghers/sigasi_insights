#!/bin/bash

# make sure everything is clean
rm -rf _build || exit -1
git worktree prune || exit -1

# check that there are no uncommited changes
if !  git diff-index --quiet HEAD --
    then
        echo >&2 "You have uncommited changes."
        git diff-files --name-status -r --ignore-submodules -- >&2
        exit -1
fi

echo "Fetch and checkout latest version from Assembla"
git fetch origin gh-pages -q || exit -1
git worktree add _build origin/gh-pages || exit -1

echo "Build"
make build || exit -1

cd _build || exit -1
if !  git diff-index --quiet HEAD --
then
  echo "No changes"
else
  echo "Commit changes"
  git add -A || exit -1
  git commit -m "Update urubu site" || exit -1
  #git push origin gh-pages || exit -1
fi

