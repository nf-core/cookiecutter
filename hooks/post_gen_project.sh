#!/usr/bin bash

#### Cookiecutter Post-Generation Script
# Runs after the cookiecutter script has run

# Delete the MIT licence file if not using the MIT licence
if [ "${{ cookiecutter.mit_licence }}" != "y" ]; then     ## GOOD
    rm ../LICENCE
fi
