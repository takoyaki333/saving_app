// esbuild.config.js
require("esbuild").build({
  entryPoints: ["app/javascript/application.js"],
  bundle: true,
  outdir: "app/assets/builds",
  resolveExtensions: [".js", ".jsx", ".ts", ".tsx", ".css", ".scss"],
}).catch(() => process.exit(1));