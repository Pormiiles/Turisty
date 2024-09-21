import 'package:flutter/material.dart';
import 'package:turisty/details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DestinationCard> destinations = [
    DestinationCard(
      imagePath: 'lib/assets/images/cachoeira-ferro-doido.png',
      title: 'Cachoeira do Ferro Doido',
      distance: '107km do seu local',
      description:
          'A Cachoeira do Ferro Doido é uma das paisagens mais estonteantes da Chapada Diamantina.',
      onSave: () {},
      onRemove: () {},
    ),
    DestinationCard(
      imagePath: 'lib/assets/images/images.jpeg',
      title: 'Cachoeira da Boca D´Água',
      distance: '30km do seu local',
      description: 'Visite a bela cachoeira da Boca D´Água próxima a Uibaí!',
      onSave: () {},
      onRemove: () {},
    ),
  ];

  List<DestinationCard> savedDestinations = [];

  void saveDestination(DestinationCard destination) {
    setState(() {
      savedDestinations.add(destination);
      destinations.remove(destination);
    });
  }

  void removeSavedDestination(DestinationCard destination) {
    setState(() {
      destinations.add(destination);
      savedDestinations.remove(destination);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: destinations.map((destination) {
                  return DestinationCard(
                    imagePath: destination.imagePath,
                    title: destination.title,
                    distance: destination.distance,
                    description: destination.description,
                    onSave: () => saveDestination(destination),
                    onRemove: () => {},
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SavedScreen(
                  savedDestinations: savedDestinations,
                  onRemove: removeSavedDestination, // Passando a função aqui
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String distance;
  final String description;
  final VoidCallback onSave;
  final VoidCallback onRemove;

  DestinationCard({
    required this.imagePath,
    required this.title,
    required this.distance,
    required this.description,
    required this.onSave,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )
            else
              Container(
                width: 100,
                height: 100,
                color: Colors.grey[300],
                child: Icon(Icons.image_not_supported),
              ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.orange),
                      SizedBox(width: 4),
                      Text(distance),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LugarDetalhesScreen(),
                      ),
                    );
                  },
                  child: const Text("Ver"),
                ),
                IconButton(
                  icon: Icon(Icons.bookmark_add),
                  onPressed: onSave,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class SavedScreen extends StatelessWidget {
  final List<DestinationCard> savedDestinations;
  final Function(DestinationCard) onRemove;

  SavedScreen({required this.savedDestinations, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Salvos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: savedDestinations.map((destination) {
            return DestinationCard(
              imagePath: destination.imagePath,
              title: destination.title,
              distance: destination.distance,
              description: destination.description,
              onSave: () {}, // Não precisa salvar novamente
              onRemove: () => onRemove(destination), // Chamando a função de remoção
            );
          }).toList(),
        ),
      ),
    );
  }
}