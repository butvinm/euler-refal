mkdir -p build
rlmake --dont-keep-rasl --tmp-dir build tests/Tests.ref -o build/Tests > /dev/null &&
build/Tests
