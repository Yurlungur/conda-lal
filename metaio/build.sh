# No need to run this file directly; just do `conda build .`

# echo "" | ./00boot

./configure --prefix=${PREFIX}

make

make install
