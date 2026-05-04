import joblib
from sklearn.linear_model import LinearRegression
import numpy as np
import os

# 1. Create dummy data (Price of a house based on square footage)
X = np.array([[1000], [1500], [2000], [2500]])
y = np.array([200000, 300000, 400000, 500000])

# 2. Train a simple model
model = LinearRegression()
model.fit(X, y)

# 3. Save it to the models folder
os.makedirs('models', exist_ok=True)
joblib.dump(model, 'models/house_model.pkl')
print("✅ Model trained and saved to models/house_model.pkl")
