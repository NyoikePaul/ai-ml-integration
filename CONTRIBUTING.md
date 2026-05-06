# Contributing Guide

## Code of Conduct

Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)

## Getting Started

```bash
git clone https://github.com/YOUR_USERNAME/ai-ml-integration.git
cd ai-ml-integration
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install -r requirements-dev.txt
pre-commit install
```

## Making Changes

### Create Feature Branch
```bash
git checkout -b feature/your-feature
```

### Code Style
```bash
black src tests
ruff check src tests --fix
mypy src
```

### Type Hints
```python
def predict(features: np.ndarray) -> Dict[str, float]:
    """Make a prediction."""
    pass
```

### Testing
```bash
pytest
pytest --cov=src
```

Minimum coverage: 80%

### Docstrings
```python
def train_model(X: pd.DataFrame, y: pd.Series) -> tf.keras.Model:
    """Train a machine learning model.
    
    Args:
        X: Feature matrix
        y: Target vector
        
    Returns:
        Trained model
        
    Example:
        >>> model = train_model(X_train, y_train)
    """
    pass
```

## Commit Messages

Format:
<type>(<scope>): <subject>
<body>
<footer>
````
Types: feat, fix, docs, style, refactor, perf, test, chore
Example:
feat(api): add batch prediction endpoint

- Implement endpoint with streaming
- Support 10,000 samples per request

Closes #123
PR Process

Install dependencies
Make changes
Test: pytest
Lint: ruff check --fix
Format: black src tests
Type: mypy src
Commit with message
Push to fork
Create PR

Requirements

✅ All tests passing
✅ 80%+ coverage
✅ No linting errors
✅ Type hints
✅ Documentation updated

Questions?

📧 paul@nyoikepaul.dev
💬 Discussions
