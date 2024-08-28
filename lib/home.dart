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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
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
                children: [
                  DestinationCard(
                    imagePath: 'lib/assets/images/cachoeira-ferro-doido.png',
                    title: 'Cachoeira do Ferro Doido',
                    distance: '107km do seu local',
                    description:
                        'A Cachoeira do Ferro Doido é uma das paisagens mais estonteantes da Chapada Diamantina.',
                  ),
                  DestinationCard(
                    imagePath: 'lib/assets/images/cachoeira-ferro-doido.png', 
                    title: 'Cachoeira do Ferro Doido',
                    distance: '16km do seu local',
                    description: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                  ),
                  DestinationCard(
                    imagePath: 'lib/assets/images/cachoeira-ferro-doido.png',
                    title: 'Cachoeira do Ferro Doido',
                    distance: '16km do seu local',
                    description: 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                  ),
                ],
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
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String distance;
  final String description;

  DestinationCard({
    required this.imagePath,
    required this.title,
    required this.distance,
    required this.description,
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LugarDetalhesScreen()),
                );
              },
              child: const Text("Ver"),
            ),
          ],
        ),
      ),
    );
  }
}