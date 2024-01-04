# Creating a project using LiSA

| <name>Goal:</name> using an official release of LiSA as a dependency of your project |
| <name>LiSA release used:</name> 0.1b4 |
| <name>Estimated time:</name> 5 minutes |
| <name>Requirements:</name> [JDK 11](https://www.oracle.com/it/java/technologies/javase/jdk11-archive-downloads.html), a build tool of your choice (the tutorial will use [Gradle](https://gradle.org/), but steps for other build tools are the same), optionally an IDE ([Eclipse](https://www.eclipse.org/downloads/) or [IntelliJ](https://www.jetbrains.com/idea/download/)) |
{:.tutorialheader}

----

Setting up a project that uses LiSA can be achieved with few simple steps, the first one being creating an empty Java project. The procedure depends on the build system or IDE you decide to use. For this tutorial, we will be using Gradle with no IDE.

### Creating the project

Navigate to the folder where you want to create the project and open a terminal there. To create the project, execute `gradle init` and follow the instructions on screen to create the project. Note that, if you don't have Gradle binaries on your PATH, you will have to add the full path to the Gradle executable at the beginning of the command. The output on your terminal should look like this:

```bash
$ gradle init

Select type of project to generate:
  1: basic
  2: application
  3: library
  4: Gradle plugin
Enter selection (default: basic) [1..4] 1

Select build script DSL:
  1: Groovy
  2: Kotlin
Enter selection (default: Groovy) [1..2] 1

Project name (default: test-app): test-app

> Task :init

BUILD SUCCESSFUL in 15s
2 actionable tasks: 2 executed
```

Note that the choices you make to create the project can be different from the ones reported in the example. If the creation is successfull, the contents on your folder should now be like this:

```bash
$ ls -lh
total 14K
-rw-r--r-- 1 NegriniL 1049089  204 Oct 15 17:01 build.gradle
drwxr-xr-x 1 NegriniL 1049089    0 Oct 15 17:01 gradle/
-rwxr-xr-x 1 NegriniL 1049089 5.7K Oct 15 17:01 gradlew*
-rw-r--r-- 1 NegriniL 1049089 2.7K Oct 15 17:01 gradlew.bat
-rw-r--r-- 1 NegriniL 1049089  365 Oct 15 17:01 settings.gradle
```

### Adding the LiSA dependency

The next step is to add a dependency from your project to LiSA. To to this, navigate to LiSA's [Maven page](https://search.maven.org/search?q=g:io.github.lisa-analyzer) and pick the version of `lisa-sdk` and `lisa-core` that you want to use. Opening the page of that release (i.e. clicking on the version number) opens a page with snippets that can be directly copied into the configuration file of the build system to add the dependency. While `lisa-sdk` is always needed (as it contains all the components definitions), `lisa-core` is required only if you want to execute an analysis or if you want to reference one of the components already implemented. However, since `lisa-core` directly depends on `lisa-sdk`, you can just depend on the latter to get both of them. 

Proceed by copying the snippet you need (`lisa-core` is the safest one as it gets you everything) and add it to your `build.gradle` inside the `dependencies` section, filling also the rest of the build file:

```groovy 
// this is the groovy syntax for gradle, kotlin is also available

plugins {
    // tell Gradle that this is a Java command line application
    id 'application'
}

repositories {
    // use the maven central server to resolve dependencies
    mavenCentral()
}

dependencies {
    // add a depenency to LiSA
    implementation 'io.github.lisa-analyzer:lisa-core:0.1b2'
}

application {
    // tell Gradle which class is contains the main method
    mainClass = 'test.app.App'
}
```

Note that the scope of the dependency can be customized according to your needs. See [here](https://docs.gradle.org/current/userguide/declaring_dependencies.html) for details on Gradle configuration, but similar documents exists also for other build systems.

### Test your setup

After adding the dependency, you are able to reference all classes defined in LiSA. You can test it by creating the Java file `src/main/java/test/app/App.java` with the following content:

```java
package test.app;

import it.unive.lisa.LiSAConfiguration;
import it.unive.lisa.util.numeric.IntInterval;

public class App {
    public static void main(String[] args) {
        // this class is defined inside lisa-sdk
        System.out.println(new IntInterval(5, 5));
        
        // this class is defined inside lisa-core
        System.out.println(new LiSAConfiguration()); 
    }
}
```

The `main` method in the `App` class simply references two classes, one from each LiSA project, to ensure that the dependencies are correctly added on the classpath at compile- and run-time.

You can now execute `gradle run`, that implicitly builds and executes the project:

```bash
$ gradle run

> Task :run
[5, 5]
LiSA configuration:
  workdir: project-folder
  dump input cfgs: false
  infer types: false
  dump inferred types: false
  dump analysis results: false
  dump json report: false
  0 syntactic checks to execute
  0 semantic checks to execute

BUILD SUCCESSFUL in 5s
2 actionable tasks: 1 executed, 1 up-to-date
```

If your output is similar to the above, congratulations! You successfully created your first project that uses LiSA.
