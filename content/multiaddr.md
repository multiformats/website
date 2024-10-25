+++
base_url = "../"
title = "Multiaddr"
multiformat = "multiaddr"
stars = "multiformats/multiaddr"

layout = "abc"
type = "homea"

[_build]
  list = 'always'
  publishResources = true
  render = 'always'
+++

⚠️️ _(Note: this page is a work in progress; [please improve it here](https://github.com/multiformats/website/blob/master/content/multiaddr.md))_ ⚠️️

> ## Self-describing network addresses

Multiaddr is a format for encoding addresses from various well-established network protocols. It is useful to write applications that future-proof their use of addresses, and allow multiple transport protocols and addresses to coexist.


## Network Protocol Ossification

The current network addressing scheme on the internet **is not self-describing**. Traditional addresses leave much ambiguity. For example, it's not always clear which transport protocol (TCP, UDP, or others) is being used. This ambiguity forces developers to write application-specific code that assumes a certain protocol, which causes "ossification"—rigid code that cannot easily adapt to future network protocols.

### Problematic Examples:

Consider the following traditional addresses:

```
127.0.0.1:9090   # IPv4. Is this TCP, UDP, or something else?
[::1]:3217       # IPv6. Is this TCP, UDP, or something else?

http://127.0.0.1/baz.jpg  # Defaults to TCP port 80, but what if we wanted to use QUIC?
http://foo.com/bar/baz.jpg  # Uses DNS resolution but defaults to TCP on port 80.
//foo.com:1234  # Ambiguous—what protocol does this address use after DNS resolution?
```

In these cases:
- `127.0.0.1:9090` could refer to either TCP or UDP, forcing developers to make assumptions.
- DNS-based addresses (`http://foo.com/bar/baz.jpg`) default to TCP, but there’s no flexibility for newer protocols like QUIC without making breaking changes to the application.

### The Solution: Fully Qualified Addresses with Multiaddr

Multiaddr solves this by providing **self-describing addresses**. Each part of the address specifies both the protocol and the network address, making it clear how to interact with the resource. This approach future-proofs applications, allowing them to adapt to new transport protocols.

#### Fully Qualified Examples with Multiaddr:

```
/ip4/127.0.0.1/udp/9090/quic       # IPv4 address using UDP on port 9090, with QUIC
/ip6/::1/tcp/3217                  # IPv6 address using TCP on port 3217
/ip4/127.0.0.1/tcp/80/http/baz.jpg # IPv4 address using TCP on port 80, accessing an HTTP resource
/dns4/foo.com/tcp/80/http/bar/baz.jpg # DNS resolution (IPv4) using TCP on port 80, accessing an HTTP resource
/dns6/foo.com/tcp/443/https        # DNS resolution (IPv6) using TCP on port 443 for HTTPS
```

In these examples:
- `/ip4/127.0.0.1/udp/9090/quic` specifies the use of UDP and QUIC, removing ambiguity.
- `/dns4/foo.com/tcp/80/http/bar/baz.jpg` clearly indicates that the address resolves to IPv4 via DNS and uses TCP to access an HTTP resource.

By explicitly stating the protocol and transport, Multiaddr eliminates the assumptions that lead to network protocol ossification.

---



## Multiaddr Format

A multiaddr value is a _recursive_ `(TLV)+` (type-length-value repeating) encoding. It has two forms:

- a _human-readable version_ to be used when printing to the user (UTF-8)
- a _binary-packed version_ to be used in storage, transmissions on the wire, and as a primitive in other formats.

### The human-readable version:

- path notation nests protocols and addresses, for example: `/ip4/127.0.0.1/udp/4023/quic` (this is the repeating part).
  - a protocol MAY be only a code, or also have an address value (nested under a `/`) (eg. `/quic` and `/ip4/127.0.0.1`)
- the _type_ <code class="c-0">\<addr-protocol-str-code></code> is a string code identifying the network protocol. The table of protocols is configurable. The default table is the [multicodec](https://github.com/multiformats/multicodec) table.
- the _value_ <code class="c-1">\<addr-value></code> is the network address value, in natural string form.

Human-readable encoding (psuedo regex)

{{% multiformat
  syntax="(/<addr-protocol-str-code> /<addr-value>) +"
  labels="protocol code as a string|the address itself (human readable)|the pattern repeats, protocols encapsulate other protocols"
  example="/ip4/127.0.0.1/tcp/4000"
  %}}


### The binary-packed version:

- the _type_ <code class="c-0">\<addr-protocol-code></code> is a variable integer identifying the network protocol. The table of protocols is configurable. The default table is the [multicodec](https://github.com/multiformats/multicodec) table.
- the _length_ is an [unsigned variable integer](https://github.com/multiformats/unsigned-varint) counting the length of the address value, in bytes.
  - **The _length_ is omitted by protocols who have an exact address value size, or no address value.**
- the _value_ <code class="c-1">\<addr-value></code> is the network address value, of length `L`.
  - **The _value_ is omitted by protocols who have no address value.**

Binary-packed encoding (psuedo regex)

{{% multiformat
  syntax="(<addr-protocol-code> <addr-value>) +"
  labels="protocol code as a varint|the address value itself (binary)|the pattern repeats, protocols encapsulate other protocols"
  example="047f000001060fa0"
  %}}


## Implementations

These implementations are available:

- [js-multiaddr](https://github.com/multiformats/js-multiaddr) - stable
- [go-multiaddr](https://github.com/multiformats/go-multiaddr) - stable
- [java-multiaddr](https://github.com/multiformats/java-multiaddr) - stable
- [hs-multiaddr](https://github.com/basile-henry/hs-multiaddr) - draft
- [py-multiaddr](https://github.com/sbuss/py-multiaddr) - alpha
- [rust-multiaddr](https://github.com/multiformats/rust-multiaddr) - draft
- [cs-multiaddress](https://github.com/tabrath/cs-multiaddress) - alpha
- [erlang-multiaddr](https://github.com/helium/erlang-multiaddr) - alpha
- [net-ipfs-core](https://github.com/richardschneider/net-ipfs-core) - stable
- [swift-multiaddr](https://github.com/lukereichold/swift-multiaddr) - stable
- [(add yours here)](https://github.com/multiformats/website/blob/master/content/multiaddr.md)

## Examples

- **javascript**  
```javascript
import { multiaddr } from '@multiformats/multiaddr'

// Example 1: Simple IPv4 and UDP
const addr1 = multiaddr("/ip4/127.0.0.1/udp/1234")
// Multiaddr(/ip4/127.0.0.1/udp/1234)

console.log(addr1.bytes)
// <Uint8Array 04 7f 00 00 01 11 04 d2>

console.log(addr1.toString())
// '/ip4/127.0.0.1/udp/1234'

console.log(addr1.protos())
// [
//   {code: 4, name: 'ip4', size: 32},
//   {code: 273, name: 'udp', size: 16}
// ]

console.log(addr1.nodeAddress())
// {
//   family: 4,
//   port: 1234,
//   address: "127.0.0.1"
// }

console.log(addr1.encapsulate('/sctp/5678').toString())
// '/ip4/127.0.0.1/udp/1234/sctp/5678'


// Example 2: IPv6 and TCP
const addr2 = multiaddr("/ip6/::1/tcp/8080")
// Multiaddr(/ip6/::1/tcp/8080)

console.log(addr2.bytes)
// <Uint8Array 29 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 1f 90>

console.log(addr2.toString())
// '/ip6/::1/tcp/8080'

console.log(addr2.protos())
// [
//   {code: 41, name: 'ip6', size: 128},
//   {code: 6, name: 'tcp', size: 16}
// ]

console.log(addr2.nodeAddress())
// {
//   family: 6,
//   port: 8080,
//   address: "::1"
// }


// Example 3: DNS and HTTPS
const addr3 = multiaddr("/dns4/example.com/tcp/443/https")
// Multiaddr(/dns4/example.com/tcp/443/https)

console.log(addr3.toString())
// '/dns4/example.com/tcp/443/https'

console.log(addr3.encapsulate('/p2p-circuit').toString())
// '/dns4/example.com/tcp/443/https/p2p-circuit'
```


- **go**  
```go
import ma "github.com/multiformats/go-multiaddr"

// construct from a string (err signals parse failure)
m1, err := ma.NewMultiaddr("/ip4/127.0.0.1/udp/1234")

// construct from bytes (err signals parse failure)
m2, err := ma.NewMultiaddrBytes(m1.Bytes())

// true
strings.Equal(m1.String(), "/ip4/127.0.0.1/udp/1234")
strings.Equal(m1.String(), m2.String())
bytes.Equal(m1.Bytes(), m2.Bytes())
m1.Equal(m2)
m2.Equal(m1)
```


## F.A.Q.

1. **Why use Multiaddr instead of traditional addressing?**  
Multiaddr is designed to be future-proof, allowing easy adaptation to new protocols and network designs without breaking legacy applications. It removes ambiguity about what transport protocol or address family is being used.

2. **How does Multiaddr handle new protocols?**  
The format is extensible. New protocols are simply added to the multicodec table. This allows Multiaddr to support emerging protocols without requiring changes to the core format.

3. **What is the advantage of the binary-packed format?**  
The binary format is more compact and efficient for storage and transmission, especially useful in low-bandwidth or resource-constrained environments.


## About

### Specification

We will be submitting an RFC to the IETF. It will be worked on [at the multiaddr repo](https://github.com/multiformats/multiaddr).

### Credits

The Multiaddr format was invented by [@jbenet](https://github.com/jbenet), and refined by the [IPFS Team](https://github.com/ipfs). It is now maintained by the Multiformats community. The Multiaddr implementations are written by a variety of authors, whose hard work has made future-proofing and upgrading hash functions much easier. Thank you!

### Open Source

The Multiaddr format (this documentation and the specification) is Open Source software, licensed under the MIT License and patent-free. The multiaddr implementations listed here are also Open Source software. Please contribute to make them great! Your bug reports, new features, and documentation improvements will benefit everyone.

### Part of the Multiformats Project

Multiaddr is part of [the Multiformats Project](../), a collection of protocols which aim to future-proof systems, today. [Check out the other multiformats](../#multiformat-protocols). It is also maintained and sponsored by [Protocol Labs](http://ipn.io).

<div class="about-logos">
<a href="../" class="no-decoration">
  <img alt="Multiformats Logo" id="logo" src="../logo.svg" width="60" style="vertical-align: middle;" />Multiformats
</a>
<a href="http://ipn.io" class="no-decoration">
  <img src="../protocol-labs-logo.png" height="64px" />
</a>
</div>
