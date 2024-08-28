import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LugarDetalhesScreen extends StatelessWidget {
  const LugarDetalhesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cachoeira do Ferro Doido'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Ação para o menu
            },
          ),
        ],
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem principal
              Image.asset(
                'lib/assets/images/cachoeira-ferro-doido.png'
              ),
              SizedBox(height: 16),
              // Nome do lugar
              Text(
                'Cachoeira do Ferro Doido',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // Descrição
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              // Informações adicionais
              Text(
                'Distância de carro: 18km\n'
                'Acesso a pé: 650m\n'
                'Tempo médio: 10 min\n'
                'Esforço físico: leve',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              // Mapa
              Text(
                'Local no mapa',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Container(
                height: 200,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-11.6252381,-40.9997256), // Coordenadas de exemplo
                    zoom: 14,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('Lugar'),
                      position: LatLng(-11.6252381,-40.9997256),
                      infoWindow: InfoWindow(title: 'Cachoeira do Ferro Doido'),
                    ),
                  },
                ),
              ),
              SizedBox(height: 16),
              // Botão de Iniciar Rota
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Ação para iniciar a rota
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Iniciar rota'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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