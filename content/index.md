+++
base_url = "/"
title = "Multiformats"
stars = "multiformats/multiformats"
+++
> ## Self-describing values for Future-proofing

Every choice in computing has a tradeoff. This includes formats, algorithms, encodings, and so on. And even with a great deal of planning, decisions may lead to breaking changes down the road, or to solutions which are no longer optimal. Allowing systems to evolve and grow is important.

- [What are Multiformats?](#what-are-multiformats)
- [Multiformat protocols](#multiformat-protocols)
- [Projects using Multiformats](#projects-using-multiformats)
- [Contribute & Community](#contribute--community)

## What are Multiformats?

The Multiformats Project is a collection of protocols which aim to future-proof systems, today. They do this mainly by enhancing format values with self-description. This allows interoperability, protocol agility, and helps us avoid lock in.

The self-describing aspects of the protocols have a few stipulations:

- They MUST be _in-band_ (with the value); not _out-of-band_ (in context).
- They MUST avoid _lock-in_ and promote _extensibility_.
- They MUST be compact and have a _binary-packed_ representation.
- They MUST have a _human-readable_ representation.


## Multiformat protocols

The Multiformats Project describes a series of protocols. Currently, the following protocols exist:

- [multiaddr](./multiaddr) - self-describing <span class="mfc mfc-multiaddr">network addresses</span>
- [multibase](https://github.com/multiformats/multibase) - self-describing <span class="mfc mfc-multibase">base encodings</span>
- [multicodec](https://github.com/multiformats/multicodec) - self-describing <span class="mfc mfc-multicodec">serialization</span>
- [multihash](./multihash) - self-describing <span class="mfc mfc-multihash">hashes</span>

<!--
- [multikey](https://github.com/ipfs/specs/issues/58) <small>(WIP)</small> - self-describing <span class="mfc mfc-multikey">keys and proofs</span>
 -->

Each of the projects has its list of implementations in various languages.

Also, some protocols are deprecated or frozen:

- [multigram](https://github.com/multiformats/multigram) <small>(FROZEN)</small> - self-describing <span class="mfc mfc-multigram">packet network protocols</span>
- [multistream](https://github.com/multiformats/multistream) <small>(DEPRECATED)</small> - self-describing <span class="mfc mfc-multistream">stream network protocols</span>

### Project Status

Several of the multiformats have stable specs and stable implementations. We're are working on the others. We prioritize their usage as soon as possible, as what they offer -- protocol interoperability and future-proofing -- has real-world consequences today.

Towards that end, we are encouraging improvements to WIP protocols, and implementations of all. Please contribute to the projects on GitHub.


### A note on the word Multiformats

Multiformats is the name for the organization, but it can also be used to refer to protocols; for instance, in the sentence "Use one of the multiformats". Formats is interchangeable with protocols, here. We try to capitalize Multiformats when it refers to the organization, on GitHub.

## Projects using Multiformats

The Multiformats project began through [the IPFS Project](https://ipfs.io). It is used extensively in projects like

<ul class="project-list">
	<li>
		<a href="https://ipfs.tech">
		<img src="projects/ipfs.png" />IPFS</a>
		- an open system to manage data without a central server.
	</li>
	<li>
		<a href="https://github.com/multiformats/cid">CIDs</a>
		- a self-describing content-addressed identifier scheme for distributed systems, used to address files in IPFS and systems interoperable with it, as well as in other systems like IPLD, where it is the primary way of expressing links between documents.
	</li>
	<li>
		<a href="https://github.com/libp2p/libp2p">
		<img src="projects/libp2p.png" />libp2p</a>
		- a modular network library for peer-to-peer protocols.
	</li>
	<li>
		<a href="https://github.com/ipld/ipld">
		<img height="64px" src="https://ipld.io/img/ipld-logo.png" />IPLD</a>
		- a set of standards and implementations for creating decentralized data-structures that are universally addressable and linkable.
	</li>
	<li>
		<small><a href="https://github.com/multiformats/website/blob/master/content/index.md">(add yours here)</a></small>
	</li>
</ul>

## Contribute & Community

<a href="/">The Multiformats Project</a> is an Open Source software project. It is built by a large community of contributors. Please join us on GitHub or Matrix to request features, file bugs, contribute code, improve documentation, and ask questions. We have a very open and welcoming community.

- [GitHub Project](https://github.com/multiformats/multiformats)
- [Website Repository](https://github.com/multiformats/website)
- [Matrix chatroom](https://matrix.to/#/#multiformats:ipfs.io) (`#multiformats:ipfs.io`)
- [Code of Conduct](https://github.com/ipfs/community/blob/master/code-of-conduct.md)
- [Contributing Guide](https://github.com/multiformats/multiformats/blob/master/contributing.md)