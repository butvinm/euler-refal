mkdir -p build
# rlmake --dont-keep-rasl tests/Test-9.ref -o build/Test-9 && build/Test-9
# rlmake --dont-keep-rasl tests/Test-22.ref -o build/Test-22 && build/Test-22
rlmake --dont-keep-rasl --dont-keep-rasls tests/Tests.ref -o build/Tests > /dev/null &&
build/Tests
