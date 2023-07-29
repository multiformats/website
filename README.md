# The Multiformats website

[![](https://img.shields.io/badge/made%20by-Protocol%20Labs-blue.svg?style=flat-square)](http://ipn.io)
[![](https://img.shields.io/badge/project-multiformats-blue.svg?style=flat-square)](https://github.com/multiformats/multiformats)
[![](https://img.shields.io/badge/freenode-%23ipfs-blue.svg?style=flat-square)](https://webchat.freenode.net/?channels=%23ipfs)
[![](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> Official website for Multiformats http://multiformats.io

This repository contains the source code for the Multiformats website available at http://multiformats.io

This project builds out a static site to explain Multiformats, ready for deployment on ipfs. It uses `hugo` to glue the html together. It provides an informative, public-facing website. The most important things are the words, concepts and links it presents.

## Install

```sh
git clone https://github.com/multiformats/website.git
```

## Usage

To deploy the site multiformats.io, run:

```sh
# Build out the optimised site to ./public, where you can check it locally.
make

```

The following commands are available:

### `make`

Build the optimised site to the `./public` dir

### `make serve`

Preview the production ready site at http://localhost:1313

### `make dev`

Start a hot-reloading dev server on http://localhost:1313

## Deploying the site

If you want to deploy the site to IPFS locally, you can run `ipfs add --cid-version 1 -r -q public  | tail -n1` add the website to your local IPFS instance and then access it at your local IPFS gateway URL, e.g. http://127.0.0.1:8080/ipfs/${CID}

The production site is deployed to https://multiformats.io using https://fleek.co/ when new changes are merged to the repo at https://github.com/multiformats/website.

---

See the `Makefile` for the full list or run `make help` in the project root. You can pass the env var `DEBUG=true` to increase the verbosity of your chosen command.

## Dependencies

* `Node.js` and `npm` for build tools

### Optional Dependencies

* `ipfs` to deploy changes to ipfs locally - optional

## Maintainers

[@victorbjelkholm](https://github.com/victorbjelkholm)

## Contribute

Please do! Check out the [issues](https://github.com/multiformats/website/issues), or open a PR!

Check out our [contributing document](https://github.com/multiformats/multiformats/blob/master/contributing.md) for more information on how we work, and about contributing in general. Please be aware that all interactions related to multiformats are subject to the IPFS [Code of Conduct](https://github.com/ipfs/community/blob/master/code-of-conduct.md).

Small note: If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

[MIT](LICENSE) © 2016 Protocol Labs Inc.