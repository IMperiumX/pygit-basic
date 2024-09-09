from pathlib import Path


def init_repo(repo_path):
    pygit_path = Path(repo_path) / ".pygit"
    pygit_path.mkdir(parents=True, exist_ok=True)

    objects_path = pygit_path / "objects"
    objects_path.mkdir(exist_ok=True)

    refs_path = pygit_path / "refs"
    refs_path.mkdir(exist_ok=True)

    with open(pygit_path / "HEAD", "w") as f:
        f.write("ref: refs/heads/master\n")

    print(f"Initialized empty pygit repository in {repo_path}")
