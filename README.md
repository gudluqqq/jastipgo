# Jastip App

Jastip App adalah aplikasi jasa titip berbasis Flutter dan Firebase yang memungkinkan pengguna menawarkan layanan pembelian makanan dan antar-jemput untuk mahasiswa di sekitar Tembalang.

## 🚀 Fitur Utama
- **Autentikasi Pengguna** (Login & Register dengan Firebase Authentication)
- **Tambah dan Kelola Jasa Titipan**
- **Pelanggan dapat melihat & memesan layanan**
- **Sistem notifikasi pesanan masuk ke penyedia layanan**
- **Riwayat Transaksi**
- **Tanpa fitur maps & komunikasi dilakukan di luar aplikasi**

## 🛠️ Teknologi yang Digunakan
- **Flutter** (Frontend)
- **Firebase Authentication** (Login/Registrasi)
- **Cloud Firestore** (Database layanan & transaksi)
- **Supabase** (Autentikasi tambahan jika diperlukan)

## 📦 Instalasi & Setup
### 1️⃣ Clone Repository
```sh
git clone https://github.com/username/jastip_app.git
cd jastip_app
```

### 2️⃣ Setup Firebase
1. Buka [Firebase Console](https://console.firebase.google.com/)
2. Buat proyek baru
3. Tambahkan aplikasi Android & Web
4. Download `google-services.json` dan letakkan di `android/app/`
5. Jalankan konfigurasi Firebase di Flutter:
   ```sh
   flutterfire configure
   ```

### 3️⃣ Install Dependencies
```sh
flutter pub get
```

### 4️⃣ Jalankan Aplikasi
```sh
flutter run
```

## 📂 Struktur Proyek
```
jastip_app/
│-- lib/
│   │-- main.dart  # Entry point aplikasi
│   │-- screens/
│   │   │-- login_page.dart
│   │   │-- home_page.dart
│   │-- models/
│   │-- services/
│-- android/
│-- ios/
│-- web/
│-- pubspec.yaml
```

## 📝 Roadmap Pengembangan
- [x] Setup Flutter & Firebase
- [x] Autentikasi Pengguna
- [ ] UI/UX Halaman Utama
- [ ] CRUD Jasa Titipan
- [ ] Notifikasi Pesanan
- [ ] Integrasi Pembayaran (opsional)

## 🤝 Kontribusi
Jika ingin berkontribusi, silakan fork repository ini dan buat pull request!

## 📄 Lisensi
MIT License

---

💡 **Kontak Developer:**
[GitHub](https://github.com/username) | [Email](mailto:email@example.com)

