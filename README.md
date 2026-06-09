<div align="center">
  <a href="https://istinye.edu.tr">
    <img src="docs/assets/istinye-logo.png" alt="Istinye University" width="180"/>
  </a>

# Env Secrets Management & Git Leak Prevention Pipeline

![GitHub](https://img.shields.io/badge/GitHub-Private-red?style=flat-square\&logo=github)
![Language](https://img.shields.io/badge/Language-Bash%20%7C%20Docker-blue?style=flat-square)
![Status](https://img.shields.io/badge/Status-Completed-green?style=flat-square)
![Course](https://img.shields.io/badge/Course-BGT208-purple?style=flat-square)

---

## 🎓 Instructor / Danışman

* **Name:** Keyvan Arasteh
* **GitHub:** https://github.com/keyvanarasteh
* **Email:** [keyvan.arasteh@istinye.edu.tr](mailto:keyvan.arasteh@istinye.edu.tr)
* **LinkedIn:** https://www.linkedin.com/in/keyvanarasteh/
* **Website:** https://qline.tech

---

## 👤 Student / Öğrenci

* **Name:** Safa Hacıbayramoğlu
* **Student ID:** `2420191014`

---

## 📚 Course Information

* **Course Name:** Secure Web Development / Güvenli Web Yazılımı Geliştirme
* **Course Code:** BGT208
* **Credits:** 3 ECTS
* **Semester:** 2025-2026 Spring
* **University:** Istinye University

---

## 📋 Project Overview

Bu proje, web uygulamalarında kullanılan hassas bilgilerin (.env dosyaları, API anahtarları, erişim belirteçleri ve veritabanı parolaları) Git depolarına sızmasını önlemek amacıyla geliştirilmiştir.

Proje kapsamında:

* `.env.example` oluşturuldu.
* `.gitignore` yapılandırıldı.
* Gitleaks entegrasyonu yapıldı.
* Pre-commit hook geliştirildi.
* Docker tabanlı geçmiş tarama sistemi kuruldu.
* Secret Rotation SOP hazırlandı.

---

## 🎯 Objectives

* Secret management uygulamak
* Git sızıntılarını önlemek
* Commit öncesi güvenlik kontrolü yapmak
* Git geçmişini taramak
* Secret rotation prosedürü oluşturmak

---

## 🗂 Repository Structure

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
│   └── research/
│       └── test-evidence.md
└── scripts/
└── pre-commit
```

## 🚀 Installation

### Clone Repository

```bash
git clone https://github.com/safahbo/Guvenli-Web-Gelistirme-Final.git
cd Guvenli-Web-Gelistirme-Final
```

### Create Environment File

```bash
cp .env.example .env
```

### Install Git Hook

```bash
cp scripts/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

### Start Docker Environment

```bash
docker-compose up -d
```

---

## 🔐 Security Workflow

Developer → Git Commit → Pre-Commit Hook → Gitleaks Scan

* Secret bulunursa → Commit engellenir
* Secret bulunmazsa → Commit tamamlanır

---

## 🧪 Example .env Template

```env
APP_NAME=SecureWebApp
APP_ENV=development

DB_HOST=localhost
DB_PORT=5432
DB_NAME=appdb

DB_USER=username
DB_PASSWORD=change_me

JWT_SECRET=replace_me
API_KEY=replace_me
```

---

## 🛡 Pre-Commit Hook

```bash
#!/bin/bash

gitleaks detect \
  --source . \
  --no-banner \
  --redact

if [ $? -ne 0 ]; then
  echo "Secret detected."
  exit 1
fi

exit 0
```

---

## 🐳 Git History Scan

```bash
docker run --rm \
-v $(pwd):/repo \
zricethezav/gitleaks:latest \
detect \
--source=/repo \
--log-opts="--all"
```

---

## 🔄 Secret Rotation Procedure

1. Secret'ı iptal et
2. Yeni secret oluştur
3. Sistemleri güncelle
4. Logları incele
5. Olayı kayıt altına al
6. Git geçmişini temizle
7. Taramaları yeniden çalıştır

Detaylar:

`docs/modules/rotation-sop.md`

---

## 📊 Deliverables

* ✅ .env.example
* ✅ .gitignore
* ✅ Gitleaks Integration
* ✅ Pre-Commit Hook
* ✅ Docker Scan Environment
* ✅ Git History Scan
* ✅ Rotation SOP
* ✅ Documentation

---

## 📚 References

* https://github.com/gitleaks/gitleaks
* https://12factor.net/config
* https://docs.docker.com
* https://git-scm.com/docs/githooks
* https://cheatsheetseries.owasp.org

---

## 📝 License

Created for educational purposes as part of the BGT208 Secure Web Development course at Istinye University.
