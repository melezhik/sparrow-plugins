use Sparrow6::DSL;
my %state = task-run "current branch", "git-current-branch";
say %state<branch>;
