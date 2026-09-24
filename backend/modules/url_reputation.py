import os, httpx

async def check(url: str):
    out = {"url": url}
    us_key = os.getenv("URLSCAN_API_KEY")
    if us_key:
        async with httpx.AsyncClient(timeout=20) as c:
            r = await c.post(
                "https://urlscan.io/api/v1/scan/",
                headers={"API-Key": us_key, "Content-Type": "application/json"},
                json={"url": url, "visibility": "public"},
            )
        out["urlscan"] = r.json() if r.status_code == 200 else {"status": r.status_code}

    sd_key = os.getenv("SHODAN_API_KEY")
    if sd_key:
        host = url.replace("https://", "").replace("http://", "").split("/")[0]
        async with httpx.AsyncClient(timeout=15) as c:
            r = await c.get(
                f"https://api.shodan.io/dns/resolve?hostnames={host}&key={sd_key}"
            )
        out["shodan_dns"] = r.json() if r.status_code == 200 else {"status": r.status_code}

    return out