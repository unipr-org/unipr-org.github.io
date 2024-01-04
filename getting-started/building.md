# Building from source 

| <name>Goal:</name> retrieve the source code of LiSA and build it locally |
| <name>LiSA release used:</name> 0.1b4 |
| <name>Estimated time:</name> 5 minutes |
| <name>Requirements:</name> [JDK 11](https://www.oracle.com/it/java/technologies/javase/jdk11-archive-downloads.html), [Git](https://git-scm.com/downloads), an IDE (optional - [Eclipse](https://www.eclipse.org/downloads/) or [IntelliJ](https://www.jetbrains.com/idea/download/)) |
| <name>Note:</name> you should build from source only if you plan to work directly on LiSA itself, or if you need to work with an unreleased version. If you want to use LiSA as-is instead, please refer to the [Creating a project using LiSA](maven-dependency.md) tutorial instead. |
{:.tutorialheader}

----

LiSA comes as a [Gradle](https://gradle.org/) 7.2 project. Gradle can be executed through a local wrapper without downloading and installing a centralized version of it, and LiSA comes with a wrapper! You'll always be able to build LiSA with the version of Gradle it is meant to be compiled with, without spending time managing your own Gradle installation.

After cloning the repository with `git clone https://github.com/lisa-analyzer/lisa.git` or with any other Git wrapper (GitHub Desktop or GitHub Cli for example) of your choice, follow one of the tutorials below to get started. 

Jump to instructions for [Eclipse](#eclipse), [IntelliJ IDEA](#intellij-idea), [Windows command line](#windows-command-line), or [Mac/Linux command line](#maclinux-command-line).

Once you've set up your environment to build LiSA, you can add it as a dependency to a different project or work directly on it.

### Eclipse

**Note**: make sure that the [Gradle IDE Pack](https://marketplace.eclipse.org/content/gradle-ide-pack) plugin for Eclipse is installed.

Import the LiSA projects with `File -> Import... -> Existing Gradle project`, and select the `lisa` folder inside the cloned repository (*not* the repository root) and click on `Finish`. Eclipse should detect the hierarchical structure of the project automatically, and should import all subprojects as well.

The Gradle build can be executed from the Gradle Tasks view (`Window -> Show View -> Other... -> Gradle Tasks`) by double clicking on the `build -> build` task under the `lisa` project (if it does not appear in the list of projects of the Gradle Tasks view, click on the refresh icon in the top-right of the view itself).

**Caution 1**: Eclipse will signal compiler errors when the project is first imported. This is normal, since the antlr-generated classes that are used inside `lisa-imp` will not be present. After running the Gradle build a first time, the Eclipse configuration needs to be updated: right click on the `lisa-imp` project inside the Project Explorer view (`Window -> Show View -> Other... -> Project Explorer`) or inside the Package Explorer view (`Window -> Show View -> Other... -> Package Explorer`) and select `Build Path -> Configure Build Path...`. In the dialog that opens up, six folders must be visible inside the `Source` tab: add the missing one through the `Add Folder...` button, and then edit the contents of each one's output folder and contains test sources accordingly to the following table.

| Folder | Output folder | Contains test sources |
| :-- | - | - |
| `lisa-imp/src/main/java` | `lisa-imp/bin/main` | No |
| `lisa-imp/src/main/resources` | `lisa-imp/bin/main` | No |
| `lisa-imp/src/main/antlr` | `lisa-imp/bin/main` | No |
| `lisa-imp/build/generated-src/antlr/main` | `lisa-imp/bin/main` | No |
| `lisa-imp/src/test/java` | `lisa-imp/bin/test` | Yes |
| `lisa-imp/src/test/resources` | `lisa-imp/bin/test` | Yes |

**Caution 2**: sometimes (e.g., when adding new dependencies to the project) the plugin does not automatically refresh the Gradle configuration, and thus the build might fail due to missing dependencies or to files not being generated. If this happens, right click on the `lisa` project inside the Project Explorer view (`Window -> Show View -> Other... -> Project Explorer`) or inside the Package Explorer view (`Window -> Show View -> Other... -> Package Explorer`) and select `Gradle -> Refresh Gradle project`.

### IntelliJ IDEA

There are two ways to import the project:
* `File -> New Project from Version Control...` and then fill the URL with LiSA's Github repository (that is, `https://github.com/lisa-analyzer/lisa`)
* Clone the repository in a local directory, and then select this directory from `File -> Open...`
When opening the project for the first time, in the bottom righ part of the window a pop up `Gradle build script found` will appear. Select `Import` and the build process will start. This start might take several minutes since it might need to download some plugins and libraries. At the end, the project will compile correctly and all the Gradle tasks can be run.

### Windows command line

Open a terminal window inside the folder where you cloned the repository, and then execute:
```batch
cd lisa
.\gradlew.bat build
```

### Mac/Linux command line

Open a terminal window inside the folder where you cloned the repository, and then execute:
```bash
cd lisa
./gradlew build
```

----

The `build` task ensures that everything (from code generation to compilation, packaging and test execution) works fine. If the above commands succeed, then everthing is set.

## Next steps

Now that you know how to build LiSA (and optionally import it into an IDE), you can immediately start implementing new components directly on LiSA.


