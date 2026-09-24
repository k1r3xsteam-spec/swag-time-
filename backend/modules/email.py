import os, httpx

async def check(addr: str):
    key = os.getenv("HIBP_API_KEY")
    if not key:
        return {"email": addr, "error": "HIBP_API_KEY не задан в .env"}
    async with httpx.AsyncClient(timeout=15) as c:
        r = await c.get(
            f"https://haveibeenpwned.com/api/v3/breachedaccount/{addr}",
            headers={"hibp-api-key": key, "user-agent": "swag-time"},
        )
    if r.status_code == 404:
        return {"email": addr, "breaches": []}
    if r.status_code != 200:
        return {"email": addr, "error": f"HIBP вернул {r.status_code}"}
    return {"email": addr, "breaches": r.json()}