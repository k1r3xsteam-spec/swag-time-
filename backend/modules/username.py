import asyncio, json, tempfile, os, shutil

async def search(name: str):
    if not shutil.which("sherlock"):
        return {
            "username": name,
            "error": "sherlock не установлен. Установи: pip install sherlock-project",
        }
    with tempfile.TemporaryDirectory() as tmp:
        proc = await asyncio.create_subprocess_exec(
            "sherlock", name,
            "--json", "--output", f"{tmp}/out.json",
            "--timeout", "10", "--print-found",
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE,
        )
        await proc.communicate()
        path = f"{tmp}/out.json"
        if not os.path.exists(path):
            return {"username": name, "found": []}
        with open(path) as f:
            data = json.load(f)
    return {"username": name, "found": data}