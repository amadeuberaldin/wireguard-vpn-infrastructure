#!/bin/bash

echo "Running security scan..."

# Patterns to block
PATTERNS=(
    "PrivateKey ="
    "BEGIN OPENSSH PRIVATE KEY"
    "BEGIN RSA PRIVATE KEY"
    "BEGIN PRIVATE KEY"
    "id_rsa"
    "id_ed25519"
    ".pem"
)

FAIL=0

for pattern in "${PATTERNS[@]}"; do
    if git diff --cached | grep -q "$pattern"; then
        echo "❌ Found forbidden pattern: $pattern"
        FAIL=1
    fi
done

if [ $FAIL -eq 1 ]; then
    echo ""
    echo "Commit blocked: sensitive data detected."
    exit 1
fi

echo "✔ No sensitive patterns found."
exit 0
