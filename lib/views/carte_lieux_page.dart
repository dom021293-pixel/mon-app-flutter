// lib/views/carte_lieux_page.dart
import 'package:flutter/material.dart';
import 'package:joe/models/lieu_joseph_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CarteLieuxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lieux dédiés à Saint Joseph'),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: LieuxJosephData.tous.length,
        itemBuilder: (context, index) {
          final lieu = LieuxJosephData.tous[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                _showLieuDetail(context, lieu);
              },
              borderRadius: BorderRadius.circular(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      image: DecorationImage(
                        image: AssetImage(lieu.imageUrl),
                        fit: BoxFit.cover,
                        onError: (_, __) {},
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          lieu.type,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lieu.nom,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown.shade800,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 14,
                              color: Colors.grey.shade600,
                            ),
                            SizedBox(width: 4),
                            Text(
                              '${lieu.ville}, ${lieu.pays}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
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
        },
      ),
    );
  }

  void _showLieuDetail(BuildContext context, LieuJoseph lieu) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                lieu.nom,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade800,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey.shade600),
                  SizedBox(width: 4),
                  Text('${lieu.ville}, ${lieu.pays}'),
                ],
              ),
              SizedBox(height: 8),
              Text(
                lieu.description,
                style: TextStyle(fontSize: 14, height: 1.4),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16, color: Colors.grey.shade600),
                  SizedBox(width: 4),
                  Text(lieu.horaires),
                ],
              ),
              SizedBox(height: 16),
           Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton.icon(
      onPressed: () async {
        try {
          final url = Uri.parse(
            'https://www.google.com/maps/search/?api=1&query=${lieu.latitude},${lieu.longitude}'
          );
          debugPrint('🌍 Tentative d\'ouverture: $url');
          
          if (await canLaunchUrl(url)) {
            await launchUrl(
              url,
              mode: LaunchMode.externalApplication,
            );
            debugPrint('✅ Carte ouverte avec succès');
          } else {
            debugPrint('❌ Impossible d\'ouvrir: $url');
            // Fallback : essayer de lancer avec le mode par défaut
            await launchUrl(url);
          }
        } catch (e) {
          debugPrint('❌ Erreur: $e');
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Impossible d\'ouvrir la carte'),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        }
      },
      icon: const Icon(Icons.map, color: Colors.white),
      label: const Text('Voir sur la carte', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    if (lieu.siteWeb.isNotEmpty)
      ElevatedButton.icon(
        onPressed: () async {
          try {
            String urlString = lieu.siteWeb;
            if (!urlString.startsWith('http')) {
              urlString = 'https://$urlString';
            }
            final url = Uri.parse(urlString);
            debugPrint('🌍 Tentative d\'ouverture: $url');
            
            if (await canLaunchUrl(url)) {
              await launchUrl(
                url,
                mode: LaunchMode.externalApplication,
              );
              debugPrint('✅ Site web ouvert avec succès');
            } else {
              debugPrint('❌ Impossible d\'ouvrir: $url');
              await launchUrl(url);
            }
          } catch (e) {
            debugPrint('❌ Erreur: $e');
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Impossible d\'ouvrir le site web'),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          }
        },
        icon: const Icon(Icons.language, color: Colors.white),
        label: const Text('Site web', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
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
  }
}