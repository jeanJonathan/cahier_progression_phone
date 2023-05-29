import 'package:flutter/material.dart';

class ParametresScreen extends StatefulWidget {
  @override
  _ParametresScreenState createState() => _ParametresScreenState();
}

class _ParametresScreenState extends State<ParametresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Essayer la version premium gratuitement'),
            onTap: () {
              // Action lorsque l'utilisateur clique sur "Essayer la version premium gratuitement"
            },
          ),
          ListTile(
            title: Text('Mon profil'),
            onTap: () {
              // Action lorsque l'utilisateur clique sur "Mon profil"
            },
          ),
          ListTile(
            title: Text('Objectifs'),
            onTap: () {
              // Action lorsque l'utilisateur clique sur "Objectifs"
            },
          ),
          ListTile(
            title: Text('Centre de confidentialité'),
            onTap: () {
              // Action lorsque l'utilisateur clique sur "Centre de confidentialité"
            },
          ),
          ListTile(
            title: Text('Partage et vie privée'),
            onTap: () {
              // Action lorsque l'utilisateur clique sur "Partage et vie privée"
            },
          ),ListTile(
            title: Text('Aide'),
            onTap: () {
              // Action lorsque l'utilisateur clique sur "Aide"
            },
          ),

        ],
      ),

    );
  }
}
