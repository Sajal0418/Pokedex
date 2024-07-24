import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'DetailPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List of image paths
  final List<String> imagePaths = [
    'public/images/pokemons/pokemon-1.png',
    'public/images/pokemons/pokemon-2.png',
    'public/images/pokemons/pokemon-3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5db9ff),
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('test@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('public/images/pokemons/pokemon-1.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                            imagePath: 'public/images/types/bug.png')));
              },
            )
          ],
        ),
      ),
      body:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Text(
                    'Fire Type',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: imagePaths.map((iterable) {
                      final cardName = iterable.split('/').last.split('.').first;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: _SampleCard(
                            cardName: cardName,
                            imagePath: iterable,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Text(
                    'Water Type',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: imagePaths.map((iterable) {
                      final cardName = iterable.split('/').last.split('.').first;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: _SampleCard(
                            cardName: cardName,
                            imagePath: iterable,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Text(
                    'Grass Type',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: imagePaths.map((iterable) {
                      final cardName = iterable.split('/').last.split('.').first;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: _SampleCard(
                            cardName: cardName,
                            imagePath: iterable,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Text(
                    'Electric Type',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: imagePaths.map((iterable) {
                      final cardName = iterable.split('/').last.split('.').first;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: _SampleCard(
                            cardName: cardName,
                            imagePath: iterable,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName, required this.imagePath});
  final String cardName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150, // Adjust card width
      height: 100, // Adjust card height
      child: Column(
        children: [
          Container(
            height: 60, // Adjust to cover half of the card's height
            width: double.infinity, // Full width of the card
            child: GestureDetector(
              onTap: () {
                // Navigate to DetailPage when the image is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(imagePath: imagePath),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  imagePath,
                  width: 70,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4), // Add some spacing between the image and text
          Expanded(
            child: Center(
              child: Text(
                cardName,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
