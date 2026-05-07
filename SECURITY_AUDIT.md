# Security Audit Checklist

## Authentication & Authorization
- [ ] JWT tokens with expiry
- [ ] Passwords hashed with bcrypt
- [ ] Login endpoint secured
- [ ] Role-based access control
- [ ] Admin functions protected

## API Security
- [ ] Input validation on all endpoints
- [ ] Rate limiting enabled
- [ ] CORS configured
- [ ] Security headers set
- [ ] Error handling proper

## Data Protection
- [ ] Encryption at rest
- [ ] HTTPS/TLS required
- [ ] Keys securely stored
- [ ] PII handling compliant

## Infrastructure
- [ ] No hardcoded secrets
- [ ] Environment variables used
- [ ] .env in .gitignore
- [ ] Dependencies updated
- [ ] Secret scanning enabled

## Monitoring
- [ ] Application logging
- [ ] Error tracking
- [ ] Security alerts
- [ ] Regular audits

## Compliance
- [ ] Security policy documented
- [ ] Incident response plan
- [ ] Access control documented
- [ ] Monthly reviews
