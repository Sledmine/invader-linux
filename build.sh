cd /workspace && rm -rf ext/riat && \
    git clone https://github.com/SnowyMouse/riat ext/riat

# Add missing climits include if ot does not exist
grep -q climits /workspace/src/tag/parser/compile/model.cpp || \
sed -i '2 i\#include <climits>' /workspace/src/tag/parser/compile/model.cpp

# Build invader
cd /workspace && mkdir build ; cd build && cmake .. && make -j $(nproc)

# Build six-shooter
cd /invader && git clone https://github.com/SnowyMouse/six-shooter && \
cd six-shooter && mkdir build ; cd build && cmake .. && make -j $(nproc) && \
cp six-shooter /workspace/build
