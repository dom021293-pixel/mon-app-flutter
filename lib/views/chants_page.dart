// lib/views/chants_page.dart
import 'package:flutter/material.dart';
import 'package:joe/models/chant_model.dart';
import 'package:joe/widgets/audio_player_widget.dart';
import 'package:share_plus/share_plus.dart';

class ChantsPage extends StatefulWidget {
  @override
  _ChantsPageState createState() => _ChantsPageState();
}

class _ChantsPageState extends State<ChantsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> _categories = [];
  Chant? _chantEnLecture;

  @override
  void initState() {
    super.initState();
    _categories = ChantsData.getCategories();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chants à Saint Joseph'),
        backgroundColor: Colors.brown,
        bottom: _categories.isNotEmpty
            ? TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: _categories.map((categorie) {
                  return Tab(text: categorie);
                }).toList(),
              )
            : null,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.brown.shade50, Colors.white],
          ),
        ),
        child: _categories.isEmpty
            ? const Center(child: Text('Aucun chant disponible'))
            : TabBarView(
                controller: _tabController,
                children: _categories.map((categorie) {
                  return _buildChantsList(categorie);
                }).toList(),
              ),
      ),
    );
  }

  Widget _buildChantsList(String categorie) {
    final chants = ChantsData.getChantsParCategorie(categorie);
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: chants.length,
      itemBuilder: (context, index) {
        final chant = chants[index];
        final bool estEnLecture = _chantEnLecture == chant;
        
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              _showChantDetail(chant);
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Image ou icône
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(10),
                      image: chant.imageUrl != null
                          ? DecorationImage(
                              image: AssetImage(chant.imageUrl!),
                              fit: BoxFit.cover,
                              onError: (_, __) {},
                            )
                          : null,
                    ),
                    child: chant.imageUrl == null
                        ? const Icon(
                            Icons.music_note,
                            color: Colors.brown,
                            size: 30,
                          )
                        : null,
                  ),
                  const SizedBox(width: 12),
                  
                  // Informations
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chant.titre,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          chant.auteur,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: Colors.grey.shade500,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              chant.dureeFormatted,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // Indicateur de lecture
                  if (estEnLecture)
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.volume_up,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  
                  // Flèche
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.brown.shade400,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showChantDetail(Chant chant) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Handle
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  
                  // Titre
                  Text(
                    chant.titre,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chant.auteur,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Lecteur audio
                  AudioPlayerWidget(
                    audioUrl: chant.audioUrl,
                    titre: chant.titre,
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Paroles
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.brown.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Paroles',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Text(
                                chant.paroles,
                                style: const TextStyle(
                                  fontSize: 15,
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Boutons d'action
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            _partagerChant(chant);
                          },
                          icon: const Icon(Icons.share),
                          label: const Text('Partager'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              _chantEnLecture = chant;
                            });
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('Écouter'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.brown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      // Ne pas mettre à jour l'état si le widget est démonté
      if (mounted) {
        setState(() {});
      }
    });
  }

  void _partagerChant(Chant chant) {
    Share.share(
      '🎵 ${chant.titre}\n'
      'Auteur : ${chant.auteur}\n\n'
      'Paroles :\n${chant.paroles}\n\n'
      'Partagé depuis l\'application "Prière à Saint Joseph"',
    );
  }
}