// lib/main.dart
import 'package:flutter/material.dart';
import 'package:joe/services/rappel_neuvaine_service.dart';
import 'package:joe/services/rappel_premier_mercredi_service.dart';
import 'package:joe/services/rappel_priere_service.dart';
import 'package:joe/services/supabase_service.dart';
import 'package:joe/views/accueil_page.dart';
import 'package:joe/views/chapelet_page.dart';
import 'package:joe/views/intentions_page.dart';
import 'package:joe/views/intentions_publiques_page.dart';
import 'package:joe/views/neuvaines_page.dart';
import 'package:joe/views/neuvaine_detail_page.dart';
import 'package:joe/views/prieres_page.dart';
import 'package:joe/views/priere_detail_page.dart';
import 'package:joe/views/enseignements_page.dart';
import 'package:joe/views/enseignement_detail_page.dart';
import 'package:joe/models/priere_model.dart';
import 'package:joe/models/neuvaine_model.dart';
import 'package:joe/views/calendrier_fetes_page.dart';
import 'package:joe/models/enseignement_model.dart';
import 'package:joe/views/temoignages_page.dart';
import 'package:joe/views/temoignages_publiques_page.dart';


bool firebaseInitialized = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialiser Firebase
   await SupabaseService.initialize();
  
  // Initialiser les notifications
  try {
    await RappelPremierMercrediService.initialize();
    await RappelNeuvaineService.initialize();
    await RappelPriereService.initialize();
  } catch (e) {
    debugPrint('❌ Erreur notifications: $e');
  }
  
  // Reprogrammation en arrière-plan
  if (firebaseInitialized) {
    RappelPremierMercrediService.verifierEtReprogrammer()
        .catchError((error) {
          debugPrint('Erreur reprogrammation: $error');
        });
  }
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prière à Saint Joseph',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AccueilPage(),
        '/chapelet': (context) => ChapeletPage(),
        '/neuvaines': (context) => NeuvainesPage(),
        '/prieres': (context) => PrieresPage(),
        '/enseignements': (context) => EnseignementsPage(),
        '/intentions': (context) => IntentionsPage(),
        '/intentions_publiques': (context) => IntentionsPubliquesPage(),
        '/calendrier_fetes': (context) => CalendrierFetesPage(),
        '/temoignages': (context) => TemoignagesPage(),
'/temoignages_publiques': (context) => TemoignagesPubliquesPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/neuvaine_detail') {
          final neuvaine = settings.arguments as Neuvaine?;
          if (neuvaine != null) {
            return MaterialPageRoute(
              builder: (context) => NeuvaineDetailPage(neuvaine: neuvaine),
            );
          }
        }
        if (settings.name == '/priere_detail') {
          final priere = settings.arguments as Priere?;
          if (priere != null) {
            return MaterialPageRoute(
              builder: (context) => PriereDetailPage(priere: priere),
            );
          }
        }
        if (settings.name == '/enseignement_detail') {
          final enseignement = settings.arguments as Enseignement?;
          if (enseignement != null) {
            return MaterialPageRoute(
              builder: (context) => EnseignementDetail(enseignement: enseignement),
            );
          }
        }
        return null;
      },
    );
  }
}