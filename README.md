<h1 align="center">Formal Verification of Capella Fork with Dafny</h1>

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 
[![made-for-VSCode](https://img.shields.io/badge/Made%20for-VSCode-1f425f.svg)](https://code.visualstudio.com/)
[![Checks](https://img.shields.io/badge/DafnyVerify-Verified-darkgreen.svg)](https://shields.io/) 
  

# Overview 

This project was built upon the [eth2.0-dafny](https://github.com/ConsenSys/eth2.0-dafny) (ConsenSys R&D). Added Beacon Chain part in Capella Fork specifications.

## Objectives

The objective of this project is to contribute a new **formal specification** of the Eth2.0 specification, specifically for the [Capella Fork](https://github.com/ethereum/consensus-specs/blob/dev/specs/capella/beacon-chain.md), in the verification-aware programming language [Dafny](https://github.com/dafny-lang/dafny/wiki).

### Goals

- [x] Write an **implementation** for each new function to demonstrate that the specification _can be implemented_, in other words, it is not inconsistent.

- [x] Add a **formal (non-ambiguous and functional) specification** of the Capella Fork.
This specification is also written with pre/post-conditions using the [Hoare logic](https://en.wikipedia.org/wiki/Hoare_logic) style proof.

- [x] **Formally prove** that the implementation satisfies the specification.


## Get started
### Requirements (For Linux)
- Install .NET 6.0 as described above
- Install python3: e.g., sudo apt install python3 python3-pip
- If you intend to compile to PHP..., install PHP. (By parity of reasoning)

### Installation
- install Dafny, see [Dafny tutorial(Linux Version)](https://github.com/dafny-lang/dafny/wiki/INSTALL#linux-source).
- clone or fork this repository.


## How to check the proofs?

I have checked the proofs with Dafny **3.2.0** under Ubuntu 20.04 env.

Assuming you have a running Dafny compiler, you may use the following command line at the root of the repository to check a `*.dfy` file:
```
> dafny /compile:3 /out:bin/Helpers.cap src/dafny/beacon/Helpers.cap.dfy
Dafny 3.2.0.30713

Dafny program verifier finished with 3 verified, 0 errors
Wrote textual form of target program to Helpers.cs
Compiled assembly into Helpers.dll
Program compiled successfully
```

> For an even  better experience, you may install VSCode and the Dafny plugin [here](https://marketplace.visualstudio.com/items?itemName=dafny-lang.ide-vscode), the latest adaptable plugin version is **2.3.0**.

## Beyond reproducing

Depending on your inclination you may use the verified code in different ways:

* you may **contribute new code and proofs** by either adding functions that have not been implemented yet or even testing that new ideas and optimisations do not break the proofs;

* you may use Dafny to **generate target code** (e.g. Go, Java, C#, JavaScript, PHP) and see how the automated generated code can replace or complement your code base;

* you may use the specifications to help in **unit testing** your own code. The specifications contain **unambiguous pre and post-conditions** that clearly specify the effect of a function/method.  They can be used to write property-drive tests.


## How to play with counterexamples if you find new errors?

```
$ git clone https://github.com/ethereum/consensus-specs.git
$ cd <consensus-root>
$ python3 -m venv .          # create a virtual env
$ source bin/activate        # activate the virtual env
$ make install_test          # install the necessary packages
$ python setup.py pyspecdev
```
Then, the executable Python code of spec will be generated. You can test it by simply running the following command:

` python <your_test_file.py> `

> There is an example testing file under `eth2.0-dafny/test/` called **exec_spec_test.py**; put it under `consensus-specs/tests/core/pyspec`, then run it.

# My Contributions:
- scripts/call_graph.py **_[modified]_**
- scripts/countLines.py **_[modified]_**
- src/dafny/beacon/BeaconChainTypes.dfy **_[modified]_**
- src/dafny/beacon/Helpers.cap.dfy **_[new]_**
- src/dafny/beacon/Helpers.dfy **_[modified]_**
- src/dafny/beacon/statetransition/EpochProcessing.dfy **_[modified]_**
- src/dafny/beacon/statetransition/EpochProcessing.s.dfy **_[modified]_**
- src/dafny/beacon/statetransition/StateTransition.dfy **_[modified]_**
- src/dafny/beacon/statetransition/stateTransition.cap.dfy **_[new]_**
- src/dafny/beacon/validators/Validators.dfy **_[modified]_**
- src/dafny/ssz/Constants.dfy **_[modified]_**
- src/dafny/utils/Eth2Types.dfy **_[modified]_**
- test/dafny/merkle/third_party_implementations/PySszBitlistMerkleisation.py **_[modified]_**

# How to complie to other languages
> For example, compile to PHP

`dafny /compileTarget:php /spillTargetCode:1 <YOUR_FILE.dfy>`

For other languages, replace the parameter of `/compileTarget`.
For more information, click [here](https://dafny.org/latest/toc)





