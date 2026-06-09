# Standard Operating Procedure (SOP): Secret Rotation

## 1. Tespit ve Doğrulama
- Sızan veya süresi dolan credential tespit edilir.
- İlgili API/Servis paneline giriş yapılır.

## 2. İptal Etme (Revocation)
- Eski API anahtarı veya parola derhal geçersiz kılınır (Revoke/Delete).
- Eğer aktif kullanıcılar varsa, kesintiyi önlemek için "Grace Period" tanınan ikinci bir anahtar üretilip sistem ona geçirilir, ardından eski anahtar silinir.

## 3. Yenileme (Generation)
- Yeni anahtar veya parola üretilir.
- Parolalar minimum 32 karakter, rastgele ve kompleks olmalıdır.

## 4. Dağıtım (Deployment)
- Yeni değerler sadece `.env` dosyalarına, vault sistemine (örn. HashiCorp Vault, AWS Secrets Manager) veya CI/CD ortam değişkenlerine eklenir.
- Hardcoded olarak kaynak koduna **kesinlikle** eklenmez.

## 5. Doğrulama ve Loglama
- Sistemlerin yeni credential'lar ile sorunsuz çalıştığı test edilir.
- Rotasyon işlemi tarih, saat ve işlemi yapan kişi bilgisiyle loglanır.
