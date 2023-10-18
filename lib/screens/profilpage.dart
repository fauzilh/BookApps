import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/bg3.jpg', //gambar latar belakang
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Tombol Kembali
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 16),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back, // Ikon "Back"
                          size: 40,
                          color: Colors.redAccent, // Warna ikon
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Kembali ke halaman sebelumnya
                        },
                      ),
                    ),
                  ),

                  // Gambar Profil (Dalam lingkaran)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: ClipOval(
                        child: Image.asset(
                          'images/profil.JPG', //  gambar profil
                          width: 250, //  lebar gambar
                          height: 250, //  tinggi gambar
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // Informasi Profil
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Nama
                        Center(
                          child: Text(
                            'Fauzil Hidayatullah',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Warna teks
                            ),
                          ),
                        ),

                        SizedBox(height: 8),

                        // Email
                        Center(
                          child: Text(
                            'fauzilhidayat07@gmail.com',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black, // Warna teks
                            ),
                          ),
                        ),

                        SizedBox(height: 8),

                        // Nomor Telepon
                        Center(
                          child: Text(
                            'Nomor Telepon: 081333893469',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black, // Warna teks
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
