// lib/views/priere_detail_page.dart
import 'package:flutter/material.dart';
import 'package:joe/data/prieres_data.dart';
import 'package:joe/models/priere_model.dart';
import 'package:joe/services/favoris_service.dart';
import 'package:joe/services/rappel_priere_service.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

class PriereDetailPage extends StatefulWidget {
  final Priere priere;

  const PriereDetailPage({Key? key, required this.priere}) : super(key: key);

  @override
  _PriereDetailPageState createState() => _PriereDetailPageState();
}

class _PriereDetailPageState extends State<PriereDetailPage> {
  bool _isFavorite = false;
  double _fontSize = 16.0;
  bool _rappelActif = false;
  late List<Priere> _toutesLesPrieres;
  int _indexActuel = 0;



  @override
  void initState() {
    super.initState();
    _isFavorite = widget.priere.estFavori;
     _toutesLesPrieres = PrieresData.toutesLesPrieres;
    _indexActuel = _toutesLesPrieres.indexWhere((p) => p.id == widget.priere.id);
    _verifierEtatRappel();
  }
    void _naviguerVersPrierePrecedente() {
    if (_indexActuel > 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PriereDetailPage(
            priere: _toutesLesPrieres[_indexActuel - 1],
          ),
        ),
      );
    } else {
      // Si on est à la première prière, revenir à la liste
      Navigator.pop(context);
    }
  }

  void _naviguerVersPriereSuivante() {
    if (_indexActuel < _toutesLesPrieres.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PriereDetailPage(
            priere: _toutesLesPrieres[_indexActuel + 1],
          ),
        ),
      );
    } else {
      // Si on est à la dernière prière, revenir à la liste
      Navigator.pop(context);
    }
  }

  Future<void> _verifierEtatRappel() async {
    final actif = await RappelPriereService.estRappelActif(widget.priere.id);
    setState(() {
      _rappelActif = actif;
    });
  }

  Future<void> _toggleRappelPriere() async {
    final bool actif = await RappelPriereService.estRappelActif(widget.priere.id);
    
    if (!actif) {
      // Activer le rappel
      await RappelPriereService.activerRappelPriere(
        priereId: widget.priere.id,
        priereTitre: widget.priere.titre,
        heure: const TimeOfDay(hour: 8, minute: 0),
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('🔔 Rappel quotidien activé pour 8h'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      // Désactiver le rappel
      await RappelPriereService.desactiverRappelPriere(widget.priere.id);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('🔕 Rappel désactivé'),
          backgroundColor: Colors.grey,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    
    setState(() {
      _rappelActif = !actif;
    });
  }

  Future<void> _toggleFavori() async {
    await FavorisService.togglePriereFavori(widget.priere.id);
    setState(() {
      _isFavorite = !_isFavorite;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isFavorite ? '❤️ Ajouté aux favoris' : '💔 Retiré des favoris'),
        backgroundColor: _isFavorite ? Colors.red : Colors.grey,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _partagerPriere() {
    Share.share(
      '${widget.priere.titre}\n\n${widget.priere.texte}\n\nPartagé depuis l\'application "Prière à Saint Joseph" 🙏',
    );
  }

  void _copierTexte() {
    Clipboard.setData(ClipboardData(text: widget.priere.texte));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('📋 Prière copiée !'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.priere.titre,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.brown,
        actions: [
          // Bouton taille de police
          IconButton(
            icon: const Icon(Icons.text_fields),
            onPressed: _showFontSizeDialog,
          ),
          
          // Bouton rappel avec état
          FutureBuilder<bool>(
            future: RappelPriereService.estRappelActif(widget.priere.id),
            builder: (context, snapshot) {
              bool rappelActif = snapshot.data ?? false;
              return IconButton(
                icon: Icon(
                  rappelActif ? Icons.notifications_active : Icons.notifications_none,
                  color: rappelActif ? Colors.amber : Colors.white,
                ),
                onPressed: _toggleRappelPriere,
              );
            },
          ),
          
          // Bouton favori
          IconButton(
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
            color: _isFavorite ? Colors.red : Colors.white,
            onPressed: _toggleFavori,
          ),
          
          // Bouton partager
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _partagerPriere,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête
            Center(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text('🙏', style: TextStyle(fontSize: 40)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.priere.titre,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.priere.sousTitre,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Intentions (si disponibles)
            if (widget.priere.intentions != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.shade200!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Intentions de prière',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber.shade800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...widget.priere.intentions!.map((intention) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.amber, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(intention, style: const TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],

            // Texte de la prière
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Contrôle de taille de police
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (_fontSize > 12) _fontSize -= 2;
                          });
                        },
                      ),
                      Text('${_fontSize.round()}px'),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (_fontSize < 24) _fontSize += 2;
                          });
                        },
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  
                  // Texte de la prière
                  SelectableText(
                    widget.priere.texte,
                    style: TextStyle(
                      fontSize: _fontSize,
                      height: 1.6,
                      fontFamily: 'Merriweather',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Actions
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(
                        icon: Icons.copy,
                        label: 'Copier',
                        onTap: _copierTexte,
                      ),
                      _buildActionButton(
                        icon: Icons.notifications_none,
                        label: 'Rappel',
                        onTap: () => _showReminderDialog(),
                      ),
                   
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Verset ou citation
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.brown.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.format_quote, color: Colors.brown, size: 40),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '"Souvenez-vous, ô très chaste époux de la Vierge Marie..."',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '- Prière traditionnelle',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
    child: Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bouton précédent
          TextButton.icon(
            onPressed: _naviguerVersPrierePrecedente,
            icon: Icon(
              Icons.arrow_back,
              color: _indexActuel > 0 ? Colors.brown : Colors.grey.shade400,
            ),
            label: Text(
              'Précédente',
              style: TextStyle(
                color: _indexActuel > 0 ? Colors.brown : Colors.grey.shade400,
              ),
            ),
          ),
          
          // Indicateur de position
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.brown.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${_indexActuel + 1}/${_toutesLesPrieres.length}',
              style: TextStyle(
                color: Colors.brown.shade800,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          // Bouton suivant
          TextButton.icon(
            onPressed: _naviguerVersPriereSuivante,
            icon: Icon(
              Icons.arrow_forward,
              color: _indexActuel < _toutesLesPrieres.length - 1
                  ? Colors.brown
                  : Colors.grey.shade400,
            ),
            label: Text(
              'Suivante',
              style: TextStyle(
                color: _indexActuel < _toutesLesPrieres.length - 1
                    ? Colors.brown
                    : Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.brown, size: 28),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.brown)),
        ],
      ),
    );
  }

  void _showFontSizeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Taille du texte'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Ajustez la taille du texte pour une lecture confortable'),
            const SizedBox(height: 16),
            Slider(
              value: _fontSize,
              min: 12,
              max: 24,
              divisions: 6,
              label: _fontSize.round().toString(),
              onChanged: (value) {
                setState(() => _fontSize = value);
              },
            ),
          ],
        ),
      ),
    );
  }

void _showReminderDialog() {
  TimeOfDay selectedTime = TimeOfDay.now();
  
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            title: const Text('Définir un rappel'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Choisissez l\'heure pour votre rappel de prière'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );
                    if (time != null) {
                      setStateDialog(() {
                        selectedTime = time;
                      });
                    }
                  },
                  child: const Text('Choisir une heure'),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Heure sélectionnée: ${selectedTime.format(context)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Annuler'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Activer le rappel avec l'heure choisie
                  await RappelPriereService.activerRappelPriere(
                    priereId: widget.priere.id,
                    priereTitre: widget.priere.titre,
                    heure: selectedTime,
                  );
                  
                  setState(() => _rappelActif = true);
                  Navigator.pop(context);
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('🔔 Rappel configuré pour ${selectedTime.format(context)}'),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: const Text('Confirmer'),
              ),
            ],
          );
        },
      );
    },
  );
}
}