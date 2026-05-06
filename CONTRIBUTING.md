# Contributing

Thanks for contributing!

## Code of Conduct

Please read CODE_OF_CONDUCT.md

## Development Setup

```bash
python -m venv venv
source venv/bin/activate
make install-dev
pre-commit install
```

## Code Style

```bash
make format
make lint
make type-check
```

## Testing

```bash
make test
make test-cov
```

## Pull Request Process

1. Fork repository
2. Create feature branch
3. Follow code style
4. Add tests
5. Submit PR
