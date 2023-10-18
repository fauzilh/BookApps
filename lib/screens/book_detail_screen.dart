import 'package:books/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  BookDetailPage(this.book);

  // Daftar buku yang akan ditampilkan di GridView
  final List<Book> books = [
    Book('images/book1.jpg', 'Tentang Kamu', 4.5, 'Romantis'),
    Book('images/book2.jpg', 'Rembulan Tenggelam Di Wajahmu', 4.0, 'Romantis'),
    Book('images/book3.jpg', 'Bumi', 4.2, 'Drama'),
    Book('images/book4.jpg', 'Hujan', 4.7, 'Sejarah'),
    Book('images/book5.jpg', 'Negeri Para Bedebah', 3.9, 'Adventure'),
    Book('images/book6.jpg', 'Pulang Pergi', 4.1, 'Fiksi'),
    //
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tombol Kembali
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 50,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

            // Gambar Sampul
            Center(
              child: Image.asset(
                book.imagePath,
                width: 200,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),

            // Judul Buku
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                book.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Rating Buku
            Padding(
              padding: const EdgeInsets.all(3.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 1),
                  Text(
                    book.rating.toString(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            // Deskripsi Buku
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                ' Tere Liye memiliki pembawaan cerita yang sangat mengalir. Tidak hanya itu, tingkat imajinasinya juga luar biasa sehingga membuat pembaca susah untuk beralih ke buku lain. Tak heran banyak bukunya yang masuk ke dalam barisan best seller. Beberapa judul bahkan sudah diadaptasi menjadi film, salah satunya Hafalan Shalat Delisa.Meskipun tulisannya banyak diapresiasi, Tere Liye mengaku bahwa menulis hanyalah hobi dan profesi sebenarnya adalah akuntan.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            //
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Buku Terkait',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Jumlah kolom dalam GridView
                childAspectRatio: 0.5, // Rasio lebar dan tinggi setiap item
              ),
              itemCount: books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman detail buku dengan parameter buku
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetailPage(books[index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(books[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          books[index].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.yellow,
                            ),
                            Text(
                              books[index].rating.toString(),
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
