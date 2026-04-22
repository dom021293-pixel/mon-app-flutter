// lib/views/intentions_page.dart
import 'package:flutter/material.dart';
import 'package:joe/services/supabase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:joe/models/intention_model.dart';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

class IntentionsPage extends StatefulWidget {
  @override
  _IntentionsPageState createState() => _IntentionsPageState();
}

class _IntentionsPageState extends State<IntentionsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _intentionController = TextEditingController();
  
  bool _isAnonyme = false;
  bool _acceptePartage = true;
  bool _isLoading = false;
  bool _isOnline = true;
  bool _isChecking = true;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    setState(() => _isChecking = true);
    
    try {
      final List<ConnectivityResult> connectivityResult = 
          await (Connectivity().checkConnectivity());
      
      setState(() {
        _isOnline = connectivityResult.isNotEmpty && 
                    connectivityResult.first != ConnectivityResult.none;
        _isChecking = false;
      });
      
      // Écouter les changements de connexion
      Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
        if (mounted) {
          setState(() {
            _isOnline = results.isNotEmpty && results.first != ConnectivityResult.none;
          });
        }
      });
    } catch (e) {
      setState(() {
        _isOnline = false;
        _isChecking = false;
      });
      debugPrint('Erreur connexion: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Afficher un indicateur de chargement pendant la vérification
    if (_isChecking) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Confier une intention'),
          backgroundColor: Colors.brown,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confier une intention'),
        backgroundColor: Colors.brown,
        actions: [
          // Indicateur de connexion
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isOnline ? Colors.green : Colors.orange,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  _isOnline ? 'En ligne' : 'Hors ligne',
                  style: TextStyle(
                    color: _isOnline ? Colors.green : Colors.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.brown.shade50, Colors.white],
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Bannière de bienvenue
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: _isOnline
                              ? [Colors.purple.shade400, Colors.purple.shade700]
                              : [Colors.grey.shade400, Colors.grey.shade700],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            _isOnline ? Icons.favorite : Icons.wifi_off,
                            color: Colors.white,
                            size: 50,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _isOnline
                                ? 'Confiez vos intentions à Saint Joseph'
                                : 'Mode hors ligne',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _isOnline
                                ? 'Votre intention sera visible par toute la communauté qui priera pour vous.'
                                : 'Vous n\'êtes pas connecté à Internet. Reconnectez-vous pour confier une intention.',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Formulaire
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Votre intention',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Partagez votre intention de prière avec la communauté.',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 20),

                            // Option anonyme
                            Row(
                              children: [
                                Checkbox(
                                  value: _isAnonyme,
                                  onChanged: _isOnline ? (value) {
                                    setState(() {
                                      _isAnonyme = value!;
                                    });
                                  } : null,
                                  activeColor: Colors.purple,
                                ),
                                const Expanded(
                                  child: Text(
                                    'Rester anonyme (mon nom ne sera pas affiché)',
                                  ),
                                ),
                              ],
                            ),

                            if (!_isAnonyme) ...[
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: _nomController,
                                enabled: _isOnline,
                                decoration: InputDecoration(
                                  labelText: 'Votre nom *',
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                validator: (value) {
                                  if (!_isAnonyme && (value == null || value.isEmpty)) {
                                    return 'Veuillez entrer votre nom';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: _emailController,
                                enabled: _isOnline,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email (optionnel)',
                                  prefixIcon: const Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],

                            const SizedBox(height: 16),

                            // Intention
                            TextFormField(
                              controller: _intentionController,
                              enabled: _isOnline,
                              maxLines: 5,
                              maxLength: 500,
                              decoration: InputDecoration(
                                labelText: 'Votre intention *',
                                hintText: 'Décrivez votre intention de prière...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignLabelWithHint: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer votre intention';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 8),

                            // Option de partage public
                            Row(
                              children: [
                                Checkbox(
                                  value: _acceptePartage,
                                  onChanged: _isOnline ? (value) {
                                    setState(() {
                                      _acceptePartage = value!;
                                    });
                                  } : null,
                                  activeColor: Colors.purple,
                                ),
                                const Expanded(
                                  child: Text(
                                    'J\'accepte que mon intention soit visible par la communauté',
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Bouton d'envoi
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (_isOnline && !_isLoading) ? _soumettreIntention : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isOnline ? Colors.purple : Colors.grey,
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: _isLoading
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        _isOnline
                                            ? 'Confier mon intention'
                                            : 'Connexion requise',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                            
                            if (!_isOnline) ...[
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.info_outline, size: 16, color: Colors.amber),
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'Connectez-vous à Internet pour confier une intention.',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Lien vers les intentions publiques
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/intentions_publiques');
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.purple.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.visibility,
                                color: Colors.purple,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Voir les intentions',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Découvrez les intentions de la communauté',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_isLoading)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _soumettreIntention() async {
    if (_formKey.currentState!.validate() && _isOnline) {
      setState(() => _isLoading = true);

      final intention = Intention(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        nom: _isAnonyme ? 'Anonyme' : _nomController.text,
        email: _isAnonyme ? '' : _emailController.text,
        intention: _intentionController.text,
        dateSoumission: DateTime.now(),
        isAnonyme: _isAnonyme,
        estPubliee: _acceptePartage,
        nombreDePrieres: 0,
      );

      try {
        await SupabaseService.ajouterIntention(intention);
        _showSuccessDialog();
        _resetForm();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur: $e')),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  void _resetForm() {
    _nomController.clear();
    _emailController.clear();
    _intentionController.clear();
    setState(() {
      _isAnonyme = false;
      _acceptePartage = true;
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('🙏 Merci !'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Votre intention a été confiée à Saint Joseph.',
            ),
            const SizedBox(height: 8),
            if (_acceptePartage)
              const Text(
                'Elle est maintenant visible par la communauté qui priera pour vous.',
                style: TextStyle(fontSize: 13),
              )
            else
              const Text(
                'Elle sera priée en privé selon votre souhait.',
                style: TextStyle(fontSize: 13),
              ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/intentions_publiques');
            },
            child: const Text('Voir les intentions'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nomController.dispose();
    _emailController.dispose();
    _intentionController.dispose();
    super.dispose();
  }
}