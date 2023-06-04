function sendMessage() {
  // Mendapatkan teks yang dikirim oleh pengguna
  var message = document.getElementById("chatInputan").value;
  if (message.trim() === "") {
    // Tampilkan pesan kesalahan atau umpan balik kepada pengguna
    alert("Please enter a message.");
    return;
  }

  // Membuat elemen untuk menampilkan pesan pengguna
  var userMessage = document.createElement("div");
  userMessage.classList.add("message", "mine");
  userMessage.innerHTML = `
    <p>${message}<br /><span>${getCurrentTime()}</span></p>
  `;

  // Menambahkan pesan pengguna ke dalam kontainer pesan
  var messageContainer = document.getElementById("messageContainer");
  messageContainer.appendChild(userMessage);

  // Menghapus teks dari input setelah mengirim pesan
  document.getElementById("chatInputan").value = "";
}

// Fungsi untuk mendapatkan waktu saat ini (HH:mm)
function getCurrentTime() {
  var now = new Date();
  var hours = now.getHours().toString().padStart(2, "0");
  var minutes = now.getMinutes().toString().padStart(2, "0");
  return hours + ":" + minutes;
}

var chatInputText = document.getElementById("chatInputan");

// Menambahkan event listener untuk "keydown"
chatInputText.addEventListener("keydown", function (event) {
  // Mengirim pesan jika tombol yang ditekan adalah "Enter" (kode tombol 13)
  if (event.keyCode === 13) {
    event.preventDefault(); // Mencegah aksi default pengiriman formulir
    sendMessage(); // Memanggil fungsi sendMessage() untuk mengirim pesan
  }
});