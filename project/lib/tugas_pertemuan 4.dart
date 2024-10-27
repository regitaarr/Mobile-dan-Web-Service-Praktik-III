import 'dart:convert'; // Mengimpor pustaka untuk bekerja dengan JSON
import 'package:http/http.dart'
    as http; // Mengimpor paket http untuk melakukan permintaan HTTP
import 'package:flutter/material.dart'; // Mengimpor paket Flutter untuk membangun antarmuka pengguna

void main() {
  runApp(
      const MyApp()); // Menjalankan aplikasi dengan widget MyApp sebagai root
}

class MyApp extends StatelessWidget {
  // Kelas MyApp adalah widget Stateless yang menjadi root aplikasi
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Metode ini membangun antarmuka pengguna
    return MaterialApp(
      title: 'Login Navigation', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.purple, // Skema warna utama aplikasi
      ),
      debugShowCheckedModeBanner: false, // Menonaktifkan banner debug
      home: const LoginPage(), // Menetapkan halaman awal aplikasi ke LoginPage
    );
  }
}

class LoginPage extends StatefulWidget {
  // Kelas LoginPage adalah widget Stateful untuk menangani status
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() =>
      _LoginPageState(); // Mengembalikan instance dari _LoginPageState
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController =
      TextEditingController(); // Mengontrol input username
  final TextEditingController _passwordController =
      TextEditingController(); // Mengontrol input password

  void _login() async {
    // Metode untuk menangani proses login
    const String apiUrl =
        "http://10.0.2.2/mwsp/login.php"; // URL endpoint API login

    final response = await http.post(
      // Mengirim permintaan POST ke API
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type':
            'application/json; charset=UTF-8', // Menetapkan header Content-Type
      },
      body: jsonEncode(<String, String>{
        // Mengonversi data input menjadi format JSON
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Memeriksa apakah respons berhasil
      final Map<String, dynamic> responseData =
          json.decode(response.body); // Mengurai respons JSON

      if (responseData['status'] == 'success') {
        // Jika login berhasil
        Navigator.push(
            // Mendorong halaman DashboardPage ke tumpukan navigasi
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(
                  username: _usernameController.text, onLogout: _logout),
            ));
      } else {
        // Jika login gagal
        ScaffoldMessenger.of(context).showSnackBar(
          // Menampilkan pesan kesalahan
          SnackBar(content: Text(responseData['message'])),
        );
      }
    } else {
      // Jika status kode bukan 200
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Terjadi kesalahan pada server!')), // Menampilkan pesan kesalahan server
      );
    }
  }

  void _logout() {
    // Metode untuk menangani proses logout
    _usernameController.clear(); // Menghapus input username
    _passwordController.clear(); // Menghapus input password

    Navigator.pop(context); // Kembali ke halaman login
  }

  @override
  Widget build(BuildContext context) {
    // Metode untuk membangun tampilan halaman login
    return Scaffold(
      appBar: AppBar(toolbarHeight: 10), // Membuat AppBar dengan tinggi 10
      body: Padding(
        padding: const EdgeInsets.all(
            30.0), // Menetapkan padding di sekitar isi halaman
        child: SingleChildScrollView(
          // Memungkinkan scroll jika konten melebihi ukuran layar
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Mengatur konten agar berada di tengah
            children: [
              SizedBox(
                height: 300,
                child: Image.asset('assets/images/logo.png',
                    fit: BoxFit.contain), // Menampilkan logo aplikasi
              ),
              // Teks Login
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold), // Mengatur gaya teks login
                ),
              ),
              const SizedBox(height: 10),
              // Input Username
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller:
                      _usernameController, // Menghubungkan TextField dengan controller username
                  decoration: const InputDecoration(
                    labelText: 'Username', // Label untuk input username
                    border: OutlineInputBorder(), // Border untuk TextField
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 16), // Padding di dalam TextField
                  ),
                  style: const TextStyle(fontSize: 20), // Mengatur ukuran teks
                ),
              ),
              const SizedBox(height: 20),

              // TextField Password
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller:
                      _passwordController, // Menghubungkan TextField dengan controller password
                  obscureText: true, // Mengaburkan teks untuk keamanan
                  decoration: const InputDecoration(
                    labelText: 'Password', // Label untuk input password
                    border: OutlineInputBorder(), // Border untuk TextField
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 16), // Padding di dalam TextField
                  ),
                  style: const TextStyle(fontSize: 20), // Mengatur ukuran teks
                ),
              ),
              // "Forgot Password" di sebelah kanan dengan warna biru
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password action (tindakan ketika "lupa kata sandi" ditekan)
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.blue, // Mengubah warna menjadi biru
                        fontSize: 20), // Mengatur ukuran teks
                  ),
                ),
              ),
              // Tombol Login dengan warna kuning, teks italic hitam dan panjang sesuai keinginan
              const SizedBox(height: 15),
              SizedBox(
                width: 250, // Panjang tombol sesuai keinginan
                height: 50, // Tinggi tombol tetap 50
                child: ElevatedButton(
                  onPressed:
                      _login, // Memanggil fungsi _login saat tombol ditekan
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.red, // Mengubah warna tombol menjadi merah
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white, // Warna teks menjadi putih
                      fontWeight: FontWeight.bold, // Mengatur bobot teks
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              // Spasi di atas dan bawah teks "Or"
              const SizedBox(height: 17), // Spasi di atas
              const Text('Or', style: TextStyle(fontSize: 20)), // Teks "Or"
              // Tombol Register dengan warna biru
              TextButton(
                onPressed: () {
                  // Register action (tindakan ketika tombol register ditekan)
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.blue, // Mengubah warna menjadi biru
                      fontSize: 20), // Mengatur ukuran teks
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  // Kelas DashboardPage adalah widget Stateless untuk menampilkan halaman dashboard
  final String username; // Variabel untuk menyimpan nama pengguna
  final VoidCallback onLogout; // Callback untuk logout

  const DashboardPage(
      {required this.username, required this.onLogout, super.key});

  @override
  Widget build(BuildContext context) {
    // Metode untuk membangun tampilan halaman dashboard
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 15, // Mengatur tinggi toolbar
        automaticallyImplyLeading:
            false, // Menonaktifkan navigasi kembali di AppBar
      ),
      body: SingleChildScrollView(
        // Memungkinkan scroll jika konten melebihi ukuran layar
        child: Padding(
          padding: const EdgeInsets.all(
              16.0), // Menetapkan padding di sekitar isi halaman
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Mengatur alignment konten ke kiri
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Mengatur jarak antar elemen dalam baris
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        // Menampilkan avatar bulat
                        radius: 30, // Mengatur radius avatar
                        child: Icon(Icons.person, size: 40), // Menampilkan ikon
                      ),
                      const SizedBox(width: 15), // Jarak antara avatar dan teks
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Mengatur alignment kolom ke kiri
                        children: [
                          Text(
                            'Halo, $username', // Menampilkan pesan sambutan dengan nama pengguna
                            style: const TextStyle(
                                fontSize: 18), // Mengatur ukuran teks
                          ),
                          const Text(
                            'Itadakimasu.', // Menampilkan teks tambahan
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight
                                    .bold), // Mengatur ukuran dan bobot teks
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed:
                        onLogout, // Memanggil fungsi onLogout saat tombol ditekan
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.red, // Mengubah warna tombol menjadi merah
                    ),
                    child: const Text(
                      'Log out', // Teks tombol logout
                      style: TextStyle(
                        color: Colors.white, // Warna teks menjadi putih
                        fontWeight: FontWeight.bold, // Mengatur bobot teks
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Centering kedai.png
              Center(
                child: Image.asset(
                    'assets/images/kedai.png', // Menampilkan gambar kedai
                    height: 260,
                    fit: BoxFit.fill),
              ),

              const SizedBox(height: 20),

              // Menambahkan text "Our Menu" ditengah
              const Center(
                child: Text(
                  '-- Our Menu --',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold, // Mengatur ukuran dan bobot teks
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Ramen Udon Row
              Row(
                children: [
                  SizedBox(
                    width: 130,
                    height: 130,
                    child: Image.asset(
                        'assets/images/udon.png', // Menampilkan gambar ramen udon
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Mengatur alignment kolom ke kiri
                    children: [
                      Text('Ramen Udon',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold)), // Menampilkan nama menu
                      Text('Rp34.000',
                          style: TextStyle(fontSize: 20)), // Menampilkan harga
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Kurume Ramen Row
              Row(
                children: [
                  SizedBox(
                    width: 130,
                    height: 130,
                    child: Image.asset(
                        'assets/images/kurume.png', // Menampilkan gambar ramen kurume
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Mengatur alignment kolom ke kiri
                    children: [
                      Text('Kurume Ramen',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold)), // Menampilkan nama menu
                      Text('Rp45.000',
                          style: TextStyle(fontSize: 20)), // Menampilkan harga
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Shoyu Ramen Row
              Row(
                children: [
                  SizedBox(
                    width: 130,
                    height: 130,
                    child: Image.asset(
                        'assets/images/shoyu.png', // Menampilkan gambar ramen shoyu
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Mengatur alignment kolom ke kiri
                    children: [
                      Text('Shoyu Ramen',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold)), // Menampilkan nama menu
                      Text('Rp48.500',
                          style: TextStyle(fontSize: 20)), // Menampilkan harga
                    ],
                  ),
                ],
              ),

              // Spicy Ramen Row
              Row(
                children: [
                  SizedBox(
                    width: 130,
                    height: 130,
                    child: Image.asset(
                        'assets/images/spicy.png', // Menampilkan gambar ramen pedas
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Mengatur alignment kolom ke kiri
                    children: [
                      Text('Spicy Ramen',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold)), // Menampilkan nama menu
                      Text('Rp50.000',
                          style: TextStyle(fontSize: 20)), // Menampilkan harga
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
