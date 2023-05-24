import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading pour pour spécifier l image comme un widget à afficher à gauche dans AppBar
        leading: Image.asset('assets/logo.png'),
        title: Text('progress book'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Action du bouton de menu
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'IMPROVE YOUR TECHNIQUE',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset('assets/progresSurfss.jpg'),
            SizedBox(height: 20.0),
            DisciplineBlock(
              image: 'assets/surf.jpeg',
              title: 'Surf',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            DisciplineBlock(
              image: 'assets/kitesurfs.jpg',
              title: 'KiteSurf',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            DisciplineBlock(
              image: 'assets/wingfoils.jpg',
              title: 'WingFoil',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: ProgressBlock(
                    image: 'assets/progres.jpg',
                    title: 'Progress by chapter and levels',
                    description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  ),
                ),
                Expanded(
                  child: VideoBlock(
                    image: 'assets/video.jpg',
                    title: 'Videos included to improve your technique',
                    description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ArticleBlock(
              title: 'Article 1',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            ArticleBlock(
              title: 'Article 2',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(

              ),
            ),
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

class ProgressBlock extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const ProgressBlock({
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

class VideoBlock extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const VideoBlock({
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

class ArticleBlock extends StatelessWidget {
  final String title;
  final String description;

  const ArticleBlock({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
