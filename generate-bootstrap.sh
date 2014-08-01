#!/usr/bin/env bash

# Copyright (c) 2014 Cameron Kilgore
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Init H5BP
echo "Initalizing HTML5 Boilerplate (v4.3.0)"
curl -L --silent https://github.com/h5bp/html5-boilerplate/archive/v4.3.0.zip | tar zx
cd html5-boilerplate-*
cp -rf . ../
cd ..
rm -rf html5-boilerplate-*

# Initalize and Install bootstrap (v3.2.0)
echo "Initalizing Bootstrap (v3.2.0)"
curl -L --silent https://github.com/twbs/bootstrap/releases/download/v3.2.0/bootstrap-3.2.0-dist.zip | tar zx
cd bootstrap-*

# Move directories
cp -rf css/* ../css
cp -rf fonts ../fonts
cp -rf js/ ../js
cd ..
rm -rf bootstrap-*

# Add Bootstrap tags to the index.html
sed -i "" -e $'15a\\\n        <link rel="stylesheet" href="css\/bootstrap.min.css">' index.html
sed -i "" -e $'16a\\\n        <link rel="stylesheet" href="css\/bootstrap-theme.min.css">' index.html
sed -i "" -e $'30a\\\n<script type="text\/javascript" src=js/bootstrap.min.js><\/script>' index.html

# Initalize Git
git init >> /dev/null 
git add  . >> /dev/null

# Initial Commit
git commit -qm "Initial Commit" >> /dev/null

# We're done
Echo "Directory has been cloned and committed. Good hacking."
