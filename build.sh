#!/usr/bin/env bash

echo $1
echo $2

# build native headers from java source
ant javah

# find and replace package & headers name
find ./build/headers/ -type f -exec sed -i -e "s/com_sun_jna/shadow_jna/g" {} \;  # rename within files
mv ./build/headers/com_sun_jna_Native.h ./build/headers/shadow_jna_Native.h
mv ./build/headers/com_sun_jna_Function.h ./build/headers/shadow_jna_Function.h
mv ./build/headers/com_sun_jna_win32_DLLCallback.h ./build/headers/shadow_jna_win32_DLLCallback.h

# build native libraries
ant native

# build jar files

ant jar
