
wget https://releases.llvm.org/9.0.0/llvm-9.0.0.src.tar.xz 
wget https://releases.llvm.org/9.0.0/cfe-9.0.0.src.tar.xz 
wget https://releases.llvm.org/9.0.0/openmp-9.0.0.src.tar.xz
wget https://releases.llvm.org/9.0.0/compiler-rt-9.0.0.src.tar.xz
tar xf cfe-9.0.0.src.tar.xz
tar xf compiler-rt-9.0.0.src.tar.xz
tar xf llvm-9.0.0.src.tar.xz
tar xf openmp-9.0.0.src.tar.xz
mv cfe-9.0.0.src llvm-9.0.0.src/tools/clang
mv openmp-9.0.0.src llvm-9.0.0.src/projects/openmp
mv compiler-rt-9.0.0.src llvm-9.0.0.src/projects/compiler-rt
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(pwd)/../install -DCLANG_OPENMP_NVPTX_DEFAULT_ARCH=sm_60 -DLIBOMPTARGET_NVPTX_COMPUTE_CAPABILITIES=35,60,70 ../llvm-9.0.0.src

