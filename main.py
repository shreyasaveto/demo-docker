from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    """The root endpoint."""
    return {"message": "Hello from FastAPI! Project is running."}

@app.get("/items/{item_id}")
def read_item(item_id: int):
    """An endpoint that returns an item based on its ID."""
    return {"item_id": item_id, "description": "This is a basic placeholder item."}

if __name__ == "__main__":
    # Note: We usually run this via 'uvicorn main:app' on a server,
    # but this block helps with local testing.
    uvicorn.run(app, host="0.0.0.0", port=8000)