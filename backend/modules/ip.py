import httpx
import dns.resolver
import ipaddress

async def lookup(ip: str):
    out = {"ip": ip}

    # Локальная проверка через ipaddress
    try:
        ip_obj = ipaddress.ip_address(ip)
        out["version"] = f"IPv{ip_obj.version}"
        out["is_private"] = ip_obj.is_private
        out["is_global"] = ip_obj.is_global
        out["is_multicast"] = ip_obj.is_multicast
        out["is_loopback"] = ip_obj.is_loopback
    except ValueError:
        out["error"] = "Неверный формат IP"
        return out

    # Reverse DNS через dnspython
    try:
        rev = dns.resolver.resolve_address(ip, lifetime=5)
        out["reverse_dns"] = [str(r) for r in rev]
    except Exception:
        out["reverse_dns"] = []

    # Геолокация через ip-api.com (бесплатно, без ключа)
    try:
        async with httpx.AsyncClient(timeout=10) as c:
            r = await c.get(
                f"http://ip-api.com/json/{ip}",
                params={"fields": "status,message,country,countryCode,region,regionName,city,zip,lat,lon,timezone,isp,org,as,asname,reverse,mobile,proxy,hosting,query"}
            )
        data = r.json()
        if data.get("status") == "success":
            out["geo"] = data
        else:
            out["geo_error"] = data.get("message", "unknown")
    except Exception as e:
        out["geo_error"] = str(e)

    return out