# API Documentation

## Base URL

Development: http://localhost:8000
Production: https://api.example.com

## Authentication

Authorization: Bearer <your-token>

## Response Format

```json
{
  "status": "success",
  "data": {"prediction": 0.95},
  "metadata": {"timestamp": "2024-01-15T10:30:00Z"}
}
```

## Endpoints

### GET /health
Health check endpoint.

### POST /api/v1/predict
Single prediction.

Request:
```json
{
  "model_name": "classifier_v2",
  "features": [1.2, 3.4, 5.6]
}
```

Response:
```json
{
  "status": "success",
  "data": {
    "prediction": 0.95,
    "confidence": 0.99
  }
}
```

### POST /api/v1/batch-predict
Batch predictions.

Request:
```json
{
  "model_name": "classifier_v2",
  "records": [
    {"features": [1.2, 3.4, 5.6]},
    {"features": [2.1, 4.5, 6.7]}
  ]
}
```

## Error Handling

```json
{
  "status": "error",
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid features format"
  }
}
```

## Rate Limiting

- Standard: 100 requests/minute
- Premium: 1,000 requests/minute

Headers:
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 95

## Examples

### Python
```python
import requests

headers = {"Authorization": "Bearer TOKEN"}
payload = {
  "model_name": "classifier_v2",
  "features": [1.2, 3.4, 5.6]
}

response = requests.post(
  "http://localhost:8000/api/v1/predict",
  headers=headers,
  json=payload
)

print(response.json()['data']['prediction'])
```

### cURL
```bash
curl -X POST http://localhost:8000/api/v1/predict \
  -H "Authorization: Bearer TOKEN" \
  -d '{"model_name":"classifier_v2","features":[1.2,3.4,5.6]}'
```

### JavaScript
```javascript
const response = await fetch('http://localhost:8000/api/v1/predict', {
  method: 'POST',
  headers: {'Authorization': 'Bearer TOKEN'},
  body: JSON.stringify({
    model_name: 'classifier_v2',
    features: [1.2, 3.4, 5.6]
  })
});

const result = await response.json();
console.log(result.data.prediction);
```
