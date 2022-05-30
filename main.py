from fastapi import FastAPI, UploadFile
from fastapi.responses import FileResponse
from oct2py import octave
import asyncio
from hypercorn.config import Config
from hypercorn.asyncio import serve

app = FastAPI()


@app.post("/plot")
def return_image(file: UploadFile):
    octave.plotfur(file.filename)
    return FileResponse("image.jpg")


asyncio.run(serve(app, Config()))





