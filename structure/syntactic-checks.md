# Syntactic Checks

LiSA allows developer to define simple syntactic checks. These can define simple conditions on the syntactic structure of the program that, when violated, can generate warnings. To define a syntactic check, one needs to implement the [Syntactic Check][syncheck] interface. Such instance can then be registered in LiSA with `LiSA.addSyntacticCheck(...)` method.

## The SyntacticCheck interface

The interface provides five different callbacks that will be automatically invoked by LiSA in different moments of the execution:

* `beforeExecution(CheckTool tool)` will be invoked once _before_ the program is analyzed with the check: this callback can be used for setup and initialization.
* `visitCFGDescriptor(CheckTool tool, CFGDescriptor descriptor)` will be invoked once _for every_ CFG to inspect its descriptor: this callback can be used to inspect CFG signatures.
* `visitStatement(CheckTool tool, Statement statement)` will be invoked once _for every_ Statement of each CFG that is not an Expression.
* `visitExpression(CheckTool tool, Expression expression)` will be invoked once _for every_ Expression of each CFG, also for top-level ones.
* `afterExecution(CheckTool tool)` will be invoked once _after_ the program has been analyzed with the check: this callback can be used for issuing cumulative warnings:

## The CheckTool class

Syntactic checks can interact with LiSA through the [CheckTool][tool] instance that is passed as parameter to all callbacks. Specifically, this class provides a series of methods that can be used to issue warnings, automatically extracting the program point where the warning should be issued.

## Example

As a simple example, suppose that one wants LiSA to issue a warning if there is more than a CFG whose name is `main` in the analyzed program. To achieve this, one could use the following check implementation:

```java
public class MultipleMainCheck implements SyntacticCheck {
    private int counter;
    
    @Override
    public void beforeExecution(CheckTool tool) {
        this.counter = 0;
    }
    
    @Override
    public void visitCFGDescriptor(CheckTool tool, CFGDescriptor descriptor) {
        if (descriptor.getName().equals("main"))
            this.counter++;
    }

    @Override
    public void visitStatement(CheckTool tool, Statement statement) { }
    
    @Override
    public void visitExpression(CheckTool tool, Expression expression) { }
    
    @Override
    public void afterExecution(CheckTool tool) {
        if (this.counter > 1)
            tool.warn("Found " + this.counter + " methods with name \"main\"");
    }
}
```

The above check exploits `beforeExecution` to setup the necessary `counter` field, and `afterExecution` to decide whether or not to emit a warning. `counter` is incremented inside `visitCFGDescriptor` each time a descriptor satisfying the desired condition is met.

[syncheck]:https://github.com/lisa-analyzer/lisa/blob/master/lisa/lisa-sdk/src/main/java/it/unive/lisa/checks/syntactic/SyntacticCheck.java
[tool]:https://github.com/lisa-analyzer/lisa/blob/master/lisa/lisa-sdk/src/main/java/it/unive/lisa/checks/syntactic/CheckTool.java