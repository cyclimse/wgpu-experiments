# WGPU experiments

Some experiments with wpgu and wasm. Built with nix.

A lot of this material is taken directly from [learn-wgpu](https://sotrh.github.io/learn-wgpu/).

## Requirements

This project requires nix with [flakes](https://nixos.wiki/wiki/Flakes) enabled.

## Development

### Locally

```bash
nix develop
cargo run
```

### Web

```bash
nix develop
cargo watch -i .gitignore -i "www/*" -s "wasm-pack build renderer/ --out-dir ../www/pkg --target web"
```

In another terminal, run the development server:

```bash
cd www; npm run dev
```
