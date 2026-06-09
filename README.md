Aşağıdaki içeriği doğrudan **README.md** dosyasına tek seferde kopyalayabilirsiniz:

````md
<div align="center">
  <a href="https://istinye.edu.tr">
    <img src="docs/assets/istinye-university-logo.webp" alt="Istinye University" width="180"/>
  </a>

# Env Secrets Management & Git Leak Prevention Pipeline

![GitHub](https://img.shields.io/badge/GitHub-Private-red?style=flat-square&logo=github)
![Language](https://img.shields.io/badge/Language-Bash%20%7C%20Docker-blue?style=flat-square)
![Status](https://img.shields.io/badge/Status-Completed-green?style=flat-square)
![Course](https://img.shields.io/badge/Course-BGT208-purple?style=flat-square)
![License](https://img.shields.io/badge/License-Educational-green?style=flat-square)

</div>

---

# 🎓 Instructor / Danışman

| Field | Information |
|--------|------------|
| **Name / Ad** | Keyvan Arasteh |
| **GitHub** | [@keyvanarasteh](https://github.com/keyvanarasteh) |
| **Email** | keyvan.arasteh@istinye.edu.tr |
| **LinkedIn** | https://www.linkedin.com/in/keyvanarasteh/ |
| **Website** | https://qline.tech |

---

# 👤 Student / Öğrenci

| Field | Information |
|--------|------------|
| **Name / Ad Soyad** | Safa Hacıbayramoğlu |
| **Student ID / Öğrenci No** | `2420191014` |

---

# 📚 Course Information / Ders Bilgileri

| Field | Information |
|--------|------------|
| **Course Name / Ders Adı** | Secure Web Development / Güvenli Web Yazılımı Geliştirme |
| **Course Code / Ders Kodu** | BGT208 |
| **Credits / Kredi** | 3 ECTS |
| **Semester / Dönem** | 2025-2026 Spring / 2025-2026 Bahar |
| **Institution / Üniversite** | Istinye University |

---

# 📋 Project Overview / Proje Özeti

Bu proje, **12-Factor App** yaklaşımının *Config* prensibi temel alınarak geliştirilmiştir. Amaç, uygulamalarda kullanılan hassas bilgilerin (API anahtarları, erişim belirteçleri, veritabanı parolaları vb.) `.env` dosyaları üzerinden güvenli şekilde yönetilmesini sağlamak ve bu bilgilerin Git depolarına sızmasını önlemektir.

Proje kapsamında:

- `.env.example` şablonu oluşturulmuştur.
- Git commit işlemleri öncesinde çalışan **pre-commit hook** geliştirilmiştir.
- **Gitleaks** entegrasyonu ile otomatik gizli veri taraması yapılmıştır.
- Docker tabanlı Git geçmişi tarama mekanizması kurulmuştur.
- Olası sızıntılar sonrasında uygulanacak **Secret Rotation SOP** hazırlanmıştır.
- OWASP Secrets Management prensipleri doğrultusunda dokümantasyon oluşturulmuştur.

Bu çalışma, **Config Lab** modülünün gereksinimlerini karşılamak amacıyla hazırlanmıştır.

---

# 🎯 Project Objectives / Proje Hedefleri

- Hassas bilgilerin kaynak kodundan ayrıştırılması
- `.env` dosyalarının Git'e eklenmesini engellemek
- Commit öncesi otomatik güvenlik kontrolü yapmak
- Git geçmişindeki sızıntıları tespit etmek
- Secret rotation süreçlerini standartlaştırmak
- Güvenli yazılım geliştirme süreçlerine katkı sağlamak

---

# 🗂 Repository Structure / Repo Yapısı

```text
.
├── README.md
├── ROADMAP.md
├── Dockerfile
├── docker-compose.yml
├── .env.example
├── .gitignore
├── docs/
│   ├── modules/
│   │   └── rotation-sop.md
│   ├── research/
│   └── references/
└── scripts/
    └── pre-commit
```

---

# ⚙️ Technologies Used / Kullanılan Teknolojiler

| Technology | Purpose |
|------------|---------|
| Git | Version Control |
| Gitleaks | Secret Detection |
| Bash | Automation Scripts |
| Docker | Portable Scanning Environment |
| Docker Compose | Container Management |
| Markdown | Documentation |
| OWASP Guidelines | Security Best Practices |

---

# 🚀 Getting Started / Kurulum

## 1. Repository'yi Klonlayın

```bash
git clone https://github.com/safahbo/Guvenli-Web-Gelistirme-Final.git
cd Guvenli-Web-Gelistirme-Final
```

## 2. Environment Dosyasını Oluşturun

```bash
cp .env.example .env
```

## 3. Git Hook'u Kurun

```bash
cp scripts/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

## 4. Docker Servislerini Başlatın

```bash
docker-compose up -d
```

## 5. Sistemi Doğrulayın

Örnek bir secret içeren dosya oluşturarak commit etmeyi deneyin. Pre-commit hook işlemi durdurmalı ve uyarı vermelidir.

---

# 🔐 Security Workflow / Güvenlik Akışı

```text
Developer
    │
    ▼
Git Commit
    │
    ▼
Pre-Commit Hook
    │
    ▼
Gitleaks Scan
    │
 ┌──┴──┐
 │     │
 ▼     ▼
PASS  FAIL
 │      │
 ▼      ▼
Commit  Block Commit
```

---

# 🧪 Example Environment Template

`.env.example`

```env
APP_NAME=SecureWebApp
APP_ENV=development
APP_PORT=8080

DB_HOST=localhost
DB_PORT=5432
DB_NAME=appdb
DB_USER=username
DB_PASSWORD=change_me

JWT_SECRET=replace_with_secure_secret
API_KEY=replace_with_api_key
```

---

# 🛡 Pre-Commit Secret Scanning

Örnek pre-commit hook:

```bash
#!/bin/bash

echo "Running Gitleaks Scan..."

gitleaks detect \
  --source . \
  --no-banner \
  --redact

if [ $? -ne 0 ]; then
  echo "Secret detected. Commit blocked."
  exit 1
fi

echo "No secrets found."
exit 0
```

---

# 🐳 Docker-Based History Scan

Git geçmişindeki olası sızıntıları tespit etmek için:

```bash
docker run --rm \
-v $(pwd):/repo \
zricethezav/gitleaks:latest \
detect \
--source=/repo \
--redact
```

Tüm commit geçmişinin taranması:

```bash
docker run --rm \
-v $(pwd):/repo \
zricethezav/gitleaks:latest \
detect \
--source=/repo \
--log-opts="--all"
```

---

# 🔄 Secret Rotation Procedure

Bir secret'ın sızdırıldığından şüphelenildiğinde:

1. Secret'ı derhal iptal et
2. Yeni secret üret
3. İlgili servisleri güncelle
4. Erişim kayıtlarını incele
5. Olayı dokümante et
6. Git geçmişini temizle
7. Güvenlik taramalarını yeniden çalıştır

Detaylı prosedür:

```text
docs/modules/rotation-sop.md
```

---

# 📊 Deliverables / Teslimler

| Deliverable | Status |
|------------|--------|
| .env.example Template | ✅ Completed |
| .gitignore Configuration | ✅ Completed |
| Gitleaks Integration | ✅ Completed |
| Pre-Commit Hook | ✅ Completed |
| Docker Scan Environment | ✅ Completed |
| Git History Scan Methodology | ✅ Completed |
| Secret Rotation SOP | ✅ Completed |
| Documentation | ✅ Completed |

---

# 📈 Learning Outcomes / Kazanımlar

Bu proje sonunda:

- Secret Management kavramı öğrenildi.
- Git tabanlı güvenlik riskleri analiz edildi.
- OWASP güvenlik standartları incelendi.
- DevSecOps yaklaşımı uygulandı.
- Güvenli yapılandırma yönetimi gerçekleştirildi.
- Otomatik güvenlik kontrolleri geliştirildi.

---

# 📚 Documentation / Belgeleme

## Main Documents

- `README.md`
- `ROADMAP.md`
- `docs/modules/rotation-sop.md`

## Research Notes

```text
docs/research/
```

## References

```text
docs/references/
```

---

# 🔗 References / Kaynaklar

### Gitleaks

https://github.com/gitleaks/gitleaks

### OWASP Secrets Management Cheat Sheet

https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html

### The Twelve-Factor App

https://12factor.net/config

### Git Hooks Documentation

https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks

### Docker Documentation

https://docs.docker.com

---

# 📝 License

This repository was created for educational purposes as part of the **BGT208 – Secure Web Development** course at **Istinye University**.

All content is intended for academic use only.

---

<div align="center">

**BGT208 - Secure Web Development Final Project**

**Env Secrets Management & Git Leak Prevention Pipeline**

Spring 2025-2026

</div>
````
