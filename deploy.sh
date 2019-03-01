#!/bin/sh

if [ ! -d public ]; then
	git worktree add public/ gh-pages
fi

cd public
git pull
cd ..

rm -rf public/*
hugo

commit="$(git rev-parse HEAD | cut -b1-7)"

cd public
git add -A
git commit -m "Deploy $commit"
