#!/bin/bash

#Activate virtual enviroment
. /appenv/bin/activate

# Download requirments to build cache
pip download -d /build -r requirements_test.txt --no-input

# Install package requirments
# --no-index -f /build forces install of dependecies from lockal cache instead of pip repository
pip install --no-index -f /build -r requirements_test.txt  


# Run 
exec $@