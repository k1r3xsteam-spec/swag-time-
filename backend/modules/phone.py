import os, httpx

async def check(number: str):
    key = os.getenv("NUMVERIFY_API_KEY")
    if not key:
        return {"number": number, "error": "NUMVERIFY_API_KEY не задан в .env"}
    async with httpx.AsyncClient(timeout=15) as c:
        r = await c.get(
            "http://apilayer.net/api/validate",
            params={"access_key": key, "number": number, "format": "1"},
        )
    return r.json() if r.status_code == 200 else {"error": f"HTTP {r.status_code}"}