Installing LAL's python packages
================================

The usual instructions for `pycbc` are
[here](http://ligo-cbc.github.io/pycbc/latest/html/install.html).
They are long, and nested.  This is (hopefully) an easier option.

## Authors ##

`lalsuite`, `libframe`, and `libmetaio` are copywrite the LIGO
Scientific Collaboration.

These recipes were originally created by [Mike Boyle](https://github.com/moble).

## Short Instructions ##

OS X users,

```bash
conda install -c moble pycbc
```

Linux users,

```bash
conda install -c libframe metaio lalsuite
pip install pycbc
```

All other users, see below

## Instructions ##

### Install Anaconda ###

[Install `anaconda` here](https://www.continuum.io/downloads).

Your system python is old and crusty, but it needs to be that way or
your printer might break.  Your package manager needs its own version
of python to support that weird OCR package you want, or whatever it
is this week.  But you---when running straight python on its own---you
want a separate up-to-date version of python to
run fancy new code with.  And most of all you want to minimize the
headaches that usually go along with managing python.

The answer is `anaconda`, which is a python manager developed by the
guy behind `numpy` (and a lot of `scipy`).  He decided that it was
just too much hassle maintaining those big, complex packages with
existing python tools like `pip` and `setuptools`, so he created
`anaconda`.  Scientific python developers have now almost uniformly
adopted this as the way to use python, because there's no better way
to manage python packages.

`Anaconda` installs in your user directory, so you can use it on
clusters just as easily as on your laptop, and it doesn't get mixed up
with your OS or package-manager versions of python.  Outside of its
own directory, the only change it (optionally!) makes is to prepend
its `bin` directory to your `PATH` in your `~/.bashrc` file.

Note that you *should not use* `PYTHONPATH` or similar environment
variables.  Python can still get confused by that occasionally, even
with `anaconda`, so make sure it is not set.


### Create a `conda` environment just for this ###

Since `pycbc` apparently doesn't work with newer versions of python,
you need to do this step if you installed the python 3.5 version of
`anaconda`.  This step is optional if you installed the python 2.7
version, but it might still be nice to contain LAL's dependencies in
one environment.  An analogous thing is also recommended (using the
outdated `virtualenv`) in the `pycbc` installation instructions.  To
create and activate the environment, do this:

```bash
conda create -y --name lal python=2.7
source activate lal
conda config --add channels conda-forge
conda update -y --all
```

Now, your current shell will always use python-y things from this
environment only.  Other shells will not be affected.  And you can get
out of this environment in the current shell just by running
`source deactivate` at any time.

Be sure to run `source activate lal` in any new shell before you try
using or installing in this environment.

### Populate the environment with basic packages ###

Whether or not you created the `lal` environment above, you should run
these commands:

```bash
conda install -y numpy h5py cython conda-build fftw gsl
pip install python-cjson
conda build libframe
conda install --use-local libframe
conda build metaio
conda install --use-local metaio
conda build lalsuite
conda install --use-local lalsuite
pip install pycbc
```
