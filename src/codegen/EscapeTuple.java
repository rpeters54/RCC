package codegen;

import java.util.Optional;

/***
 * Container object that holds the labels and basic blocks that a continue
 * statement or break statement would jump to.
 */
public class EscapeTuple {

    private final BasicBlock breakBlock;
    private final BasicBlock continueBlock;

    public EscapeTuple() {

        this.breakBlock = null;
        this.continueBlock = null;
    }

    public EscapeTuple(BasicBlock breakBlock) {
        this.breakBlock = breakBlock;
        this.continueBlock = null;
    }

    public EscapeTuple(BasicBlock breakBlock, BasicBlock continueBlock) {
        this.breakBlock = breakBlock;
        this.continueBlock = continueBlock;
    }

    public boolean breakPresent() { return breakBlock != null; }
    public boolean continuePresent() { return continueBlock != null; }
    public BasicBlock breakBlock() { return breakBlock; }
    public BasicBlock continueBlock() { return continueBlock; }

}
