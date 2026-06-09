# Test Evidence / Test Kanıtları

Projedeki sızıntı önleme ve tarama adımlarının test çıktıları aşağıdadır.

## Test 1: Pre-commit Hook Sızıntı Testi

**Senaryo:** İçinde örnek AWS key bulunan bir `.env` dosyasını bilerek commit etmeye çalıştım.
**Sonuç:** `gitleaks` pre-commit kancası durumu fark edip işlemi durdurdu.

**Terminal Çıktısı:**
```bash
$git add .env$ git commit -m "test: aws key eklendi"

    ○
    │╲
    │ ○
    ○ ░
    ░    gitleaks

Finding:     AWS_SECRET_ACCESS_KEY="AKIAIOSFODNN7EXAMPLE"
Secret:      AKIAIOSFODNN7EXAMPLE
RuleID:      aws-access-token
Entropy:     3.584184
File:        .env
Line:        12
Commit:      (staged)

1 leaks found.
Gitleaks sızıntı tespit etti. Commit iptal ediliyor.
