# No need to run this file directly; just do `conda build .`

# echo "" | ./00boot

export CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export CXXFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export CPPFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export LDFLAGS="-L${PREFIX}/lib"
export CC=gcc
export CXX=g++

./configure --prefix=${PREFIX}

make

make install
