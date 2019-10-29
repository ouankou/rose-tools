
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(pwd)/../install \
	-DCMAKE_C_COMPILER=$(pwd)/../install/bin/clang \
	-DCMAKE_CXX_COMPILER=$(pwd)/../install/bin/clang++ \
	-DLIBOMPTARGET_NVPTX_COMPUTE_CAPABILITIES=35,60,70 \
	../llvm-7.1.0.src/projects/openmp
