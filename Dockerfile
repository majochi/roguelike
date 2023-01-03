FROM scratch
COPY ./target/wasm32-wasi/release/roguelike.wasm /roguelike.wasm

ENTRYPOINT [ "/roguelike.wasm" ]
