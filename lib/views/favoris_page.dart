// lib/views/favoris_page.dart
import 'package:flutter/material.dart';
import 'package:joe/services/favoris_service.dart';
import 'package:joe/models/priere_model.dart';
import 'package:joe/models/enseignement_model.dart';
//import 'package:joe/models/meditation_modele.dart';
import 'package:joe/models/oeuvre_modele.dart';
import 'package:joe/views/priere_detail_page.dart';
import 'package:joe/views/enseignement_detail_page.dart';
//import 'package:joe/views/meditation_du_jour_page.dart';

class FavorisPage extends StatefulWidget {
  @override
  _FavorisPageState createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Priere> _prieresFavoris = [];
  List<Enseignement> _enseignementsFavoris = [];

  List<OeuvreArt> _oeuvresFavoris = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _chargerFavoris();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _chargerFavoris() async {
    setState(() => _isLoading = true);
    
    final prieres = await FavorisService.getPrieresFavoris();
    final enseignements = await FavorisService.getEnseignementsFavoris();
  
    final oeuvres = await FavorisService.getOeuvresFavoris();
    
    setState(() {
      _prieresFavoris = prieres;
      _enseignementsFavoris = enseignements;
   
      _oeuvresFavoris = oeuvres;
      _isLoading = false;
    });
  }

  Future<void> _rafraichir() async {
    await _chargerFavoris();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes favoris'),
        backgroundColor: Colors.brown,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Prières (${_prieresFavoris.length})'),
            Tab(text: 'Enseignements (${_enseignementsFavoris.length})'),
            Tab(text: 'Œuvres (${_oeuvresFavoris.length})'),
          ],labelStyle: TextStyle(color: Colors.white),
        ),
        actions: [
          FutureBuilder<Map<String, int>>(
            future: FavorisService.getStatsFavoris(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Total: ${snapshot.data!['total']}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
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
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: _rafraichir,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildPrieresList(),
                    _buildEnseignementsList(),
                  
                    _buildOeuvresList(),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildPrieresList() {
    if (_prieresFavoris.isEmpty) {
      return _buildEmptyState('prières');
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _prieresFavoris.length,
      itemBuilder: (context, index) {
        final priere = _prieresFavoris[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown.shade100,
              child: const Icon(Icons.menu_book, color: Colors.brown),
            ),
            title: Text(priere.titre),
            subtitle: Text(priere.sousTitre),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () async {
                    await FavorisService.togglePriereFavori(priere.id);
                    await _chargerFavoris();
                  },
                ),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PriereDetailPage(priere: priere),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildEnseignementsList() {
    if (_enseignementsFavoris.isEmpty) {
      return _buildEmptyState('enseignements');
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _enseignementsFavoris.length,
      itemBuilder: (context, index) {
        final ens = _enseignementsFavoris[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade100,
              child: const Icon(Icons.school, color: Colors.green),
            ),
            title: Text(ens.titre),
            subtitle: Text(ens.auteur),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () async {
                    await FavorisService.toggleEnseignementFavori(ens.id);
                    await _chargerFavoris();
                  },
                ),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EnseignementDetail(enseignement: ens),
                ),
              );
            },
          ),
        );
      },
    );
  }



  Widget _buildOeuvresList() {
    if (_oeuvresFavoris.isEmpty) {
      return _buildEmptyState('œuvres');
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _oeuvresFavoris.length,
      itemBuilder: (context, index) {
        final oeuvre = _oeuvresFavoris[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image, color: Colors.amber),
            ),
            title: Text(oeuvre.titre),
            subtitle: Text('${oeuvre.artiste} - ${oeuvre.annee}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () async {
                    await FavorisService.toggleOeuvreFavori(oeuvre.id);
                    await _chargerFavoris();
                  },
                ),
                const Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
            onTap: () {
              // Afficher le détail de l'œuvre
            },
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(String type) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Aucune $type favorite',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ajoutez des éléments en cliquant sur le cœur ♥',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}