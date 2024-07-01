# Deskripsi

Repository ini berisi skrip-skrip shell yang digunakan untuk berinteraksi dengan berbagai API dari layanan AI seperti OpenAI, Gemini, dan Groq. Skrip-skrip ini memungkinkan pengguna untuk mengajukan pertanyaan dan mendapatkan jawaban dari model AI yang berbeda.

# Kegunaan

Skrip-skrip ini berguna untuk:
- Mengajukan pertanyaan ke model AI dan mendapatkan jawaban yang relevan.
- Mengotomatisasi proses interaksi dengan API AI.
- Membandingkan hasil dari berbagai model AI.

# Fungsi

Berikut adalah fungsi dari masing-masing skrip:

1. **gpt.sh**: Skrip ini digunakan untuk berinteraksi dengan API OpenAI. Fungsi `ask` dalam skrip ini mengirimkan pertanyaan ke model `text-davinci-003` dan mengembalikan jawaban yang dihasilkan.
   - Referensi kode: `shell:gpt.sh` (startLine: 7, endLine: 45)

2. **gemini.sh**: Skrip ini digunakan untuk berinteraksi dengan API Gemini. Fungsi `askgem` mengirimkan pertanyaan ke model `gemini-1.5-pro` dan mengembalikan konten yang dihasilkan.
   - Referensi kode: `shell:gemini.sh` (startLine: 7, endLine: 38)

3. **gorq.sh**: Skrip ini digunakan untuk berinteraksi dengan API Groq. Fungsi `askgroq` mengirimkan pertanyaan ke model `llama3-8b-8192` dan mengembalikan konten yang dihasilkan.
   - Referensi kode: `shell:gorq.sh` (startLine: 7, endLine: 34)

# Bagaimana Menjalankan

Untuk menjalankan skrip-skrip ini, ikuti langkah-langkah berikut:

1. **Persiapan**:
   - Pastikan Anda memiliki `curl` dan `jq` terinstal di sistem Anda.
   - Ganti placeholder `isi api key nya` dengan API key yang valid untuk masing-masing layanan.

2. **Menjalankan Skrip**:
   - Untuk OpenAI:
     ```sh
     ./gpt.sh "Pertanyaan Anda di sini"
     ```
   - Untuk Gemini:
     ```sh
     ./gemini.sh "Pertanyaan Anda di sini"
     ```
   - Untuk Groq:
     ```sh
     ./gorq.sh "Pertanyaan Anda di sini"
     ```

# Kesimpulan

Repository ini menyediakan skrip-skrip yang memudahkan interaksi dengan berbagai API AI. Dengan menggunakan skrip ini, Anda dapat dengan mudah mengajukan pertanyaan dan mendapatkan jawaban dari model AI yang berbeda, serta membandingkan hasil yang diberikan oleh masing-masing model. Pastikan untuk mengganti API key dengan yang valid sebelum menjalankan skrip.