#! /bin/bash
# ---------------------------------------------------------------
# Builds all the palettes in one batch
# ---------------------------------------------------------------
pushd () {
    command pushd "$@" > /dev/null
}
popd () {
    command popd "$@" > /dev/null
}
echo "This script will build all the palettes in this folder."
palletes="Apache Concurrency Tuples Diagnostics Dsl Fol Fsm Gnuplot Graphviz Http Jdbc Json Ltl Mtnp Provenance Serialization Signal WebSocket Xml"
for dir in $palletes
do
 if [[ $dir == "lib/" ]]; then continue; fi
 echo Building $dir...
 pushd $dir
 ant -q download-deps > /dev/null
 #if [ $? -ne 0 ]; then echo "Error downloading dependencies"; fi
 ant -q > /dev/null
 #if [ $? -ne 0 ]; then echo "Error building palette"; fi
 popd
done
