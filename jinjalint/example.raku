use Sparrow6::DSL;

task-run "lint my code", "jinjalint", %(
  args => [
    "templates/",
    ["verbose"]
  ]
);
