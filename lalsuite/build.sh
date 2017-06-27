# No need to run this file directly; just do `conda build -c moble -c conda-forge .` in this directory

export LALSUITE_SRCDIR=${SRC_DIR}
export LALSUITE_PREFIX=${PREFIX}

export CFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export CXXFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export CPPFLAGS="-I${PREFIX}/include -I${PREFIX}/include/gsl"
export LDFLAGS="-L${PREFIX}/lib"
export PATH="${PREFIX}/bin:${PATH}"
export CC="${PREFIX}/bin/gcc --sysroot=${PERFIX}"
export CXX="${PREFIX}/bin/g++ --sysroot=${PREFIX}"

./00boot

./configure --prefix=${PREFIX} \
    --with-sysroot=${PREFIX} \
    --enable-swig-python \
    --disable-lalstochastic --disable-lalxml \
    --disable-lalinference --disable-laldetchar \
    --disable-lalapps

make -j

make install

source ${LALSUITE_PREFIX}/etc/lalsuiterc

cd ${LALSUITE_SRCDIR}/glue
rm -rf build
python setup.py install
source ${LALSUITE_PREFIX}/etc/glue-user-env.sh

cd ${LALSUITE_SRCDIR}/pylal
rm -rf build
python setup.py install
