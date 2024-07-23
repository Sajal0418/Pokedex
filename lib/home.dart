import 'package:flutter/material.dart';
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
    'public/images/types/bug.png',
    'public/images/types/dark.png',
    'public/images/types/dragon.png',
    'public/images/types/electric.png',
    'public/images/types/fairy.png',
    'public/images/types/fighting.png',
    'public/images/types/fire.png',
    'public/images/types/flying.png',
    'public/images/types/ghost.png',
    'public/images/types/grass.png',
    'public/images/types/ground.png',
    'public/images/types/ice.png',
    'public/images/types/normal.png',
    'public/images/types/poison.png',
    'public/images/types/psychic.png',
    'public/images/types/rock.png',
    'public/images/types/steel.png',
    'public/images/types/water.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5db9ff),
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
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
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailPage(imagePath: 'public/images/types/bug.png')));
              },
            )
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          final imagePath = imagePaths[index];
          final cardName = imagePath.split('/').last.split('.').first; // Extract the name from path

          return Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: _SampleCard(
                cardName: cardName,
                imagePath: imagePath,
              ),
            ),
          );
        },
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
      width: 300, // Adjust card width
      height: 200, // Adjust card height
      child: Column(
        children: [
          Expanded(
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
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Adjust image fit
                ),
              ),
            ),
          ),
          SizedBox(height: 8), // Add some spacing between the image and text
          Text(
            cardName,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
