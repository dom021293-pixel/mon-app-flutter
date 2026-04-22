// lib/widgets/prochaines_fetes_widget.dart (version avec prochaines fêtes)
import 'package:flutter/material.dart';
import 'package:joe/models/fete_modele.dart';

class ProchainesFetesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Récupérer les saints du jour
    final fetesDuJour = CalendrierLiturgiqueData.getFetesDuJour(DateTime.now());
    
    // Récupérer les prochaines fêtes (les 3 plus proches)
    final prochainesFetes = _getProchainesFetes(3);

    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.brown.shade100,
              Colors.white,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.celebration,
                      color: Colors.brown,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Fêtes et saints du jour',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Section "Saints du jour"
              if (fetesDuJour.isNotEmpty) ...[
                Row(
                  children: [
                    const Icon(Icons.today, size: 16, color: Colors.brown),
                    const SizedBox(width: 8),
                    Text(
                      'Aujourd\'hui, ${_formatDate(DateTime.now())}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.brown.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...fetesDuJour.map((fete) => _buildFeteItem(fete)),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),
              ],
              
              // Section "À venir"
              const Row(
                children: [
                  Icon(Icons.upcoming, size: 16, color: Colors.brown),
                  SizedBox(width: 8),
                  Text(
                    'À venir',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              
              // Liste des prochaines fêtes
              ...prochainesFetes.map((fete) => _buildFeteItem(fete)),
              
              const SizedBox(height: 16),
              
              // Bouton pour voir le calendrier complet
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/calendrier_fetes');
                  },
                  icon: const Icon(Icons.calendar_month, size: 16),
                  label: const Text('Voir tout le calendrier'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.brown.shade700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final jours = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
    final mois = [
      'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
      'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
    ];
    
    return '${jours[date.weekday - 1]} ${date.day} ${mois[date.month - 1]}';
  }

  List<Fete> _getProchainesFetes(int count) {
    final now = DateTime.now();
    final toutesFetes = CalendrierLiturgiqueData.toutesLesFetes;
    
    // Filtrer et trier les fêtes à venir
    final aVenir = toutesFetes.where((fete) {
      final dateFete = fete.date;
      return dateFete.isAfter(now) || 
             (dateFete.day == now.day && dateFete.month == now.month);
    }).toList();
    
    // Trier par date
    aVenir.sort((a, b) => a.date.compareTo(b.date));
    
    return aVenir.take(count).toList();
  }

  Widget _buildFeteItem(Fete fete) {
    Color couleur = _getCouleurLiturgique(fete.couleur);
    final joursRestants = fete.joursRestants;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          // Indicateur de couleur liturgique
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: couleur,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          
          // Icône selon le type
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: couleur.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                _getIconForType(fete.type),
                color: couleur,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          
          // Informations
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fete.nom,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      '${fete.jour} ${_getMois(fete.mois)}',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (fete.saintDuJour != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          fete.saintDuJour!,
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.amber.shade800,
                          ),
                        ),
                      ),
                  ],
                ),
                if (joursRestants > 0) ...[
                  const SizedBox(height: 2),
                  Text(
                    'Dans $joursRestants jours',
                    style: TextStyle(
                      fontSize: 10,
                      color: couleur,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ),
          
          // Badge du type
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: couleur.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _getTypeAbreviation(fete.type),
              style: TextStyle(
                fontSize: 9,
                color: couleur,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getMois(int mois) {
    const moisNoms = [
      'janv.', 'févr.', 'mars', 'avr.', 'mai', 'juin',
      'juil.', 'août', 'sept.', 'oct.', 'nov.', 'déc.'
    ];
    return moisNoms[mois - 1];
  }

  String _getTypeAbreviation(String type) {
    switch (type) {
      case 'solennite': return 'SOL';
      case 'fete': return 'FÊTE';
      case 'memoire': return 'MÉM';
      default: return '';
    }
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'solennite':
        return Icons.star;
      case 'fete':
        return Icons.celebration;
      case 'memoire':
        return Icons.access_time;
      default:
        return Icons.church;
    }
  }

  Color _getCouleurLiturgique(String couleur) {
    switch (couleur) {
      case 'blanc':
        return Colors.white;
      case 'rouge':
        return Colors.red.shade600;
      case 'violet':
        return Colors.purple.shade600;
      case 'vert':
        return Colors.green.shade600;
      default:
        return Colors.grey;
    }
  }
}