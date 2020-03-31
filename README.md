
# eth2.0-dafny

The objective of this project is to write a **formal specification** of the Eth2.0 specification in the verification-aware programming language **Dafny**.

* [Eth resources](wiki/eth2-specs.md)

* [Dafny resources](wiki/dafny.md)

* [Other resources](wiki/other-resources.md)

# Background & Context

The Eth2 specifications are rather complex.
As a consequence bugs or glitches or inconsistencies can remain uncovered ... until then manifest, resulting in crashes, which in turn can exploited as security vulnerabilities.
An example of critical vulnerability is the OutOfBounds exception where a non-existent index in an array is accessed. This is one of the most common _zero day_ attacks.

Testing and code peer reviews can help keeping the bug count low.
However, testing can find some bugs but in general cannot _guarantee the absence of bugs_.

The paper [An Executable K Model of Ethereum 2.0 Beacon Chain Phase 0 Specification](https://github.com/runtimeverification/beacon-chain-spec/blob/master/report/bck-report.pdf) describes how the K-framework can be used to:

* provide a formal semantics to Eth2.0 spec (phase 0)
* derive an executabkle model from it
* provide some insight into test coverage (using the current test suites).

This is a very nice work in terms of formalising the Eth2.0 specs.
However, the current state of the K-framework is limited to testing, and as mentioned before "testing can find bugs but cannot prove the absence of bugs."

Second, the audit performed in ... is based on manual code review and focusses on potential attacks.
More recent audits have been performed including ...leastAuthority

To complement these audits, we would like to provide some guarantees that the Eth2.0 specifications are bug-free.

# Objective

Our objectives in this project are many-fold:

1. to write a formal (non-ambiguous) specification of the Eth2 specification.
This is written in terms of pre/post-conditions using the Hoare style proof.
2. to write an implementation for each function to demonstrate that the specification _can be implemented_, in other words, it is not inconsistent.
3. to formally prove (by establishing lemmas that can be automatically verified) that our implementation satisfies the specification.

To do so, we use the verification-aware programming language Dafny to write the specification, the implementation, and the proofs.
Dafny provides extensive support for automated reasoning leveraging the power of state-of-start SMT-solvers.

# Expected results

We are gradually adding specifications, implementations and proofs.
Our current focus in on Phase 0 of the Eth2 specifications: SSZ, Merkleisation and Beacon chain.  

# How to install (and check the proofs)

* install dafny (link)
* Pull/clone repo
* video with how to see verified or bugs.