# Releases

The following releases have been made publicly available. For each of them, a link to the GitHub release page, containing links to the artifacts, 
and a link to the javadoc documentation are available.

#### Snapshots

The snapshot of the last commit of the `master` branch is always available on [GitHub Packages](https://github.com/orgs/lisa-analyzer/packages?repo_name=lisa) (you can find the updated milestone [here](https://github.com/lisa-analyzer/lisa/releases/tag/latest)). To use it, the dependency manager has to be set to use `https://maven.pkg.github.com/lisa-analyzer/lisa` as url for resolution, and credentials (username and personal accesso token with read permission to GitHub Packages) should be provided. You can refer to the official GitHub [Maven](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-apache-maven-registry#authenticating-to-github-packages) or [Gradle](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-gradle-registry#authenticating-to-github-packages) for more information.

## Beta releases

### 0.1b4

Key changes: customizable open call handling, removal of enums (resolution strategy and symbolic operators) to increase modularity, removal of native calls, order of evaluation of expressions. More information in the GitHub [release](https://github.com/lisa-analyzer/lisa/releases/tag/v0.1b4).

Javadoc: [sdk](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa-sdk/0.1b4/index.html) - [core](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa-core/0.1b4/index.html) - [imp](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa-imp/0.1b4/index.html)

### 0.1b3

Key changes: additions of missing accessors and constructors, exposing call resolution information to semantic checks. More information in the GitHub [release](https://github.com/lisa-analyzer/lisa/releases/tag/v0.1.1).

Javadoc: [sdk](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa-sdk/0.1.1/index.html) - [core](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa-core/0.1.1/index.html) - [imp](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa-imp/0.1.1/index.html)

### 0.1b2

Key changes: project splitting, default statements and types, more symbolic operators. More information in the GitHub [release](https://github.com/lisa-analyzer/lisa/releases/tag/v0.1b2).

Javadoc: [sdk](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa-sdk/0.1b2/index.html) - [core](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa-core/0.1b2/index.html) - [imp](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa-imp/0.1b2/index.html)

### 0.1b1

Key changes: interprocedural analysis, annotations. More information in the GitHub [release](https://github.com/lisa-analyzer/lisa/releases/tag/v0.1b1).

Javadoc [here](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa/0.1b1/index.html).

## Alpha releases

### 0.1a4

Key changes: heap domains. More information in the GitHub [release](https://github.com/lisa-analyzer/lisa/releases/tag/v0.1a4).

Javadoc [here](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa/0.1a4/index.html).

### 0.1a3

Key changes: inference systems, dataflow interface, and preliminary program structure. More information in the GitHub [release](https://github.com/lisa-analyzer/lisa/releases/tag/v0.1a3).

Javadoc [here](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa/0.1a3/index.html).

### 0.1a2

Key changes: complete prototype of the structure of the library, including the definition of call graphs and heap abstractions, type hierarchy, and type inference. More information in the GitHub [release](https://github.com/lisa-analyzer/lisa/releases/tag/v0.1a2).

Javadoc [here](https://www.javadoc.io/doc/io.github.lisa-analyzer/lisa/0.1a2/index.html).

### 0.1a1

First draft of the structure of the library. More information in the GitHub [release](https://github.com/lisa-analyzer/lisa/releases/tag/v0.1a1).
