import 'package:books/screens/book_detail_screen.dart';
import 'package:books/screens/home_screen.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  final List<Book> books = [
    Book('images/book1.jpg', 'Tentang Kamu', 4.5, 'Romantis'),
    Book('images/book2.jpg', 'Rembulan Tenggelam Di Wajahmu', 4.0, 'Romantis'),
    Book('images/book3.jpg', 'Bumi', 4.2, 'Drama'),
    Book('images/book4.jpg', 'Hujan', 4.7, 'Misteri'),
    Book('images/book5.jpg', 'Negeri Para Bedebah', 3.9, 'Adventure'),
    Book('images/book6.jpg', 'Pulang Pergi', 4.1, 'Fiksi'),
    Book('images/book7.jpg', 'Pulang', 4.0, 'Fiksi'),
    Book('images/book8.jpg', 'Si Anak Savana', 3.9, 'Fiksi'),
    Book('images/book9.jpg', 'Negeri Di Ujung Tanduk', 4.1, 'Drama'),
    Book('images/book10.jpg', 'Ayahku Bukan Pembohong', 4.0, 'Drama'),
    Book('images/book11.jpg', 'Rindu', 4.1, 'Romantis'),
    Book('images/book12.jpg', 'Daun Yang Jatuh', 3.5, 'Misteri'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg3.jpg'), // Latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Find Books',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailPage(books[index]),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(books[index].imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                books[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${books[index].category}', // kategori buku
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
          ],
        ),
      ),
    );
  }
}
