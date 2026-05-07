# Deployment Guide

## GitHub Pages (Landing Page)

Landing page is automatically deployed from `/docs/index.html` on every push to main.

URL: https://nyoikepaul.github.io/ai-ml-integration

## Docker Deployment

```bash
docker build -t ai-ml-integration .
docker run -p 8000:8000 ai-ml-integration
```

## Environment Variables

See .env.example for required configuration.
