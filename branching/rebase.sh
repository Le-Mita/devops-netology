#!/bin/bash
# display command line options

count=1
for param in "$@"; do
<<<<<<< HEAD
<<<<<<< HEAD
    echo "Next parameter: $param"
=======
    echo "Parameter: $param"
>>>>>>> 049b0f2 (git-rebase 1)
=======
    echo "Next parameter: $param"
>>>>>>> 4297ee7 (git-rebase 2)
    count=$(( $count + 1 ))
done

echo "====="
