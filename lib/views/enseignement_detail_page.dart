// lib/views/enseignement_detail_page.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import 'package:joe/models/enseignement_model.dart';
import 'package:shared_preferences/shared_preferences.dart'; // AJOUTÉ

class EnseignementDetail extends StatefulWidget {
  final Enseignement enseignement;

  const EnseignementDetail({Key? key, required this.enseignement}) : super(key: key);

  @override
  _EnseignementDetailState createState() => _EnseignementDetailState();
}

class _EnseignementDetailState extends State<EnseignementDetail> {
  bool _isFavorite = false;
  double _fontSize = 16.0;
  final TextEditingController _notesController = TextEditingController();
  DateTime _derniereSauvegarde = DateTime.now(); // AJOUTÉ

  // Clé pour SharedPreferences
  static const String NOTES_PREFIX = 'enseignement_notes_';

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.enseignement.estFavori;
    _chargerNotes(); // AJOUTÉ
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  // AJOUTÉ : Charger les notes sauvegardées
  Future<void> _chargerNotes() async {
    final prefs = await SharedPreferences.getInstance();
    String savedNotes = prefs.getString('$NOTES_PREFIX${widget.enseignement.id}') ?? '';
    int savedTimestamp = prefs.getInt('${NOTES_PREFIX}timestamp_${widget.enseignement.id}') ?? 0;
    
    setState(() {
      _notesController.text = savedNotes;
      if (savedTimestamp > 0) {
        _derniereSauvegarde = DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
      }
    });
  }

  // MODIFIÉ : Sauvegarde des notes avec SharedPreferences
  Future<void> _sauvegarderNotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      '$NOTES_PREFIX${widget.enseignement.id}',
      _notesController.text,
    );
    await prefs.setInt(
      '${NOTES_PREFIX}timestamp_${widget.enseignement.id}',
      DateTime.now().millisecondsSinceEpoch,
    );
    
    setState(() {
      _derniereSauvegarde = DateTime.now();
    });
    
    _showSnackBar(
      _notesController.text.isNotEmpty
          ? 'Notes sauvegardées ✓'
          : 'Notes effacées',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.enseignement.titre,
          style: const TextStyle(fontSize: 18),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.brown,
        elevation: 0,
        actions: [
          // Bouton favori
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              _showSnackBar(
                _isFavorite 
                  ? 'Ajouté aux favoris ❤️' 
                  : 'Retiré des favoris',
              );
            },
          ),
          // Bouton partager
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _partagerEnseignement,
          ),
          // Bouton taille de police
          IconButton(
            icon: const Icon(Icons.text_fields),
            onPressed: _showFontSizeDialog,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.brown.shade50,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildContent(),
              const SizedBox(height: 24),
              if (widget.enseignement.references.isNotEmpty)
                _buildReferences(),
              const SizedBox(height: 24),
              _buildNotesSection(),
              const SizedBox(height: 30),
              _buildActionButtons(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
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
              child: Icon(
                Icons.menu_book,
                color: Colors.brown,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.enseignement.titre,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.brown.shade800,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Text(
              'par ${widget.enseignement.auteur}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.amber.shade800,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today,
                size: 14,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 4),
              Text(
                widget.enseignement.date,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contrôle de la taille du texte
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
                color: Colors.brown,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.brown.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${_fontSize.round()}px',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.brown.shade800,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  setState(() {
                    if (_fontSize < 24) _fontSize += 2;
                  });
                },
                color: Colors.brown,
              ),
            ],
          ),
          
          const Divider(),
          const SizedBox(height: 16),
          
          // Extrait en citation
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.format_quote,
                  color: Colors.amber.shade700,
                  size: 30,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '"${widget.enseignement.extrait}"',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: _fontSize - 2,
                      color: Colors.amber.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Contenu principal
          SelectableText(
            widget.enseignement.contenu,
            style: TextStyle(
              fontSize: _fontSize,
              height: 1.6,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReferences() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.brown.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.bookmark,
                color: Colors.brown.shade700,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Références',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...widget.enseignement.references.map((ref) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 16)),
                  Expanded(
                    child: Text(
                      ref,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.brown.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildNotesSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.edit_note,
                color: Colors.amber.shade700,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Mes notes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _notesController,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Écrivez vos réflexions personnelles ici...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.amber.shade400),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '🕐 ${_derniereSauvegarde.hour.toString().padLeft(2, '0')}:${_derniereSauvegarde.minute.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
              ElevatedButton.icon(
                onPressed: _sauvegarderNotes,
                icon: const Icon(Icons.save, size: 18),
                label: const Text('Sauvegarder'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // MODIFIÉ : Suppression de l'icône audio
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          icon: Icons.copy,
          label: 'Copier',
          onTap: _copierTexte,
        ),
        _buildActionButton(
          icon: Icons.share,
          label: 'Partager',
          onTap: _partagerEnseignement,
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.brown.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.brown.shade700,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.brown.shade700,
            ),
          ),
        ],
      ),
    );
  }

  void _copierTexte() {
    Clipboard.setData(ClipboardData(text: widget.enseignement.contenu));
    _showSnackBar('📋 Texte copié dans le presse-papiers');
  }

  void _partagerEnseignement() {
    String message = '''
${widget.enseignement.titre}
par ${widget.enseignement.auteur}

"${widget.enseignement.extrait}"

${widget.enseignement.contenu.substring(0, min(200, widget.enseignement.contenu.length))}...

Partagé depuis l'application "Prière à Saint Joseph" 📿
    ''';
    
    Share.share(message);
  }

  void _showFontSizeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Taille du texte'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Ajustez la taille pour une lecture confortable'),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.text_fields, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Slider(
                    value: _fontSize,
                    min: 12,
                    max: 24,
                    divisions: 6,
                    label: _fontSize.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _fontSize = value;
                      });
                    },
                    activeColor: Colors.brown,
                  ),
                ),
                const SizedBox(width: 8),
                Text('${_fontSize.round()}px'),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.brown,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}