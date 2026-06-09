# ROADMAP — Env Secrets Management & Git Leak Prevention Pipeline

> Course / Ders: Secure Web Development (BGT208) · Istinye University
> Instructor / Danışman: Keyvan Arasteh

---

## Phase 0 / Faz 0: Understand Before You Build / Yazmadan Önce Anla

- What is the project? Geliştirme ortamındaki hassas verilerin depolara sızmasını engelleyen bir güvenlik hattı.
- How does it work? Pre-commit hook ve gitleaks aracılığıyla commit öncesi tarama yapar.
- What are the inputs/outputs? Girdi: Git commit işlemi. Çıktı: Başarılı commit veya sızıntı tespit edilirse engellenen işlem.
- What tools will I use and why? Bash, Gitleaks, Docker. Hızlı ve doğrudan git entegrasyonu sağladıkları için.

---

## Phase 1 / Faz 1: Research & Investigation / Araştırma ve Keşif

> Folder / Klasör: `docs/research/`

| Topic / Konu | Status / Durum | Notes / Notlar |
|--------------|----------------|----------------|
| Gitleaks regex patterns | ✅ Completed | Varsayılan kurallar test edildi. |
| Pre-commit bash scripting | ✅ Completed | Hook başarıyla Git sistemine entegre edildi. |
| Secret rotation procedures | ✅ Completed | SOP dokümantasyonu hazırlandı. |

---

## Phase 2 / Faz 2: Environment Setup / Ortam Kurulumu

- [x] Isolated lab environment (Docker / VM)
- [x] Tools installed and verified
- [x] `.env.example` created

---

## Phase 3 / Faz 3: Implementation / Uygulama

### Module / Modül: Git Leak Prevention Pipeline

1. Step 1 — `.env.example` referans dosyasının oluşturulması.
2. Step 2 — `gitleaks` dockerize edilerek container ortamında çalıştırılması.
3. Step 3 — `.git/hooks/pre-commit` bash betiğinin yazılması ve yetkilendirilmesi.

---

## Phase 4 / Faz 4: Testing & Reporting / Test ve Raporlama

- [x] Ran tests against target/sample
- [x] Documented all findings with evidence
- [x] Wrote final report (Markdown)

---

## Phase 5 / Faz 5: Delivery / Teslim

- [x] GitHub repository is clean and organized
- [x] README.md complete
- [x] Docker verified (`docker-compose up`)
- [ ] Instructor invited as collaborator → **keyvanarasteh**

---

## What I Learned / Öğrendiklerim

Gitleaks'in false-positive oranlarını düşürmek için özel kurallar yazmanın önemi. Hook'ların sadece yerel çalıştığını, CI/CD pipeline'ında da ikinci bir kontrol katmanı gerektiğini fark ettim.
