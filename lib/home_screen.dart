import 'package:cahier_progression_mobile/parametres_screen.dart';
import 'package:flutter/material.dart';

import 'menu_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Indice de l'écran actuellement sélectionné

  List<Widget> _screens = [
    HomeScreenWidget(), // Écran d'accueil
    ProgressionScreenWidget(), // Écran du formulaire de progression
    EtapesScreenWidget(), // Écran de la liste des étapes de progression
    MessagerieScreenWidget(), // Écran de la messagerie pour permettre aux utilisateurs de recevoir les propositions de kite
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => MenuScreen())
            );
          },
        ),
        actions: [
          SizedBox(width: AppBar().preferredSize.height),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/ocean.png'),
              ],
            ),
          ),
          SizedBox(width: AppBar().preferredSize.height),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Action lorsque l utilisateur clic sur le bouton de paramètres
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ParametresScreen()),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: _screens[_currentIndex], // Affichage de l'écran correspondant à l'index sélectionné
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Color(0xFF1F355F),
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/basEcran.jpg'),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
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
                Image.asset('assets/basEcran.jpg'),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
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
                Image.asset('assets/basEcran.jpg'),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
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
                Image.asset('assets/basEcran.jpg'),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
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

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
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
              description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: DisciplineBlock(
                    image: 'assets/progres.jpg',
                    title: 'Progress by chapter',
                    description: 'Lorem ipsum dolor sit amet',
                  ),
                ),
                Expanded(
                  child: DisciplineBlock(
                    image: 'assets/video.jpg',
                    title: 'Video Included',
                    description: 'Lorem ipsum dolor sit amet',
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

class ProgressionScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Ecran pour le formulaire de progression'),
      ),
    );
  }
}

class EtapesScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Ecran pour la liste des Étapes'),
      ),
    );
  }
}

class MessagerieScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Ecran pour recevoir les messages'),
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
