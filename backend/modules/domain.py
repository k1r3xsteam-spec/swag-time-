import whois, dns.resolver

async def lookup(dom: str):
    out = {"domain": dom}
    try:
        w = whois.whois(dom)
        out["whois"] = {
            "registrar": str(w.registrar) if w.registrar else None,
            "creation_date": str(w.creation_date) if w.creation_date else None,
            "expiration_date": str(w.expiration_date) if w.expiration_date else None,
            "name_servers": w.name_servers,
            "emails": w.emails,
            "org": str(w.org) if w.org else None,
        }
    except Exception as e:
        out["whois_error"] = str(e)

    for rtype in ("A", "MX", "NS", "TXT"):
        try:
            ans = dns.resolver.resolve(dom, rtype, lifetime=5)
            out[rtype] = [str(r) for r in ans]
        except Exception:
            out[rtype] = []
    return out