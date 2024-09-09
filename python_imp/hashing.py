def hash_object(data, obj_type="blob", write=True, repo_path="."):
    obj_data = f"{obj_type} {len(data)}\0{data}".encode()
    obj_hash = hashlib.sha1(obj_data).hexdigest()
    obj_path = os.path.join(repo_path, ".pygit", "objects", obj_hash[:2], obj_hash[2:])

    if write:
        os.makedirs(os.path.dirname(obj_path), exist_ok=True)
        with open(obj_path, "wb") as f:
            f.write(obj_data)
    return obj_hash
