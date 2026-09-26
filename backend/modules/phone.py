from urllib.parse import quote
import re

COUNTRY_CODES = {
    "7": "Russia/Kazakhstan",
    "380": "Ukraine",
    "375": "Belarus",
    "1": "USA/Canada",
    "44": "United Kingdom",
    "49": "Germany",
    "33": "France",
    "39": "Italy",
    "34": "Spain",
    "48": "Poland",
    "90": "Turkey",
    "86": "China",
    "81": "Japan",
    "82": "South Korea",
    "91": "India",
    "55": "Brazil",
    "61": "Australia",
}

def _guess_country(e164: str):
    digits = e164.replace("+", "")
    for code in sorted(COUNTRY_CODES.keys(), key=len, reverse=True):
        if digits.startswith(code):
            return COUNTRY_CODES[code]
    return "unknown"

def _dorks(e164: str, raw: str):
    queries = [
        f'site:facebook.com intext:"{e164}"',
        f'site:vk.com intext:"{e164}"',
        f'site:twitter.com intext:"{e164}"',
        f'site:instagram.com intext:"{e164}"',
        f'site:pastebin.com intext:"{e164}"',
        f'site:sync.me intext:"{raw}"',
        f'site:whosenumber.info intext:"{e164}"',
        f'site:findwhocallsme.com intext:"{e164}"',
        f'site:truecaller.com intext:"{e164}"',
        f'ext:pdf intext:"{e164}"',
        f'ext:doc | ext:docx | ext:xls intext:"{e164}"',
        f'"{e164}" "telegram"',
        f'"{e164}" "whatsapp"',
        f'"{e164}" "avito" | "olx"',
    ]
    return [
        {"query": q, "url": f"https://www.google.com/search?q={quote(q)}"}
        for q in queries
    ]

def check(number: str):
    out = {"number": number}
    cleaned = re.sub(r"[^\d+]", "", number)
    if not cleaned.startswith("+"):
        cleaned = "+" + cleaned
    digits = cleaned.replace("+", "")
    if len(digits) < 8:
        out["valid"] = False
        out["error"] = "Слишком короткий номер"
        return out

    out["valid"] = True
    out["e164"] = cleaned
    out["country"] = _guess_country(cleaned)
    out["length"] = len(digits)
    out["dorks"] = _dorks(cleaned, digits)
    return out