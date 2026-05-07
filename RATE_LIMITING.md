# Rate Limiting Configuration

## Installation
pip install slowapi

## Basic Implementation
```python
from slowapi import Limiter
from slowapi.util import get_remote_address

limiter = Limiter(key_func=get_remote_address)

@app.get("/predict")
@limiter.limit("100/minute")
async def predict(request: Request):
    pass
```

## Recommended Limits

- Public endpoints: 100/min per IP
- Authenticated users: 1000/min per user
- Bulk operations: 10/min per IP
- Admin functions: 1/hour per user
