package main;

import ast.TypeEnvironment;
import ast.declarations.Declaration;
import ast.declarations.DeclarationSpecifier;
import ast.declarations.TypeDeclaration;
import ast.types.*;
import org.antlr.v4.runtime.BufferedTokenStream;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.stream.Stream;

public class CompileTest {

    private static final String testDir = "/Users/rileypeters/ANSIParser/src/main/tests/staticTests/";
    private static final Runtime rt = Runtime.getRuntime();

    private record TestTuple(String testPath, String testName) {}

    // Method to provide file paths (or any test data)
    static Stream<TestTuple> fileProvider() {

        return Stream.of(
                new TestTuple(testDir+"incdec/", "incdec.c"),
                new TestTuple(testDir+"minheap/", "minheap.c"),
                new TestTuple(testDir+"stack/", "stacks.c"),
                new TestTuple(testDir+"unions/", "unions.c"),
                new TestTuple(testDir+"matmul/", "matmul.c"),
                new TestTuple(testDir+"width/", "width.c"),
                new TestTuple(testDir+"floats/", "floats.c"),
                new TestTuple(testDir+"degrees/", "degrees.c"),
                new TestTuple(testDir+"fib/", "fib.c"),
                new TestTuple(testDir+"fizzbuzz/", "fizzbuzz.c"),
                new TestTuple(testDir+"loops/", "loops.c"),
                new TestTuple(testDir+"ref/", "ref.c"),
                new TestTuple(testDir+"structs/", "structs.c"),
                new TestTuple(testDir+"superBasic/", "superBasic.c"),
                new TestTuple(testDir+"arrays/", "arrays.c"),
                new TestTuple(testDir+"sort/", "sort.c"),
                new TestTuple(testDir+"creativeBenchMarkName/", "creativeBenchMarkName.c"),
                new TestTuple(testDir+"bert/", "bert.c"),
                new TestTuple(testDir+"BenchMarkishTopics/", "BenchMarkishTopics.c"),
                new TestTuple(testDir+"biggest/", "biggest.c"),
                new TestTuple(testDir+"brett/", "brett.c"),
                new TestTuple(testDir+"binaryConverter/", "binaryConverter.c"),
                new TestTuple(testDir+"fact_sum/", "fact_sum.c"),
                new TestTuple(testDir+"Fibonacci/", "Fibonacci.c"),
                new TestTuple(testDir+"GeneralFunctAndOptimize/", "GeneralFunctAndOptimize.c"),
                new TestTuple(testDir+"hailstone/", "hailstone.c"),
                new TestTuple(testDir+"hanoi_benchmark/", "hanoi_benchmark.c"),
                new TestTuple(testDir+"killerBubbles/", "killerBubbles.c"),
                new TestTuple(testDir+"mile1/", "mile1.c"),
                new TestTuple(testDir+"mixed/", "mixed.c"),
                new TestTuple(testDir+"OptimizationBenchmark/", "OptimizationBenchmark.c"),
                new TestTuple(testDir+"primes/", "primes.c"),
                new TestTuple(testDir+"programBreaker/", "programBreaker.c"),
                new TestTuple(testDir+"stats/", "stats.c"),
                new TestTuple(testDir+"swap_problem/", "swap_problem.c"),
                new TestTuple(testDir+"TicTac/", "TicTac.c"),
                new TestTuple(testDir+"wasteOfCycles/", "wasteOfCycles.c")
                );
    }

    @ParameterizedTest
    @MethodSource("fileProvider")
    @DisplayName("All Compilations")
    void allCompilations(TestTuple tuple) throws IOException, InterruptedException {

        // get the folder
        File folder = new File(tuple.testPath);
        File[] listOfFiles = folder.listFiles();

        // get a list of all file names
        assert listOfFiles != null;
        List<String> names = Arrays.stream(listOfFiles).map(file -> tuple.testPath + file.getName()).sorted().toList();

        for (String name : names) {
            if (name.endsWith(".c")) {
                Main.main(new String[]{name, tuple.testPath + "temp.ll", tuple.testPath + "risc.s"});
                Process llc = rt.exec(new String[]{"llc", tuple.testPath + "temp.ll", "-o", tuple.testPath + "temp.s"});
                llc.waitFor();
                Assertions.assertEquals(0, llc.exitValue());
            }
        }
    }

    @ParameterizedTest
    @MethodSource("fileProvider")
    @DisplayName("All Program Runs")
    void allRuns(TestTuple tuple) throws IOException, InterruptedException {
        // get the folder
        File folder = new File(tuple.testPath);
        List<File> listOfFiles = Arrays.asList(Objects.requireNonNull(folder.listFiles()));

        // get a list of all file names
        List<String> names = listOfFiles.stream().map(file -> tuple.testPath + file.getName()).toList();

        String assembly = tuple.testPath + "temp.ll";
        String executable = tuple.testPath + "temp";
        String inputName = tuple.testPath + "input";
        String inputLongerName = tuple.testPath + "input.longer";
        assert names.contains(assembly);

        Process clang = rt.exec(new String[]{"clang", assembly, "-o", executable});
        clang.waitFor();
        Assertions.assertEquals(0, clang.exitValue());

        if (names.contains(inputName)) {
            String outfileName = tuple.testPath + "output.actual";
            String expectedName = tuple.testPath + "output.expected";
            String diffName = tuple.testPath + "output.diff";

            File input = listOfFiles.get(names.indexOf(inputName));
            File outfile = new File(outfileName);
            File difference = new File(diffName);

            ProcessBuilder runMaker = new ProcessBuilder(executable);
            runMaker.redirectInput(input);
            runMaker.redirectOutput(outfile);
            Process run = runMaker.start();
            run.waitFor();
            Assertions.assertEquals(0, run.exitValue());

            ProcessBuilder compMaker = new ProcessBuilder("diff", outfileName, expectedName);
            compMaker.redirectOutput(difference);
            Process comp = compMaker.start();
            comp.waitFor();
            Assertions.assertEquals(0, comp.exitValue());
        }

        if (names.contains(inputLongerName)) {
            String outfileName = tuple.testPath + "output.longer.actual";
            String expectedName = tuple.testPath + "output.longer.expected";
            String diffName = tuple.testPath + "output.longer.diff";

            File input = listOfFiles.get(names.indexOf(inputLongerName));
            File outfile = new File(outfileName);
            File difference = new File(diffName);

            ProcessBuilder runMaker = new ProcessBuilder(executable);
            runMaker.redirectInput(input);
            runMaker.redirectOutput(outfile);
            Process run = runMaker.start();
            run.waitFor();
            Assertions.assertEquals(0, run.exitValue());

            ProcessBuilder compMaker = new ProcessBuilder("diff", outfileName, expectedName);
            compMaker.redirectOutput(difference);
            Process comp = compMaker.start();
            comp.waitFor();
            Assertions.assertEquals(0, comp.exitValue());
        }
    }

    @Test
    @DisplayName("Expanding Typedef")
    void expandingTypeEnvTest() {
        TypeEnvironment env = new TypeEnvironment();
        TypeDeclaration decl = new TypeDeclaration("Node", new DeclarationSpecifier(new StructType("Node", new ArrayList<>())));
        Declaration struct = new Declaration(null, new DeclarationSpecifier(new StructType("Node", Arrays.asList(
                new Declaration("x", new DeclarationSpecifier(new IntegerType())),
                new Declaration("y", new DeclarationSpecifier(new FloatingType()))
        ))));
        Declaration variable = new Declaration("a", new DeclarationSpecifier(new DefinedType("Node")));
        env.addTypeDef(decl);
        env.addClass(struct.declSpec());
        env.addBinding(variable.name(), variable.declSpec(), env);

        Assertions.assertInstanceOf(StructType.class, env.getBinding("a").getType());
    }

    @Test
    @DisplayName("Nested Typedef")
    void nestedTypeEnvTest() {
        TypeEnvironment env = new TypeEnvironment();
        TypeDeclaration decl = new TypeDeclaration("Node", new DeclarationSpecifier(new StructType("Node", new ArrayList<>())));
        Declaration struct = new Declaration(null, new DeclarationSpecifier(new StructType("Node", Arrays.asList(
                new Declaration("val", new DeclarationSpecifier(new IntegerType())),
                new Declaration("next", new DeclarationSpecifier(new PointerType(new DefinedType("Node"))))
        ))));
        Declaration variable = new Declaration("a", new DeclarationSpecifier(new DefinedType("Node")));
        env.addTypeDef(decl);
        env.addClass(struct.declSpec());
        env.addBinding(variable.name(), variable.declSpec(), env);

        Assertions.assertInstanceOf(StructType.class, env.getBinding("a").getType());
        StructType st = (StructType) env.getBinding("a").getType();
        Assertions.assertInstanceOf(PointerType.class, st.members().get(1).declSpec().getType());
        PointerType pt = (PointerType) st.members().get(1).declSpec().getType();
        Assertions.assertInstanceOf(StructType.class, pt.base());
    }

}
