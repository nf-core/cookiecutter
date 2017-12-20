#!/usr/bin bash

#### Cookiecutter Post-Generation Script
# Runs after the cookiecutter script has run

# Remove the repo readme and replace with the cookiecutter readme
rm ../README.md
mv ../README-pipeline.md ../README.md

# Delete the MIT licence file if not using the MIT licence
if [ "${{ cookiecutter.mit_licence }}" != "y" ]; then     ## GOOD
    rm ../LICENCE
fi
