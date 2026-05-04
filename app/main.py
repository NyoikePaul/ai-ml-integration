from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import joblib
import numpy as np

app = FastAPI()

# Load the model once when the server starts
MODEL_PATH = "models/house_model.pkl"
model = joblib.load(MODEL_PATH)

class PredictionRequest(BaseModel):
    data: list[float]

@app.post("/predict")
async def predict(request: PredictionRequest):
    # Convert input list to NumPy array for the model
    input_data = np.array(request.data).reshape(-1, 1)
    
    # Get real prediction
    prediction = model.predict(input_data)
    
    return {
        "prediction": prediction.tolist(),
        "model_type": "LinearRegression"
    }
