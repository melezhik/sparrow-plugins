my $action = config()<action>;

set_stdout("action: {$action}");
set_stdout("SCM_URL: {%*ENV<SCM_URL>}");
set_stdout("SCM_SHA: {%*ENV<SCM_SHA>}");
set_stdout("BUILD_STATUS: {%*ENV<BUILD_STATUS>}");

if $action eq "commit-status" {

  my $user;
  my $repo; 
  my $status;

  if %*ENV<SCM_URL> ~~ / \S+ '/' (\S+) '/' (\S+) '.git' $$ / {
    # http://localhost:3000/melezhik/kris.git
    $user = "$0"; $repo =  "$1";
  } elsif %*ENV<SCM_URL> ~~ / \S+ ':' (\S+) '/' (\S+) '.git' $$ / {
    # alex@localhost:melezhik/kris.git
    $user = "$0"; $repo =  "$1";
  }

  if %*ENV<BUILD_STATUS> eq "OK" and %*ENV<BUILD_WARN_CNT> {
    $status = "warning"
  } elsif %*ENV<BUILD_STATUS> eq "OK" {
    $status = "success"
  } elsif %*ENV<BUILD_STATUS> eq "FAIL" 
    or %*ENV<BUILD_STATUS> eq "TIMEOUT" 
    or %*ENV<BUILD_STATUS> eq "UNKNOWN"  {
    $status = "failure"
  }

  if $user && $repo && $status && %*ENV<SCM_SHA> {
    run_task("commit-status", %(
      user => $user,
      repo => $repo,
      status => $status
    ))
  } else {
    set_stdout("don't know how to run commit-status, some parameters are missing")
  }
}
