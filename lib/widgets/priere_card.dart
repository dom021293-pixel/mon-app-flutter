import 'package:flutter/material.dart';
import 'package:joe/models/priere_model.dart';

class PriereCard extends StatelessWidget {
  final Priere priere;
  final VoidCallback? onTap;
  final bool showActions;

  PriereCard({
    required this.priere,
    this.onTap,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap ?? () {
          Navigator.pushNamed(context, '/priere_detail', arguments: priere);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // Icône de catégorie
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.brown[100],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    _getIconForCategorie(priere.categorie),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Contenu
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      priere.titre,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      priere.sousTitre,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              if (showActions) ...[
                if (priere.audioUrl != null)
                  IconButton(
                    icon: Icon(Icons.play_circle_fill),
                    color: Colors.brown,
                    onPressed: () {},
                  ),
                IconButton(
                  icon: Icon(
                    priere.estFavori ? Icons.favorite : Icons.favorite_border,
                    color: priere.estFavori ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _getIconForCategorie(String categorie) {
    switch (categorie) {
      case 'quotidiennes':
        return '🌅';
      case 'intentions':
        return '🙏';
      case 'traditionnelles':
        return '📜';
      case 'litanies':
        return '✨';
      default:
        return '📖';
    }
  }
}