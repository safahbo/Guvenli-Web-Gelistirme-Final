# Test Evidence / Test Kanıtları

Projedeki sızıntı önleme ve tarama adımlarının test çıktıları aşağıdadır.

## Test 1: Pre-commit Hook Sızıntı Testi

**Senaryo:** İçinde örnek AWS key bulunan bir `.env` dosyasını bilerek commit etmeye çalıştım.

**Sonuç:** `gitleaks` pre-commit kancası durumu fark edip işlemi durdurdu.

### Terminal Çıktısı

```bash
$ git add .env
$ git commit -m "test: aws key eklendi"

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
```

**Değerlendirme:** Pre-commit aşamasında çalışan `gitleaks` kancası, AWS erişim anahtarını başarıyla tespit etmiş ve commit işlemini engelleyerek hassas bilginin Git geçmişine girmesini önlemiştir.

---

## Test 2: Geçmiş Git Logları Taraması (Docker)

**Senaryo:** Reponun geçmiş commitlerinde herhangi bir sızıntı kalıp kalmadığını Docker container üzerinden taradım.

**Sonuç:** Herhangi bir sızıntı bulunmadı ve işlem `exit code 0` ile tamamlandı.

### Terminal Çıktısı

```bash
$ docker-compose up scanner

[+] Running 1/0
 ✔ Container guvenli-web-gelistirme-final-scanner-1  Created   0.0s

Attaching to scanner-1
scanner-1  |
scanner-1  |     ○
scanner-1  |     │╲
scanner-1  |     │ ○
scanner-1  |     ○ ░
scanner-1  |     ░    gitleaks
scanner-1  |
scanner-1  | 8:30AM INF 12 commits scanned.
scanner-1  | 8:30AM INF scan completed in 21.4ms
scanner-1  | 8:30AM INF no leaks found

scanner-1 exited with code 0
```

**Değerlendirme:** Docker içerisinde çalışan tarama servisi tüm Git geçmişini incelemiş, toplam 12 commit taranmış ve herhangi bir gizli bilgi sızıntısı tespit edilmemiştir.

---

## Test 3: Secret Rotation (Sır Rotasyonu)

**Durum:** Sızdırıldığı tespit edilen veya şüphe duyulan bir anahtarın nasıl değiştirileceğine ilişkin süreç, `docs/modules/rotation-sop.md` dosyasında SOP (Standard Operating Procedure) olarak dokümante edilmiştir.

### Doğrulama Kriterleri

* Sızan sırların derhal iptal edilmesi (revoke).
* Yeni sırların güvenli şekilde oluşturulması.
* Yeni sırların güvenli saklama mekanizmalarına aktarılması.
* Etkilenen servislerin güncellenmesi ve yeniden dağıtılması.
* Olayın kayıt altına alınması ve güvenlik ekibine bildirilmesi.

**Değerlendirme:** Olası bir sızıntı durumunda izlenecek standart süreç tanımlanmış olup, operasyonel müdahale adımları dokümantasyon içerisinde erişilebilir durumdadır.

