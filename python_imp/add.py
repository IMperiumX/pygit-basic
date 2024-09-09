def add(repo_path, file_path):
    with open(file_path, "r") as f:
        data = f.read()
    obj_hash = hash_object(data, repo_path=repo_path)
    index_path = os.path.join(repo_path, ".pygit", "index")
    index = {}

    if os.path.exists(index_path):
        with open(index_path, "r") as f:
            index = json.load(f)

    index[file_path] = obj_hash

    with open(index_path, "w") as f:
        json.dump(index, f)

    print(f"Added {file_path} to index.")
