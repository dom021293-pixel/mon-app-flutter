// widgets/chapelet_interactif.dart
import 'package:flutter/material.dart';

class ChapeletInteractif extends StatefulWidget {
  @override
  _ChapeletInteractifState createState() => _ChapeletInteractifState();
}

class _ChapeletInteractifState extends State<ChapeletInteractif> {
  int _grainActuel = 0;
  final int _totalGrains = 20;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapelet de Saint Joseph'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: _totalGrains,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _grainActuel = index;
                      _afficherPriere(index);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index <= _grainActuel 
                          ? Colors.amber.shade700 
                          : Colors.grey.shade300,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: index <= _grainActuel 
                              ? Colors.white 
                              : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.brown.shade50,
            child: Column(
              children: [
                Text(
                  'Prière en cours',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  _getPriereEnCours(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  String _getPriereEnCours() {
    switch (_grainActuel) {
      case 0:
        return 'Notre Père...';
      case 1:
        return 'Je vous salue Joseph...';
      default:
        return 'Saint Joseph, priez pour nous...';
    }
  }
  
  void _afficherPriere(int index) {
    // Logique pour afficher la prière correspondante
  }
}