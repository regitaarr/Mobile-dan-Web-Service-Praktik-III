import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Navigation',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage ({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    // Reset nama pengguna dan kata sandi saat logout
    _usernameController.clear();
    _passwordController.clear();

    // Kembali ke login page
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 10),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView( // Menggunakan SingleChildScrollView
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
              ),
              // Teks Login
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              // Input Username
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  ),
                  style: const TextStyle(fontSize: 20), // Memperbesar teks
                ),
              ),
              const SizedBox(height: 20),

              // TextField Password
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  ),
                  style: const TextStyle(fontSize: 20), // Memperbesar teks
                ),
              ),
              // "Forgot Password" di sebelah kanan dengan warna biru
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue, fontSize: 20), // Mengubah warna menjadi biru
                  ),
                ),
              ),
              // Tombol Login dengan warna kuning, teks italic hitam dan panjang sesuai keinginan
              const SizedBox(height: 15),
              SizedBox(
                width: 250, // Panjang tombol sesuai keinginan
                height: 50,  // Tinggi tombol tetap 50
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Mengubah warna tombol menjadi kuning
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white, // Warna teks menjadi hitam
                      fontWeight: FontWeight.bold,
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
                  // Register action
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.blue, fontSize: 20), // Mengubah warna menjadi biru
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
  final String username;
  final VoidCallback onLogout; // Callback for logout

  const DashboardPage({required this.username, required this.onLogout, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 15,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView( // Menambahkan SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person, size: 40),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo, $username',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const Text(
                            'Itadakimasu.',
                            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: onLogout, // Perform logout
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      'Log out',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Centering kedai.png
              Center(
                child: Image.asset('assets/images/kedai.png', height: 260, fit: BoxFit.fill),
              ),

              const SizedBox(height: 20),

              // Menambahkan text "Our Menu" ditengah
              const Center(
                child: Text(
                  '-- Our Menu --',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
                    child: Image.asset('assets/images/udon.png', fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ramen Udon', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Rp34.000', style: TextStyle(fontSize: 20)),
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
                    child: Image.asset('assets/images/kurume.png', fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kurume Ramen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Rp45.000', style: TextStyle(fontSize: 20)),
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
                    child: Image.asset('assets/images/shoyu.png', fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shoyu Ramen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Rp48.500', style: TextStyle(fontSize: 20)),
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
                    child: Image.asset('assets/images/spicy.png', fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Spicy Ramen', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Rp50.000', style: TextStyle(fontSize: 20)),
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
