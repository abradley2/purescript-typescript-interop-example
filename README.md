# Call PureScript from TypeScript

* It is important that the `package.json` specify `type: module`
* It is important that the `tsconfig.json` have all the example fields here. You can remove `noImplicitAny: false` if you generate type definitions for the PureScript files
* This uses `ts-node` to run. There is no pre-build process for the TypeScript files. The PureScript code only needs to go through `spago build`. No webpack.
* To run `npm install && spago build && ts-node --esm app.ts`
* `curl localhost:8080` to see the output

This shows how PureScript can be called from TypeScript but not vice-versa.

Use `d.ts` files to annotate the PureScript output code with types.