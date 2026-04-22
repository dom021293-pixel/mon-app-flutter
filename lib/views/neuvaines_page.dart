import 'package:flutter/material.dart';
import 'package:joe/models/neuvaine_model.dart';  // Un seul import pour le modèle
import 'package:joe/data/neuvaines_data.dart';    // Un seul import pour les données
import 'package:joe/views/neuvaine_detail_page.dart';


class NeuvainesPage extends StatefulWidget {
  @override
  _NeuvainesPageState createState() => _NeuvainesPageState();
}

class _NeuvainesPageState extends State<NeuvainesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Neuvaines à Saint Joseph'),
        backgroundColor: Colors.brown,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_circle_fill, color: Colors.white,),
                  SizedBox(width: 8),
                  Text('En cours',
                    style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.list, color: Colors.white,),
                  SizedBox(width: 8),
                  Text('Toutes',
                    style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
                  
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNeuvainesEnCours(),
          _buildToutesNeuvaines(),
        ],
      ),
    );
  }

  Widget _buildNeuvainesEnCours() {
    List<Neuvaine> neuvainesEnCours =
        NeuvainesData.toutesLesNeuvaines.where((n) => n.enCours).toList();

    if (neuvainesEnCours.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Aucune neuvaine en cours',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Commencez une neuvaine dans l\'onglet "Toutes"',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: neuvainesEnCours.length,
      itemBuilder: (context, index) {
        return _buildNeuvaineCard(neuvainesEnCours[index], isEnCours: true);
      },
    );
  }

  Widget _buildToutesNeuvaines() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: NeuvainesData.toutesLesNeuvaines.length,
      itemBuilder: (context, index) {
        return _buildNeuvaineCard(NeuvainesData.toutesLesNeuvaines[index]);
      },
    );
  }

  Widget _buildNeuvaineCard(Neuvaine neuvaine, {bool isEnCours = false}) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NeuvaineDetailPage(neuvaine: neuvaine),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image d'en-tête
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Color(int.parse(neuvaine.couleurHex)),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          'images/josephetjesus.jpg',
                          repeat: ImageRepeat.repeat,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Text(
                        neuvaine.titre,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    neuvaine.description,
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 16),
                  if (isEnCours) ...[
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.brown,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Jour ${neuvaine.jourActuel + 1}/${neuvaine.jours.length}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: neuvaine.progression / 100,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(int.parse(neuvaine.couleurHex)),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NeuvaineDetailPage(neuvaine: neuvaine),
                            ),
                          );
                        },
                        icon: Icon(isEnCours ? Icons.play_arrow : Icons.start),
                        label: Text(
                          isEnCours ? 'Continuer' : 'Commencer',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(int.parse(neuvaine.couleurHex)),
                          foregroundColor: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.notifications_none,
                          color: Colors.brown,
                        ),
                        onPressed: () {
                          _showNotificationDialog(neuvaine);
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

  void _showNotificationDialog(Neuvaine neuvaine) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Rappel quotidien'),
        content: Text(
            'Voulez-vous recevoir un rappel chaque jour pour votre neuvaine "${neuvaine.titre}" ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Non'),
          ),
          ElevatedButton(
            onPressed: () {
              // Configurer les notifications quotidiennes
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Rappel quotidien activé !'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text('Oui'),
          ),
        ],
      ),
    );
  }
}