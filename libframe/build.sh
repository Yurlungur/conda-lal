# No need to run this file directly; just do `conda build .`

export CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export CXXFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export CPPFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export LDFLAGS="-L${PREFIX}/lib"
export CC=gcc
export CXX=g++
export PATH="${PREFIX}/bin:${PATH}"

./configure --prefix=$PREFIX

make

make install
