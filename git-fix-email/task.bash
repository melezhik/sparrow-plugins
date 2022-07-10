set -e

email_from=$(config email_from)
email_to=$(config email_to)
author=$(config author)

git filter-branch --env-filter 'if [ "$GIT_AUTHOR_EMAIL" = "$email_from" ]; then
GIT_AUTHOR_EMAIL=$email_to;
GIT_AUTHOR_NAME="$author"
GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL;
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"; fi' -- --all
