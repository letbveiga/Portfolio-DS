import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  dynamic book;
  List<dynamic> books = [
    {
      "id": 1,
      "title": "House of Leaves",
      "author": "Mark Z. Danielewski",
      "genre": "Horror/Experimental",
      "description": "A family discovers their house is impossibly larger on the inside than the outside. The book itself is a labyrinth of footnotes and formatting madness.",
      "coverImage": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1403889034i/24800.jpg",
    },
    {
      "id": 2,
      "title": "Geek Love",
      "author": "Katherine Dunn",
      "genre": "Dark Fiction",
      "description": "A carnival couple breeds their own freak show by experimenting with drugs during pregnancy. Winner of the 'Most Fucked Up Family' award.",
      "coverImage": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1636594691i/13872.jpg",
    },
    {
      "id": 3,
      "title": "The Third Policeman",
      "author": "Flann O'Brien",
      "genre": "Absurdist Fiction",
      "description": "A man gets caught in a surreal hellscape where policemen obsess over bicycles and atomic theory. LSD not required but highly recommended.",
      "coverImage": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1634288448i/27208.jpg",
    },
    {
      "id": 4,
      "title": "The Raw Shark Texts",
      "author": "Steven Hall",
      "genre": "Conceptual Fiction",
      "description": "A man hunted by a conceptual shark made of words. Like Jaws meets Wittgenstein. Contains actual flipbook shark attacks in the margins.",
      "coverImage": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1405099268i/144800.jpg",
    },
    {
      "id": 5,
      "title": "Tainaron: Mail from Another City",
      "author": "Leena Krohn",
      "genre": "Weird Fiction",
      "description": "Letters from a city of giant insects. Kafka's Metamorphosis if Gregor had actually enjoyed being a bug.",
      "coverImage": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1183510480i/1428609.jpg",
    },
    {
      "id": 6,
      "title": "The Hearing Trumpet",
      "author": "Leonora Carrington",
      "genre": "Surrealism",
      "description": "A 92-year-old woman gets sent to a bizarre retirement home run by a cult worshipping the Goddess Venus. Salvador Dalí approved.",
      "coverImage": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1336273089i/46987.jpg",
    },
    {
      "id": 7,
      "title": "The Master and Margarita",
      "author": "Mikhail Bulgakov",
      "genre": "Satirical Fantasy",
      "description": "The Devil visits Soviet Moscow with a talking gun-toting cat named Behemoth. Features the best Satanic ball scene in literature.",
      "coverImage": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1327867963i/117833.jpg",
    },
    {
      "id": 8,
      "title": "The Street of Crocodiles",
      "author": "Bruno Schulz",
      "genre": "Magical Realism",
      "description": "A childhood memoir where tailors create living simulacra of people and fathers slowly turn into crabs. Yes, really.",
      "coverImage": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1739424449i/244261.jpg",
    },
    {
      "id": 9,
      "title": "The Vorrh",
      "author": "B. Catling",
      "genre": "Fantasy/Historical",
      "description": "A sentient forest eats souls, a cyclops raised by robots goes on a quest, and famous photographer Eadweard Muybridge shows up for some reason.",
      "coverImage": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1349600836i/16071377.jpg",
    },
    {
      "id": 10,
      "title": "The Futurological Congress",
      "author": "Stanisław Lem",
      "genre": "Sci-Fi/Satire",
      "description": "A scientist attends a conference where reality keeps dissolving due to mass hallucinogens. Think Inception on bad acid at a philosophy convention.",
      "coverImage": "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1387704942i/733473.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  void _setSelectedBook(int? id) {
    setState(() {
      book = books.firstWhere((item) => item['id'] == id, orElse: () => null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LISTVIEW CUSTOMIZADO',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'LISTVIEW DE LIVROS',
            style: TextStyle(color: Colors.white70)
          ),
          backgroundColor: Colors.black
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = books[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: index % 3 == 0
                            ? Colors.deepOrange
                            : index % 3 == 1
                                ? Colors.amber
                                : Colors.teal,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () => _setSelectedBook(item['id'] as int),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item['title'],
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis, // Para textos longos
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (book != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.primaries[10] ,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    book['coverImage'],
                                    width: 120.0, // Ajuste o tamanho da imagem
                                    height: 180.0, // Ajuste o tamanho da imagem
                                    fit: BoxFit.contain, // A imagem será contida sem distorcer
                                  ),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Title: ${book['title']}',
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Author: ',
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            '${book['author']}',
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Genre: ',
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            '${book['genre']}',
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Description:',
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '${book['description']}',
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}