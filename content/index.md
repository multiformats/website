+++
base_url = "/"
title = "Multiformats"
stars = "multiformats/multiformats"
+++
> ## Self-describing values for future-proofing

Every choice in computing has a tradeoff. This includes formats, algorithms, encodings, and so on. And even with a great deal of planning, decisions may lead to breaking changes down the road, or to solutions which are no longer optimal. Allowing systems to evolve and grow is important.

- [What are Multiformats?](#what-are-multiformats)
- [Why organizations choose Multiformats](#why-organizations-choose-multiformats)
- [Multiformat protocols](#multiformat-protocols)
- [A growing protocol registry](#a-growing-protocol-registry)
- [Projects using Multiformats](#projects-using-multiformats)
- [Contribute & Community](#contribute--community)

## What are Multiformats?

The Multiformats Project is a collection of protocols which aim to future-proof systems, today. They do this mainly by enhancing format values with self-description. This allows interoperability, protocol agility, and helps us avoid lock in.

The self-describing aspects of the protocols have a few stipulations:

- They MUST be _in-band_ (with the value); not _out-of-band_ (in context).
- They MUST avoid _lock-in_ and promote _extensibility_.
- They MUST be compact and have a _binary-packed_ representation.
- They MUST have a _human-readable_ representation.

## Why organizations choose Multiformats

<div class="card-grid outcome-grid">
	<div class="outcome-card">
		<h3>Extensible forever</h3>
		<p>No central redesign when new formats appear.</p>
	</div>
	<div class="outcome-card">
		<h3>Self-describing</h3>
		<p>Identifiers explain themselves.</p>
	</div>
	<div class="outcome-card">
		<h3>Language independent</h3>
		<p>One shared registry across Go, Rust, JavaScript, Python, Java, Swift, Kotlin, and more.</p>
	</div>
	<div class="outcome-card">
		<h3>Interoperable</h3>
		<p>Organizations extend one ecosystem rather than creating incompatible formats.</p>
	</div>
</div>


## Multiformat protocols

The Multiformats Project describes a series of protocols. Currently, the following protocols exist:

- [multiaddr](./multiaddr)  <small>(WIP)</small> - self-describing <span class="mfc mfc-multiaddr">network addresses</span>
- [multibase](https://github.com/multiformats/multibase)  <small>(WIP)</small> - self-describing <span class="mfc mfc-multibase">base encodings</span>
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

Several of the multiformats have stable specs and stable implementations. We are working on the others. We prioritize their usage as soon as possible, as what they offer -- protocol interoperability and future-proofing -- has real-world consequences today.

Towards that end, we are encouraging improvements to WIP protocols, and implementations of all. Please contribute to the projects on GitHub.


### A note on the word Multiformats

Multiformats is the name for the organization, but it can also be used to refer to protocols; for instance, in the sentence "Use one of the multiformats". Formats is interchangeable with protocols, here. We try to capitalize Multiformats when it refers to the organization, on GitHub.

## A growing protocol registry

<div class="registry-callout">
	<p><a href="https://github.com/multiformats/multicodec">Multicodec</a> is a shared registry for describing content types, hash functions, keys, signatures, namespaces, transports, and experimental formats. New systems can add a code once, then use it everywhere Multiformats are understood.</p>
	<div class="metric-grid">
		<div class="metric-card"><strong>460+</strong><span>registered multicodecs</span></div>
		<div class="metric-card"><strong>80+</strong><span>organizations</span></div>
		<div class="metric-card"><strong>30+</strong><span>languages</span></div>
		<div class="metric-card"><strong>100+</strong><span>implementations</span></div>
		<div class="metric-card wide"><strong>Thousands</strong><span>of downstream repositories</span></div>
	</div>
	<p class="registry-cta"><a class="cta-button" href="https://github.com/multiformats/multicodec/blob/master/table.csv">Register your multicodec</a> <span>Submit a pull request to reserve a code in the public registry.</span></p>
</div>

## Projects using Multiformats

The Multiformats project began through [the IPFS Project](https://ipfs.io). It now supports a wider ecosystem of storage, networking, identity, cryptography, AI, and research projects. Examples below are direct Multiformats users or protocols represented in the public Multicodec registry.

<table class="ecosystem-table">
	<thead>
		<tr>
			<th>Ecosystem</th>
			<th>Examples</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>Storage</th>
			<td><a href="https://ipfs.tech">IPFS</a>, <a href="https://filecoin.io">Filecoin</a>, <a href="https://ceramic.network">Ceramic</a>, <a href="https://arweave.org">Arweave</a>, <a href="https://ipld.io">IPLD</a>, and <a href="https://github.com/ipfs/specs/tree/main/unixfs">UnixFS</a>.</td>
		</tr>
		<tr>
			<th>Networking</th>
			<td><a href="https://libp2p.io">libp2p</a> multiaddrs and peer IDs, <a href="https://ethereum.org">Ethereum</a> block/transaction codecs and signature identifiers, and <a href="https://bitcoin.org">Bitcoin</a> block, transaction, and witness commitment codecs.</td>
		</tr>
		<tr>
			<th>Identity</th>
			<td><a href="https://ens.domains">ENS</a> contenthash records, <a href="https://w3c-ccg.github.io/did-key-spec/">did:key</a>, <a href="https://www.w3.org/TR/controller-document/#multikey">Multibase/MultiKey identifiers</a>, and <a href="https://github.com/ChainAgnostic/multidid">Multidid</a>.</td>
		</tr>
		<tr>
			<th>Cryptography</th>
			<td>Hash function implementers and key registrants including <a href="https://github.com/BLAKE3-team/BLAKE3">BLAKE3</a>, SHA-2, SHA-3, SHAKE, Keccak, BLAKE2, KangarooTwelve, Poseidon, Skein, Murmur3, XXH, Ed25519, secp256k1, BLS12-381, ML-KEM, ML-DSA, and SLH-DSA families.</td>
		</tr>
		<tr>
			<th>AI</th>
			<td><a href="https://github.com/endomorphosis/ipfs_datasets_py">IPFS Datasets</a>, <a href="https://github.com/endomorphosis/ipfs_kit_py">IPFS Kit</a>, and <a href="https://github.com/p-vbordei/agent-cid">agent-cid</a> use CIDs and Multiformats for datasets, vector stores, model distribution, and agent artifacts. Vector formats such as FAISS, HNSW, and Lance, plus model serialization formats such as SafeTensors, GGUF, and ONNX, are natural candidates when they need self-describing registry codes.</td>
		</tr>
		<tr>
			<th>Research</th>
			<td>Experimental and emerging codecs including <a href="https://www.w3.org/TR/rdf-canon/">RDFC-1</a>, JSON-JCS, SSZ, ISCC, Holochain addresses, Shelter protocol artifacts, Massa namespaces, Subspace namespaces, Skynet namespaces, and SCION multiaddrs.</td>
		</tr>
	</tbody>
</table>

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
		<small><a href="https://github.com/multiformats/multicodec/blob/master/table.csv">Register your multicodec</a> or <a href="https://github.com/multiformats/website/blob/master/content/index.md">add your project here</a>.</small>
	</li>
</ul>

## Contribute & Community

<a href="/">The Multiformats Project</a> is an Open Source software project. It is built by a large community of contributors. Please join us on GitHub or Matrix to request features, file bugs, contribute code, improve documentation, and ask questions. We have a very open and welcoming community.

- [GitHub Project](https://github.com/multiformats/multiformats)
- [Website Repository](https://github.com/multiformats/website)
- [Matrix chatroom](https://matrix.to/#/#multiformats:ipfs.io) (`#multiformats:ipfs.io`)
- [Code of Conduct](https://github.com/ipfs/community/blob/master/code-of-conduct.md)
- [Contributing Guide](https://github.com/multiformats/multiformats/blob/master/contributing.md)
