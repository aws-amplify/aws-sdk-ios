import sys

from functions import log, run_command

user = sys.argv[1]
token = sys.argv[2]
title = sys.argv[3]
body = sys.argv[4]
base = sys.argv[5]
head = sys.argv[6]
github_org = sys.argv[7]
repo = sys.argv[8]

log(f"Creating pull request for {repo}")

auth_user = f"{user}:{token}"

data = f'{{"title":"{title}","base":"{base}","head":"{head}", "body":"{body}"}}'
log(f"Pull request data: {data}")

repo_url = f"https://api.github.com/repos/{github_org}/{repo}/pulls"

exit_code, out, err = run_command(
    ["curl", "--user", auth_user, "--request", "POST", "--data", data, repo_url]
)

if exit_code == 0:
    log(f"Created pull request for {repo}")
else:
    log(f"Could not create pull request for {repo}: output: {out}; error: {err}")

sys.exit(exit_code)
