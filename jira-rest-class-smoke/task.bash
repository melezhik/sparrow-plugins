jira_user=$(config jira_user)
jira_password=$(config jira_password)

perl -MJIRA::REST::Class -e "print 
JIRA::REST::Class->new(
  qw{https://issues.jenkins-ci.org},$jira_user,$jira_password
)->project('JENKINS')->name"
