# Demo video
demo: https://youtu.be/r6Of7rTbFxA?si=jbGBjN4-FFTSAOrc

# Zein Wallet
Zein Wallet adalah aplikasi dompet digital berbasis Flutter yang terintegrasi dengan **Zein Clothes Marketplace**. Aplikasi ini memungkinkan pengguna mengelola saldo secara praktis untuk melakukan transaksi pada marketplace pakaian, dengan pembaruan data secara **real-time** menggunakan Firebase.

---

## Tampilan Aplikasi

### Login

<img width="486" height="636" alt="Screenshot 2026-07-03 164729" src="https://github.com/user-attachments/assets/4f55ec2f-7cd3-4b70-9c03-4d41e5872bca" />


### Home

<img width="488" height="612" alt="Screenshot 2026-07-03 164814" src="https://github.com/user-attachments/assets/cf96e59b-88da-4519-9270-6a1692ce2506" />


### Top Up

<img width="490" height="638" alt="Screenshot 2026-07-03 164844" src="https://github.com/user-attachments/assets/aac9115c-1769-4ce9-b51a-8f66fd352ce7" />


### Riwayat Transaksi

<img width="490" height="559" alt="Screenshot 2026-07-03 164918" src="https://github.com/user-attachments/assets/9ce54c4e-e02b-4646-bc34-433141ef3c31" />


---

## Fitur Utama

### Login Terintegrasi

* Login menggunakan akun yang sama dengan **Zein Clothes Marketplace**.
* Menggunakan Firebase Authentication.
* Data pengguna langsung tersinkronisasi dengan marketplace.

### Top Up Saldo

* Menambahkan saldo wallet dengan nominal yang diinginkan.
* Saldo akan diperbarui secara otomatis setelah proses berhasil.
* Data disimpan pada Cloud Firestore.

### Saldo Real-Time

* Menampilkan saldo pengguna secara langsung (real-time).
* Perubahan saldo akan muncul otomatis tanpa perlu me-refresh aplikasi.

### Riwayat Transaksi

* Menampilkan seluruh riwayat transaksi pengguna.
* Riwayat mencakup transaksi Top Up maupun pembayaran pada Zein Clothes Marketplace.
* Diurutkan berdasarkan waktu transaksi terbaru.

---

## Teknologi yang Digunakan

* Flutter
* Firebase Authentication
* Cloud Firestore
* Firebase Core
* Dart

---

## Integrasi dengan Zein Clothes Marketplace

Zein Wallet menggunakan database Firebase yang sama dengan **Zein Clothes Marketplace**, sehingga:

* Satu akun dapat digunakan untuk kedua aplikasi.
* Saldo wallet dapat digunakan sebagai metode pembayaran di marketplace.
* Saldo dan riwayat transaksi diperbarui secara otomatis (real-time).

---

## Alur Penggunaan

1. Login menggunakan akun Zein Clothes.
2. Melihat saldo wallet secara real-time.
3. Melakukan Top Up saldo.
4. Menggunakan saldo untuk bertransaksi di Zein Clothes Marketplace.
5. Melihat riwayat transaksi kapan saja.

---

## Struktur Fitur

* Authentication (Login)
* Wallet Balance
* Top Up Balance
* Transaction History
* Firebase Integration
* Real-Time Synchronization

---

## Pengembang

**Zein Wallet** dikembangkan sebagai bagian dari ekosistem **Zein Clothes Marketplace** untuk memberikan pengalaman pembayaran digital yang mudah, cepat, dan terintegrasi.
