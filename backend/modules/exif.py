import subprocess, tempfile, os, json, shutil

def extract(data: bytes):
    if not shutil.which("exiftool"):
        return {"error": "exiftool не установлен на сервере"}
    with tempfile.NamedTemporaryFile(delete=False, suffix=".jpg") as f:
        f.write(data)
        path = f.name
    try:
        r = subprocess.run(
            ["exiftool", "-json", "-G", path],
            capture_output=True, text=True, timeout=15,
        )
        return {"exif": json.loads(r.stdout)}
    except Exception as e:
        return {"error": str(e)}
    finally:
        os.unlink(path)