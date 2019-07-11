#for install hemcrest
> pip install pyhamcrest

tutorial Behave from below link
> https://jenisys.github.io/behave.example/tutorials/

Step 1 ==> dont forget to enter virtualenv with:
> source env/bin/activate

Running the command
> behave tutorial/features/
or
> behave tutorial/features/_targeted_file.feature

================================ Objective and Step ==========================================

Tutorial 1: First Steps
Goal: Show basics, make first steps

Tutorial 2: Natural Language
Goal: Use natural language when writing tests.

Tutorial 3: Step Parameters
Goal: Use step parameter to handover parameters to step functions.

Tutorial 4: Scenario Outline¶
Goal: Use scenario outline as a parametrized template (avoid too many similar scenarios).

Tutorial 5: Multi-line Text (Step Data)¶
Goal: Use multi-line text (with tripple-quoted text) for large text sections.

   Triple-quoted strings (ala Python docstrings) provide a possible to use large text section as step parameter.
   Normally, so much text would not fit on one line.

Tutorial 6: Setup Table¶
Goal: Use setup tables to simplify test setup.


Tutorial 7: Result Table
Goal: Use result tables to simplify comparison of an expected dataset.
 The usage of result tables come in variations. It often depends what you want to compare.
 These variations in the test automation layer are:

1. ordered dataset comparison
2. unordered dataset comparison
3. ordered subset comparison (result table contains subset)
4. unordered subset comparison (result table contains subset)

Tutorial 8: Execute Other Steps in a Step¶
Goal:	Reuse a sequence of existing steps as a step-macro.
 In some case, you want to replace a number of steps in a scenario by one simple macro step (macro functionality).
 To avoid code duplication in the test automation layer,
 the BDD framework normally provides a functionality to easily call these steps from within a step defintion.

Tutorial 9: Use Background¶
Goal:	Use the Background concept to execute a number of steps before each scenario.

Tutorial 10: User-defined Data Type¶
Goal:	Show how user-defined data types can be used in step parameters.
 User-defined data types simplify the processing in step definitions.
 The string parameters are automatically parsed and converted into specific data types.

Tutorial 11: Use Tags¶
Goal:	Understand the usage of tags to organize the testsuite and optimize test runs.
 Several test frameworks support a concept of tags to mark a number of tests (py.test markers, TestNG test groups,
 JUnit Categories, NUnit CategoryAttribute). This provides a simple, flexible and effective mechanism to:

1. select a number of tests
2. exclude a number of tests
  for a test run. This mechanism is orthogonal to the static test package structure.

Tutorial 12: Use another Spoken Language¶
Goal:	Use another spoken language for testing (other than English)
==================================================================================================
