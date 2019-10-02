# rose-tools

Tools for rose development.


## Installation


## Build ROSE Image:

#### With Tags:

`sudo docker build -t rose-dev:0.1 .`


## Run Container:

### Start Interactive Bash:

#### Mount Directory:

To operate on the files/folders on the host system, current host user has to be mapped to the container.

`sudo docker run -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --name rosedev -v ~/Projects/rose:/rose -u $(id -u ${USER}):$(id -g ${USER}) rose-dev:0.1 /bin/bash`

The extra parameter is applied specifically for gdb running inside Docker container.

## Work on ROSE in Docker:

#### Enter Existing Docker Container:

`sudo docker exec -it rosedev /bin/bash`

#### Build without ompparser library:

```bash
# Enter ROSE source code folder.
./build
# Enter ROSE build tree folder.
../rose_src/configure --prefix=$ROSE_PATH --with-boost=/usr --with-boost-libdir=/usr/lib/x86_64-linux-gnu/ --enable-languages=c,c++,fortran --enable-projects-directory --disable-tests-directory --disable-tutorial-directory --enable-edg_version=5.0 --with-gomp_omp_runtime_library=/usr/lib/gcc/x86_64-linux-gnu/5
make core -j6
make install-core
```

#### Compile and install ompparser library:

The ompparser library should be mounted inside ROSE docker as well.

```bash
cmake -DCMAKE_INSTALL_PREFIX=../../ompparser_install ..
```

#### Enable ompparser library in ROSE:

```bash
export LD_LIBRARY_PATH=/rose/ompparser-install/lib:$LD_LIBRARY_PATH
../rose_src/configure --prefix=$ROSE_PATH --with-boost=/usr --with-boost-libdir=/usr/lib/x86_64-linux-gnu/ --enable-languages=c,c++,fortran --disable-tests-directory --disable-tutorial-directory --disable-projects-directory --enable-edg_version=5.0 --with-ompparser=/rose/ompparser_install
```

## Troubleshooting:

#### Git submodule rebase conflict:

`git reset origin/ompparser src/frontend/CxxFrontend/EDG`

### Git checkout specific file from another branch:

`git checkout origin/master -- .gitignore`

### Git submodule update:

```bash
cd <submodule_folder>
git pull origin <specific_branch>
cd .. # and commit
```

### Git submodule fix to specific commit:

```bash
cd <submodule_folder>
git checkout <specific_commit_hash>
cd .. # and commit
```
