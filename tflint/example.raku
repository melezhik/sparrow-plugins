use Sparrow6::DSL;

task-run "lint my code", "tflint", %(
  args => [
    "examples/",
    ["force", "no-color"]
  ]
);

