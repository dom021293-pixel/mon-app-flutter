// widgets/neuvaine_card.dart
import 'package:flutter/material.dart';
import 'package:joe/models/neuvaine_model.dart';

class NeuvaineCard extends StatelessWidget {
  final Neuvaine neuvaine;
  final VoidCallback? onTap;
  final bool showProgress;
  final bool isCompact;

  const NeuvaineCard({
    Key? key,
    required this.neuvaine,
    this.onTap,
    this.showProgress = true,
    this.isCompact = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color couleurPrincipale = Color(int.parse(neuvaine.couleurHex));

    if (isCompact) {
      return _buildCompactCard(context, couleurPrincipale);
    }

    return _buildExpandedCard(context, couleurPrincipale);
  }

  Widget _buildCompactCard(BuildContext context, Color couleurPrincipale) {
    // Une neuvaine est en cours si elle a commencé (jourActuel > 0) OU enCours = true
    final bool estEnCours = neuvaine.jourActuel > 0 || neuvaine.enCours;
    
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap ?? () {
          Navigator.pushNamed(context, '/neuvaine_detail', arguments: neuvaine);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 200,
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icône ou image
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: couleurPrincipale.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.calendar_today,
                    color: couleurPrincipale,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(height: 12),
              // Titre
              Text(
                neuvaine.titre,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: couleurPrincipale,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              // Description courte
              Text(
                neuvaine.description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              // Progression si demandée et si la neuvaine est en cours
              if (showProgress && estEnCours) ...[
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: neuvaine.progression / 100,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(couleurPrincipale),
                ),
                SizedBox(height: 4),
                Text(
                  'Jour ${neuvaine.jourActuel}/${neuvaine.jours.length}',
                  style: TextStyle(
                    fontSize: 11,
                    color: couleurPrincipale,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedCard(BuildContext context, Color couleurPrincipale) {
    // Une neuvaine est en cours si elle a commencé (jourActuel > 0) OU enCours = true
    final bool estEnCours = neuvaine.jourActuel > 0 || neuvaine.enCours;
    
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap ?? () {
          Navigator.pushNamed(context, '/neuvaine_detail', arguments: neuvaine);
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image d'en-tête
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      couleurPrincipale,
                      couleurPrincipale.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Motif de fond
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.1,
                        child: Image.asset(
                          'images/josephetjesus.jpg',
                          repeat: ImageRepeat.repeat,
                          errorBuilder: (context, error, stackTrace) {
                            return Container();
                          },
                        ),
                      ),
                    ),
                    // Icône décorative
                    Positioned(
                      right: -20,
                      top: -20,
                      child: Icon(
                        Icons.star,
                        size: 100,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    // Titre
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            neuvaine.titre,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 10,
                                  color: Colors.black38,
                                ),
                              ],
                            ),
                          ),
                          if (estEnCours) ...[
                            SizedBox(height: 4),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'En cours',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Contenu
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Description
                  Text(
                    neuvaine.description,
                    style: TextStyle(
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 16),

                  // Informations supplémentaires
                  Row(
                    children: [
                      _buildInfoChip(
                        icon: Icons.calendar_today,
                        label: '${neuvaine.jours.length} jours',
                        color: couleurPrincipale,
                      ),
                      SizedBox(width: 12),
                      if (neuvaine.audioUrl != null)
                        _buildInfoChip(
                          icon: Icons.volume_up,
                          label: 'Audio disponible',
                          color: couleurPrincipale,
                        ),
                    ],
                  ),

                  if (showProgress && estEnCours) ...[
                    SizedBox(height: 16),
                    // Barre de progression
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Progression',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          '${neuvaine.progression}%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: couleurPrincipale,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: neuvaine.progression / 100,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(couleurPrincipale),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Jour ${neuvaine.jourActuel}/${neuvaine.jours.length}',
                      style: TextStyle(
                        fontSize: 13,
                        color: couleurPrincipale,
                      ),
                    ),
                  ],

                  SizedBox(height: 16),

                  // Bouton d'action
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: onTap ?? () {
                          Navigator.pushNamed(
                            context,
                            '/neuvaine_detail',
                            arguments: neuvaine,
                          );
                        },
                        icon: Icon(
                          estEnCours ? Icons.play_arrow : Icons.start,
                          size: 18,
                        ),
                        label: Text(
                          estEnCours ? 'Continuer' : 'Commencer',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: couleurPrincipale,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.notifications_none,
                          color: Colors.brown,
                        ),
                        onPressed: () {
                          _showNotificationDialog(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: color,
          ),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  void _showNotificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rappel de neuvaine'),
          content: Text(
            'Voulez-vous recevoir un rappel quotidien pour "${neuvaine.titre}" ?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Non'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '🔔 Rappel quotidien activé pour ${neuvaine.titre}',
                    ),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
              child: Text('Oui'),
            ),
          ],
        );
      },
    );
  }
}