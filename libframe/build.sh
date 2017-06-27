# No need to run this file directly; just do `conda build .`

export CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export CXXFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export CPPFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export LDFLAGS="-L${PREFIX}/lib"
export PATH="${PREFIX}/bin:${PATH}"
export CC="${PREFIX}/bin/gcc --sysroot=${PERFIX}"
export CXX="${PREFIX}/bin/g++ --sysroot=${PREFIX}"

./configure --prefix=$PREFIX

make

make install
