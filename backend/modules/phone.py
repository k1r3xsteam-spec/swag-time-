import phonenumbers
from phonenumbers import geocoder, carrier, number_type, PhoneNumberType
from urllib.parse import quote

def _type_name(t):
    return {
        PhoneNumberType.MOBILE: "mobile",
        PhoneNumberType.FIXED_LINE: "fixed_line",
        PhoneNumberType.FIXED_LINE_OR_MOBILE: "fixed_or_mobile",
        PhoneNumberType.TOLL_FREE: "toll_free",
        PhoneNumberType.PREMIUM_RATE: "premium_rate",
        PhoneNumberType.SHARED_COST: "shared_cost",
        PhoneNumberType.VOIP: "voip",
        PhoneNumberType.PERSONAL_NUMBER: "personal",
        PhoneNumberType.PAGER: "pager",
        PhoneNumberType.UAN: "uan",
        PhoneNumberType.VOICEMAIL: "voicemail",
        PhoneNumberType.UNKNOWN: "unknown",
    }.get(t, "unknown")

def _dorks(e164: str, raw: str, formatted: str):
    queries = [
        f'site:facebook.com intext:"{e164}"',
        f'site:vk.com intext:"{e164}"',
        f'site:twitter.com intext:"{e164}"',
        f'site:instagram.com intext:"{e164}"',
        f'site:pastebin.com intext:"{e164}"',
        f'site:sync.me intext:"{raw}"',
        f'site:whosenumber.info intext:"{e164}"',
        f'site:findwhocallsme.com intext:"{e164}"',
        f'site:numlookup.com intext:"{e164}"',
        f'site:truecaller.com intext:"{e164}"',
        f'ext:pdf intext:"{e164}"',
        f'ext:doc | ext:docx | ext:xls intext:"{e164}"',
        f'"{formatted}"',
        f'"{e164}" "telegram"',
        f'"{e164}" "whatsapp"',
        f'"{e164}" "avito" | "olx" | "юла"',
    ]
    return [
        {"query": q, "url": f"https://www.google.com/search?q={quote(q)}"}
        for q in queries
    ]

def check(number: str):
    out = {"number": number}
    try:
        parsed = phonenumbers.parse(number, None)
    except Exception as e:
        return {"number": number, "error": f"Не удалось распарсить: {e}"}

    if not phonenumbers.is_possible_number(parsed):
        out["valid"] = False
        out["error"] = "Номер невозможен (неверная длина/формат)"
        return out

    out["valid"] = phonenumbers.is_valid_number(parsed)
    out["e164"] = phonenumbers.format_number(
        parsed, phonenumbers.PhoneNumberFormat.E164)
    out["international"] = phonenumbers.format_number(
        parsed, phonenumbers.PhoneNumberFormat.INTERNATIONAL)
    out["national"] = phonenumbers.format_number(
        parsed, phonenumbers.PhoneNumberFormat.NATIONAL)
    out["country_code"] = parsed.country_code
    out["national_number"] = parsed.national_number
    out["region"] = phonenumbers.region_code_for_number(parsed)
    out["carrier"] = carrier.name_for_number(parsed, "en")
    out["location"] = geocoder.description_for_number(parsed, "ru")
    out["line_type"] = _type_name(number_type(parsed))

    raw = out["e164"].replace("+", "")
    out["dorks"] = _dorks(out["e164"], raw, out["international"])
    return out