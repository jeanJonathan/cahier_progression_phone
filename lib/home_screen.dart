import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Indice de l'écran actuellement sélectionné
  @override
  Widget build(BuildContext context) {
    return Scaffold( // structure de base pour l'application comprenant app bar et un body
      appBar: AppBar(
        leading: IconButton( //
          icon: Icon(Icons.menu), // Icône du menu à gauche
          onPressed: () {
            // Action du bouton de menu
          },
        ),
        actions: [
          SizedBox(width: AppBar().preferredSize.height), // Espacement entre l'icône du menu et l'image du logo
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/ocean.png'), // Image du logo au centre
              ],
            ),
          ),
          SizedBox(width: AppBar().preferredSize.height), // Espacement entre l'image du logo et le bouton des paramètres
          IconButton(
            icon: Icon(Icons.settings), // Icône des paramètres à droite
            onPressed: () {
              // Action du bouton de paramètres
            },
          ),
        ],
        centerTitle: true, // Centrer le contenu de l'AppBar
      ),

      body: SingleChildScrollView(//widget pour faire defiler le contenu de la colonne verticale si l espace est inssufisant
        child: Column(// jouant le role du learLayout vertical
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical:5.0),
              child: Text(
                'IMPROVE YOUR TECHNIQUE',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset('assets/progresSurfss.jpg'),
            SizedBox(height: 20.0),
            DisciplineBlock(
              image: 'assets/kitesurfwing.jpg',
              title: 'Kitesurf        Surf        wingfoil',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            SizedBox(height: 20.0),
            Row(//pour organiser les enfant en ligne horizontale (linearLayout horizontal)
              children: [
                Expanded(//pour prendre autant d'espace disponible que possible
                  child: DisciplineBlock(
                    image: 'assets/progres.jpg',
                    title: 'Progress by chapter',
                    description:
                    'Lorem ipsum dolor sit amet',
                  ),
                ),
                Expanded(
                  child: DisciplineBlock(
                    image: 'assets/video.jpg',
                    title: 'Video Included',
                    description:
                    'Lorem ipsum dolor sit amet',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Color(0xFF1F355F), // Couleur des icônes sélectionnées
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/basEcran.jpg'), // Chemin de l'image d'eau
                CircleAvatar(
                  radius: 16, // Rayon du cercle
                  backgroundColor: Colors.white, // Couleur de fond du cercle
                  child: Icon(Icons.home),
                ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/basEcran.jpg'), // Chemin de l'image d'eau
                CircleAvatar(
                  radius: 16, // Rayon du cercle
                  backgroundColor: Colors.white, // Couleur de fond du cercle
                  child: Icon(Icons.assignment),
                ),
              ],
            ),
            label: 'formulaire Progression',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/basEcran.jpg'), // Chemin de l'image d'eau
                CircleAvatar(
                  radius: 16, // Rayon du cercle
                  backgroundColor: Colors.white, // Couleur de fond du cercle
                  child: Icon(Icons.playlist_add_check),
                ),
              ],
            ),
            label: 'liste des Étapes',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/basEcran.jpg'), // Chemin de l'image d'eau
                CircleAvatar(
                  radius: 16, // Rayon du cercle
                  backgroundColor: Colors.white, // Couleur de fond du cercle
                  child: Icon(Icons.mail),
                ),
              ],
            ),
            label: 'Messagerie',
          ),
        ],
      ),

    );
  }
}

class DisciplineBlock extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const DisciplineBlock({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        SizedBox(height: 5.0),
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Text(description),
      ],
    );
  }
}
