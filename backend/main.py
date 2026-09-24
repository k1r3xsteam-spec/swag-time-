from fastapi import FastAPI, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware
from modules import username, email, domain, url_reputation, phone, exif

app = FastAPI(title="Swag/Time API", version="1.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def root():
    return {
        "app": "Swag/Time",
        "version": "1.0",
        "modules": ["username", "email", "domain", "url", "phone", "exif"],
    }

@app.get("/username/{name}")
async def username_lookup(name: str):
    return await username.search(name)

@app.get("/email/{addr}")
async def email_lookup(addr: str):
    return await email.check(addr)

@app.get("/domain/{dom}")
async def domain_lookup(dom: str):
    return await domain.lookup(dom)

@app.get("/url")
async def url_lookup(url: str):
    return await url_reputation.check(url)

@app.get("/phone/{number}")
async def phone_lookup(number: str):
    return await phone.check(number)

@app.post("/exif")
async def exif_lookup(file: UploadFile = File(...)):
    data = await file.read()
    return exif.extract(data)