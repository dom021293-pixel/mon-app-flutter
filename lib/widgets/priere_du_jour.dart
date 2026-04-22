// widgets/priere_du_jour.dart
import 'package:flutter/material.dart';

class PriereDuJour extends StatelessWidget {
  final String priere = """
    Ô Saint Joseph, père nourricier de Jésus,
    protecteur de la Sainte Famille,
    veille sur notre famille aujourd'hui...
  """;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.wb_sunny, color: Colors.amber),
                SizedBox(width: 10),
                Text(
                  'Prière du jour',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(priere, style: TextStyle(fontSize: 16)),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text('Partager'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}