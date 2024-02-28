/*import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TestCa extends StatelessWidget {
  TestCa({super.key});

  final List<String> imagePaths = [
    'https://lh3.googleusercontent.com/p/AF1QipNswdz-YrlVZkyhEpf52xizYIzzCYdLvAD05guU=s680-w680-h510',
    'https://lh3.googleusercontent.com/p/AF1QipNswdz-YrlVZkyhEpf52xizYIzzCYdLvAD05guU=s680-w680-h510'
  ]; // Sostituisci con i percorsi delle tue immagini
  final List<String> imageDescriptions = [
    'Descrizione 1',
    'Descrizione 2'
  ]; // Sostituisci con le descrizioni delle tue immagini

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imagePaths.map((String imagePath) {
        return GestureDetector(
          onTap: () =>
              _showImageDetails(context, imagePaths.indexOf(imagePath)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 400.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }

  void _showImageDetails(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Dettagli immagine'),
          content: Text(imageDescriptions[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Chiudi'),
            ),
          ],
        );
      },
    );
  }
}
*/