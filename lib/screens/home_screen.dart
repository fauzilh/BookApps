import 'package:books/screens/book_detail_screen.dart';
import 'package:books/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg3.jpg"), // Gambar latar belakang
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                color: Colors.transparent, // latar belakang transparan
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            //
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 24,
                            //  ikon profil
                            child: Icon(
                              Icons.person,
                              color: Colors.blue,
                              size: 36,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Hello',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Find your dream book here',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),

              // Daftar Buku Horizontal
              Container(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
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
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 160,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(books[index].imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              books[index].title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
              ),
              SizedBox(height: 20),

              // Kategori Buku
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Kategori Buku',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),

              // Daftar Kategori Buku
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCategoryCard('Drama', Colors.redAccent),
                    buildCategoryCard('Adventure', Colors.green),
                    buildCategoryCard('Fiksi', Colors.blue),
                    buildCategoryCard('Misteri', Colors.purple),
                    buildCategoryCard('Romantis', Colors.pink),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Daftar Buku Vertical
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Buku Populer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Daftar Buku Vertical
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      // Navigasi ke halaman detail buku dengan parameter buku
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailPage(books[index]),
                        ),
                      );
                    },
                    leading: Image.asset(
                      books[index].imagePath,
                      width: 100,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                    title: Text(books[index].title),
                    subtitle: Text('Tere Liye'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      //
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget buildCategoryCard(String title, Color color) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Chip(
        label: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: color,
        elevation: 4,
        padding: EdgeInsets.all(8),
      ),
    );
  }
}

class Book {
  final String imagePath;
  final String title;
  final double rating;
  final String category;

  Book(this.imagePath, this.title, this.rating, this.category);
}
