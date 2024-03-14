
<!-- [![Build Status](https://circleci.com/gh/ConsenSys/eth2.0-dafny.svg?style=shield)](https://circleci.com/gh/ConsenSys/workflows/eth2.0-dafny)  -->
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 
[![made-for-VSCode](https://img.shields.io/badge/Made%20for-VSCode-1f425f.svg)](https://code.visualstudio.com/)
[![Checks](https://img.shields.io/badge/DafnyVerify-Verified-darkgreen.svg)](https://shields.io/) 

 <!-- ![GitHub commit activity](https://img.shields.io/github/commit-activity/w/PegaSysEng/eth2.0-dafny?style=flat) -->

# Overview 

This project was built upon the [eth2.0-dafny](https://github.com/ConsenSys/eth2.0-dafny) (ConsenSys R&D). Added Beacon Chain part in Capella Fork specifications.

## Objectives

The objective of this project is to contribute a new **formal specification** of the Eth2.0 specification, specifically, for the [Capella Fork](https://github.com/ethereum/consensus-specs/blob/dev/specs/capella/beacon-chain.md), in the verification-aware programming language [Dafny](https://github.com/dafny-lang/dafny/wiki).

### Goals

- [x] Write an **implementation** for each new function to demonstrate that the specification _can be implemented_, in other words, it is not inconsistent.

- [x] Add a **formal (non-ambiguous and functional) specification** of the Capella Fork.
This specification is also written with pre/post-conditions using the [Hoare logic](https://en.wikipedia.org/wiki/Hoare_logic) style proof.

- [x] **Formally prove** that the implementation satisfies the specification. The formal proof is provided in the form of mathematical proofs of lemmas written in Dafny.

## How to use the verified code?

Depending on your inclination you may use the verified code in different ways:

* you can find **function specifications**  (usually in ``.s.dfy`` files). They describe state changes as functions mapping a state (and other parameters like blocks) to a new state;
These specifications can help to write your own client in your preferred language (including functional programming languages); we have provided an example of implementation for each function, adapted from the [Eth2.0 reference spec](https://github.com/ethereum/eth2.0-specs).

* you may **contribute new code and proofs** by either adding functions we have not implemented yet or even test that new ideas and optimisations do not break the proofs;

* you may use Dafny to **generate target code** (e.g. Go, Java, C#, JavaScript) and see how the automated generated code can replace or complement your code base;

* you may use the specifications to help in **unit testing** your own code. The specifications contain **unambiguous pre and post conditions** that clearly specify the effect of a function/method.  They can be used to write property-drive tests.


# How to check the proofs?

We have checked the proofs with Dafny 3.0.0 and Dafny 3.2.0.

The bash scripts ``verifyAll.sh`` can be used to verify the files in a given directory (e.g. using the Docker container, see below).

For example checking the ``attestations`` package can be done by:

```[bash]
/home/user1/eth2.0-dafny $ time ./verifyAll.sh src/dafny/beacon/attestations   -------------------------------------------------------
Processing src/dafny/beacon/attestations/AttestationsHelpers.dfy with config /dafnyVerify:1 /compile:0  /noCheating:1
/home/user1/eth2.0-dafny/src/dafny/beacon/attestations/../../utils/SetHelpers.dfy(38,17): Warning: /!\ No terms found to trigger on.
/home/user1/eth2.0-dafny/src/dafny/beacon/attestations/../../utils/SetHelpers.dfy(60,22): Warning: /!\ No terms found to trigger on.
/home/user1/eth2.0-dafny/src/dafny/beacon/attestations/../gasper/GasperEBBs.dfy(91,16): Warning: /!\ No terms found to trigger on.
/home/user1/eth2.0-dafny/src/dafny/beacon/attestations/../gasper/GasperEBBs.dfy(159,16): Warning: /!\ No terms found to trigger on.

Dafny program verifier finished with 24 verified, 0 errors
No errors in src/dafny/beacon/attestations/AttestationsHelpers.dfy
-------------------------------------------------------
Processing src/dafny/beacon/attestations/AttestationsTypes.dfy with config /dafnyVerify:1 /compile:0  /noCheating:1
/home/user1/eth2.0-dafny/src/dafny/beacon/attestations/../../utils/SetHelpers.dfy(38,17): Warning: /!\ No terms found to trigger on.
/home/user1/eth2.0-dafny/src/dafny/beacon/attestations/../../utils/SetHelpers.dfy(60,22): Warning: /!\ No terms found to trigger on.

Dafny program verifier finished with 12 verified, 0 errors
No errors in src/dafny/beacon/attestations/AttestationsTypes.dfy
-------------------------------------------------------
[OK] src/dafny/beacon/attestations/AttestationsHelpers.dfy
[OK] src/dafny/beacon/attestations/AttestationsTypes.dfy
Summary: 2 files processed - No errors occured! Great job.
./verifyAll.sh src/dafny/beacon/attestations  29.27s user 0.54s system 102% cpu 29.138 total
```

## Install Dafny on your computer

Pre-requisites:

* install Dafny, see [Dafny wiki](wiki/dafny.md).
* clone or fork this repository.

Assuming you have a running Dafny compiler, you may use the following command line to check a `*.dfy` file:
```
> dafny /dafnyVerify:1 /compile:0  /timeLimit:60 src/dafny/utils/MathHelpers.dfy
Dafny 2.3.0.10506

Dafny program verifier finished with 13 verified, 0 errors
```

The [test folder](https://github.com/PegaSysEng/eth2.0-dafny/tree/master/test/dafny) contains some tests.
The purpose of this directory is to demonstrate that we can extract an implementation and run it (indeed, once we have proved the code, there is no need to test it).
To run the tests, you can issue the following command from the root directory (it collects all the files in the test folder, compile them and run them):

```
> ./scripts/runAllTests.sh
```

 For an even  better experience you may install VSCode and the Dafny plugin see [our Dafny wiki](https://github.com/PegaSysEng/eth2.0-dafny/wiki/Eth2.0-verification-in-Dafny).

## How to test specification using counterexamples?

TODO
