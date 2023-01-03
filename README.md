# Roguelike Tutorial in Rust workbook

https://bfnightly.bracketproductions.com

Let's see how far I can get.

## Preparations

### Install Rust and WASM toolchain

```shell
brew install rustup-init
rustup-init
rustup target add wasm32-unknown-unknown
cargo install wasm-bindgen-cli
```

### Build

```shell
cargo build --release --target wasm32-unknown-unknown
wasm-bindgen target/wasm32-unknown-unknown/release/roguelike.wasm --out-dir wasm --no-modules
```

#### wasm32-wasi

```shell
rustup target add wasm32-wasi
cargo build --release --target wasm32-wasi
docker buildx build --platform wasi/wasm32 -t roguelike .
docker run --rm --platform wasi/wasm32 --runtime=io.containerd.wasmedge.v1 roguelike
```

### Serve Files (local file loading not permitted in browsers)

TODO: explore cargo-web

#### Example using Python

```shell
python -m http.server
```

(open http://localhost:8000)

#### Example using Deno

```shell
brew install deno
deno install --allow-net --allow-read https://deno.land/std@0.159.0/http/file_server.ts
# add ~/.deno/bin to your PATH
file_server -v ./wasm
```

(open http://localhost:4507)
