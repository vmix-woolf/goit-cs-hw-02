#!/bin/bash

WEBSITES=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
    "https://youtube.com"
    "https://wikipedia.org"
    "https://3d-qwerty.co.uk"
)

# Файл логів
LOG_FILE="website-status.log"

# Очищення файлу логів перед записом нових результатів
echo "Website Status Check - $(date)" > "$LOG_FILE"
echo "Перевірка доступності сайтів..."

for SITE in "${WEBSITES[@]}"; do
    STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" --location "$SITE")
    if [ "$STATUS_CODE" -eq 200 ]; then
        echo "<$SITE> is UP" | tee -a "$LOG_FILE"
    else
        echo "<$SITE> is DOWN" | tee -a "$LOG_FILE"
    fi
done

echo "Результати записано у файл $LOG_FILE"
