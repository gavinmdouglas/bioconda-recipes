#!/bin/bash -e

# Build statically linked binary with Rust
C_INCLUDE_PATH=$PREFIX/include \
LIBRARY_PATH=$PREFIX/lib \
LIBCLANG_PATH=$PREFIX/lib/libclang.so \
OPENSSL_DIR=$PREFIX \
cargo build --release

# Install the binaries
C_INCLUDE_PATH=$PREFIX/include \
LIBRARY_PATH=$PREFIX/lib \
LIBCLANG_PATH=$PREFIX/lib/libclang.so \
OPENSSL_DIR=$PREFIX \
cargo install --force --root $PREFIX

# move Rscript
cp src/bin/snp_density_plots.R $CONDA_PREFIX/bin/

# move python module
cp src/bin/cluster.py $CONDA_PREFIX/bin/
chmod +x $CONDA_PREFIX/bin/cluster.py
