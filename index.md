---
notoc: true
---

# LiSA

LiSA (Library for Static Analysis) aims to ease the creation and implementation of static analyzers based on the Abstract Interpretation theory.
LiSA provides an analysis engine that works on a generic and extensible control flow graph representation of the program to analyze. Abstract interpreters in LiSA are built 
for analyzing such representation, providing a unique analysis infrastructure for all the analyzers that will rely on it.

Building an analyzer upon LiSA boils down to writing a parser for the language that one aims to analyze, translating the source code or the compiled code towards 
the control flow graph representation of LiSA. Then, simple checks iterating over the results provided by the semantic analyses of LiSA can be easily defined to translate 
semantic information into warnings that can be of value for the final user. 

## How to contrubute

LiSA is developed and maintained by the [Software and System Verification (SSV)](https://ssv.dais.unive.it/) group @ Università Ca' Foscari in Venice, Italy. External contributions are always welcome! Check out our [contributing guidelines](https://github.com/lisa-analyzer/lisa/blob/master/CONTRIBUTING.md) for information on how to contribute to LiSA.

## Contents

Head to [Getting started]({{ site.baseurl }}/getting-started/) for a list of guides and tutorials on how to work with LiSA.
[LiSA's Structure]({{ site.baseurl }}/structure/) contains a discussion on how LiSA's inputs, outputs and internal mechanics are structured.
[The IMP Language]({{ site.baseurl }}/imp/) is a small example-driven documentation of the object-oriented IMP language used for internal testing and POCs.
Visit [Releases]({{ site.baseurl }}/releases/) for a list of all LiSA's releases, from the first alpha to the latest release, and 
[Publications & Talks]({{ site.baseurl }}/publications-talks/) for a list of papers and presentations discussing LiSA.
