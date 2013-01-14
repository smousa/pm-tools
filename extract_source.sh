 #!/usr/bin/env bash

set -e

# bomb out if a variable is not set.
set -o nounset

echo "Usage: $0 source.rpm /dest/dir"
echo 

SRC=$(readlink -e $1)
OUT=$(readlink -f $2)

echo "Extracting: $SRC"
echo "To: $OUT"


mkdir -p $OUT

# I couldn't get cpio to copy files into a specified directory.
pushd $OUT
rpm2cpio $SRC | cpio -idmv
popd
