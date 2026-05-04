#!/bin/bash
# production-manage.sh – controls Docker + nginx + rate limiting

set -e

ACTION="${1:-help}"

case "$ACTION" in
    start)
        echo "Starting Docker container..."
        docker-compose up -d
        echo "Reloading nginx..."
        sudo systemctl reload nginx
        ;;
    stop)
        echo "Stopping Docker container..."
        docker-compose down
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    status)
        echo "--- Docker container ---"
        docker ps --filter "name=ml-api"
        echo -e "\n--- nginx status ---"
        sudo systemctl status nginx --no-pager
        ;;
    logs)
        docker-compose logs --tail=50
        ;;
    test)
        echo "Testing rate limiting (should return 200 for first 20 requests, then 429)..."
        for i in {1..25}; do
            STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X POST http://localhost/predict \
                -H "Content-Type: application/json" -d '{"data":[1500]}')
            echo "Request $i: $STATUS"
            if [ "$STATUS" -eq 429 ]; then
                echo "Rate limiting active (as expected)"
                break
            fi
        done
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status|logs|test}"
        exit 1
        ;;
esac
