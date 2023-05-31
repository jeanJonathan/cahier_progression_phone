import 'package:cahier_progression_mobile/parametres_screen.dart';
import 'package:flutter/material.dart';

import 'menu_screen.dart';

//importation de la librairie de la base de donnees
import 'package:cahier_progression_mobile/database_manager.dart';

import 'model.dart';

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
class EtapesScreenWidget extends StatefulWidget {
  @override
  _EtapesScreenWidgetState createState() => _EtapesScreenWidgetState();
}

class _EtapesScreenWidgetState extends State<EtapesScreenWidget> {
  List<Etape> etapes = []; // Liste pour stocker les étapes récupérées depuis la base de données

  @override
  void initState() {
    super.initState();
    fetchEtapes(); // Appel de la méthode pour récupérer les étapes depuis la base de données
  }

  Future<void> fetchEtapes() async {
    final db = await DatabaseManager.database;
    final etapesList = await db.query('etapes'); // Récupération des données de la table 'etapes'

    setState(() {
      etapes = etapesList.map((map) => Etape.fromMap(map)).toList(); // Conversion des données en objets Etape
      print("test");
      print("Etapes récupérées depuis la base de données : $etapes");

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Étapes'),
      ),
      body:
      ListView.builder(
        itemCount: etapes.length,
        itemBuilder: (context, index) {
          final etape = etapes[index];
          print("Affichage de l'étape");
          return ListTile(
            title: Text(etape.nom), // Afficher le nom de l'étape
            subtitle: Text(etape.description),
            onTap: () {
              // Gérer le tap sur une étape
              print("Étape sélectionnée");
            },
          );
        },
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
