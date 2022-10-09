import init from "../pkg/renderer.js";

init().finally(() => {
  console.log("WASM Loaded");
});