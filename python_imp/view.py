import json
import os


def log(repo_path):
    head_path = os.path.join(repo_path, ".pygit", "HEAD")
    if not os.path.exists(head_path):
        print("No commits found.")
        return

    with open(head_path, "r") as f:
        ref = f.read().strip().split()[-1]
        commit_path = os.path.join(repo_path, ".pygit", ref)

    if not os.path.exists(commit_path):
        print("No commits found.")
        return

    with open(commit_path, "r") as f:
        commit_hash = f.read().strip()

    while commit_hash:
        commit_path = os.path.join(
            repo_path, ".pygit", "objects", commit_hash[:2], commit_hash[2:]
        )
        with open(commit_path, "r") as f:
            commit_data = json.loads(f.read().split("\0", 1)[1])

        print(f"Commit: {commit_hash}")
        print(f"Date: {commit_data['timestamp']}")
        print(f"\n    {commit_data['message']}\n")

        commit_hash = commit_data["parent"]
