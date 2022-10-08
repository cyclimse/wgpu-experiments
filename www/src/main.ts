import init, { run } from "../pkg/renderer.js";

init().finally(() => {
  console.log("WASM Loaded");
  run();
});