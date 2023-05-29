import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
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
          3cv ☻
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
                    ',
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
        SizedBox(height: 10.0),
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        Text(description),
        SizedBox(height: 20.0),
      ],
    );
  }
}
