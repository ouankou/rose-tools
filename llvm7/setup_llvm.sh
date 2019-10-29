
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-7.1.0/llvm-7.1.0.src.tar.xz
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-7.1.0/cfe-7.1.0.src.tar.xz
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-7.1.0/openmp-7.1.0.src.tar.xz
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-7.1.0/compiler-rt-7.1.0.src.tar.xz
tar xf cfe-7.1.0.src.tar.xz
tar xf compiler-rt-7.1.0.src.tar.xz
tar xf llvm-7.1.0.src.tar.xz
tar xf openmp-7.1.0.src.tar.xz
mv cfe-7.1.0.src llvm-7.1.0.src/tools/clang
mv openmp-7.1.0.src llvm-7.1.0.src/projects/openmp
mv compiler-rt-7.1.0.src llvm-7.1.0.src/projects/compiler-rt
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(pwd)/../install -DCLANG_OPENMP_NVPTX_DEFAULT_ARCH=sm_60 -DLIBOMPTARGET_NVPTX_COMPUTE_CAPABILITIES=35,60,70 ../llvm-7.1.0.src

