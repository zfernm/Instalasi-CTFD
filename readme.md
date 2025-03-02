# Instalasi CTFD & Netcat dengan Docker

## Deskripsi
Script ini digunakan untuk menginstal CTFd (Capture The Flag) dan Netcat pada VPS menggunakan Docker. Anda dapat memilih salah satu dari dua opsi instalasi:
1. **Instalasi CTFd** (Platform CTF berbasis web)
2. **Instalasi Netcat** (Untuk komunikasi jaringan berbasis terminal)

## Persyaratan
- Sistem operasi berbasis **Linux** (Ubuntu atau Debian direkomendasikan)
- Hak akses **root** atau **sudo**
- **Docker** dan **Docker Compose**

## Cara Menggunakan
1. Clone repository ini dengan perintah:
   ```bash
   git clone git@github.com:zfernm/Instalasi-CTFD.git
   ```
2. Masuk ke direktori hasil clone:
   ```bash
   cd Instalasi-CTFD
   ```
3. Berikan izin eksekusi pada script instalasi:
   ```bash
   chmod +x ctfd.sh
   ```
4. Jalankan script:
   ```bash
   ./ctfd.sh
   ```

---

## Penjelasan Perintah dalam Script

### **1. Update Sistem dan Instalasi Dependensi**
```bash
sudo apt-get update
```
> Memperbarui daftar paket agar sistem dapat mengunduh versi terbaru dari repositori resmi.

```bash
sudo apt-get install -y ca-certificates curl gnupg
```
> Menginstal paket penting:
> - **ca-certificates**: Memastikan sertifikat SSL valid untuk komunikasi yang aman.
> - **curl**: Alat untuk mengunduh data dari URL.
> - **gnupg**: Digunakan untuk mengelola kunci kriptografi.

---

### **2. Instalasi Docker dan Docker Compose**
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
> Mengunduh dan menyimpan kunci GPG resmi dari Docker untuk memastikan keamanan repositori.

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
> Menambahkan repositori Docker ke dalam daftar sumber paket sistem.

```bash
sudo apt-get update
```
> Memperbarui daftar paket agar sistem mengenali paket Docker yang baru ditambahkan.

```bash
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
> Menginstal **Docker Engine** dan **Docker Compose** untuk menjalankan kontainer.

---

### **3. Verifikasi Instalasi Docker**
```bash
docker version
```
> Menampilkan versi Docker yang telah terinstal.

```bash
docker compose version
```
> Menampilkan versi Docker Compose.

---

### **4. Instalasi dan Menjalankan CTFd**
```bash
git clone https://github.com/CTFd/CTFd.git
```
> Mengunduh source code CTFd dari GitHub.

```bash
cd CTFd
```
> Masuk ke direktori CTFd.

```bash
docker compose up -d
```
> Menjalankan CTFd dalam mode **detached** (background), sehingga tidak mengganggu terminal.

```bash
docker compose up -d --build
```
> **Menjalankan ulang CTFd** dengan **build ulang** image Docker, berguna setelah mengedit konfigurasi atau file sumber.

---

### **5. Perintah Tambahan untuk Mengelola Docker**
```bash
docker ps
```
> Menampilkan daftar kontainer yang sedang berjalan.

```bash
docker ps -a
```
> Menampilkan semua kontainer, baik yang berjalan maupun yang sudah berhenti.

```bash
docker compose restart
```
> **Merestart** semua layanan dalam file `docker-compose.yml`.

```bash
docker compose down
```
> **Menghentikan dan menghapus** semua kontainer yang berjalan menggunakan Docker Compose.

---

## Akses CTFd
Setelah instalasi berhasil, Anda bisa mengakses CTFd melalui browser dengan membuka URL:
```bash
http://localhost:8000/
```
Jika dijalankan di server, gunakan alamat IP server Anda:
```bash
http://<IP_SERVER>:8000/
```

---

## Output


![Tampilan_Terminal_Instalasi_CTFD](<Tampilan_Terminal_Instalasi_CTFD.png>)
![Tampilan Browser_CTFD](<Tampilan Browser_CTFD.png>)


---

## Sosial Media
[LINKEDIN](https://www.linkedin.com/in/samuel-hamonangan-s-099604255/)
