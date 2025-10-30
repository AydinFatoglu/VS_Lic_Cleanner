# 🧹 VS Lic Cleaner

Visual Studio’nun lisans ve kimlik önbelleğini temizleyip yeniden yapılandırmak için küçük bir PowerShell script’idir.

---

## 🚀 Ne Yapar

- `%LOCALAPPDATA%\.IdentityService` dizinini temizler  
- `%LOCALAPPDATA%\Microsoft\VSCommon\OnlineLicensing` dizinini temizler  
- `%LOCALAPPDATA%\IdentityCache` dizinini temizler  
- `C:\ProgramData\Microsoft\VS\Licensing` sistem lisans dizinini temizler  
- `TokenBroker`, `NgcCtnrSvc` ve `OneAuthService` servislerini yeniden başlatır  
- `devenv.exe` (Visual Studio) süreçlerini kapatır  
- Çalıştırmadan sonra “Visual Studio’yu yönetici olarak açıp oturum açın” mesajı verir

---

## ⚙️ Kullanım

1. Repo’yu klonla:
   ```bash
   git clone https://github.com/AydinFatoglu/VS_Lic_Cleanner.git
   cd VS_Lic_Cleanner
