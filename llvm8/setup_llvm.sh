
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/llvm-8.0.1.src.tar.xz
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/cfe-8.0.1.src.tar.xz
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/openmp-8.0.1.src.tar.xz
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-8.0.1/compiler-rt-8.0.1.src.tar.xz
tar xf cfe-8.0.1.src.tar.xz
tar xf compiler-rt-8.0.1.src.tar.xz
tar xf llvm-8.0.1.src.tar.xz
tar xf openmp-8.0.1.src.tar.xz
mv cfe-8.0.1.src llvm-8.0.1.src/tools/clang
mv openmp-8.0.1.src llvm-8.0.1.src/projects/openmp
mv compiler-rt-8.0.1.src llvm-8.0.1.src/projects/compiler-rt
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(pwd)/../install -DCLANG_OPENMP_NVPTX_DEFAULT_ARCH=sm_60 -DLIBOMPTARGET_NVPTX_COMPUTE_CAPABILITIES=35,60,70 ../llvm-8.0.1.src

