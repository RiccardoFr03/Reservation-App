/*import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/widgets/building_card_widget.dart';
import 'package:flutter/material.dart';

class BuildingScreen extends StatefulWidget {
  const BuildingScreen({super.key});

  @override
  State<BuildingScreen> createState() => _BuildingScreenState();
}

class _BuildingScreenState extends State<BuildingScreen> {
  final List<Widget> _card = [
    const BuildingCard(
      img:
          'https://cdn.finstral.com/images/content/1255825_53111_2_C_437_437_0_187446641/finstral-gewerbebau-scm-6.jpg',
      name: 'Edificio 1',
    ),
    const BuildingCard(
      img:
          'https://www.cottodeste.it/media/immagini/5459_n_CDE-custom-14mm-bosco-verticale-milan-italy-033.jpg',
      name: 'Edificio 2',
    ),
    const BuildingCard(
      img:
          'https://www.novediciotto.com/wp-content/uploads/2017/06/pareti-verdi-verticali-6.png',
      name: 'Edificio 3',
    ),
    const BuildingCard(
      img:
          'https://www.novediciotto.com/wp-content/uploads/2017/06/pareti-verdi-verticali-7.png',
      name: 'Edificio 4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Seleziona un edificio',
          style: bold_24,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.80,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _card[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/