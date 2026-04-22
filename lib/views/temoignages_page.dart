// lib/views/temoignages_page.dart
import 'package:flutter/material.dart';
import 'package:joe/models/temoignage_model.dart';
import 'package:joe/services/supabase_temoignage_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class TemoignagesPage extends StatefulWidget {
  @override
  _TemoignagesPageState createState() => _TemoignagesPageState();
}

class _TemoignagesPageState extends State<TemoignagesPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _contenuController = TextEditingController();
  
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
          title: const Text('Partager un témoignage'),
          backgroundColor: Colors.brown,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Partager un témoignage'),
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
                              ? [Colors.green.shade400, Colors.green.shade700]
                              : [Colors.grey.shade400, Colors.grey.shade700],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            _isOnline ? Icons.celebration : Icons.wifi_off,
                            color: Colors.white,
                            size: 50,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _isOnline
                                ? 'Partagez votre témoignage'
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
                                ? 'Racontez comment Saint Joseph a exaucé vos prières et encouragez la communauté.'
                                : 'Vous n\'êtes pas connecté à Internet. Reconnectez-vous pour partager un témoignage.',
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
                              'Votre témoignage',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Partagez votre expérience et les grâces reçues.',
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
                                  activeColor: Colors.green,
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

                            const SizedBox(height: 12),

                            // Titre
                            TextFormField(
                              controller: _titreController,
                              enabled: _isOnline,
                              decoration: InputDecoration(
                                labelText: 'Titre *',
                                hintText: 'Ex: Une grâce inattendue, Ma famille guérie...',
                                prefixIcon: const Icon(Icons.title),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer un titre';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

                            // Témoignage
                            TextFormField(
                              controller: _contenuController,
                              enabled: _isOnline,
                              maxLines: 8,
                              maxLength: 2000,
                              decoration: InputDecoration(
                                labelText: 'Votre témoignage *',
                                hintText: 'Racontez votre expérience...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignLabelWithHint: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer votre témoignage';
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
                                  activeColor: Colors.green,
                                ),
                                const Expanded(
                                  child: Text(
                                    'J\'accepte que mon témoignage soit visible par la communauté',
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Bouton d'envoi
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: (_isOnline && !_isLoading) ? _soumettreTemoignage : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _isOnline ? Colors.green : Colors.grey,
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
                                            ? 'Partager mon témoignage'
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
                                        'Connectez-vous à Internet pour partager un témoignage.',
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

                  // Lien vers les témoignages publics
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/temoignages_publiques');
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.visibility,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Voir les témoignages',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Découvrez les grâces reçues par la communauté',
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

  Future<void> _soumettreTemoignage() async {
    if (_formKey.currentState!.validate() && _isOnline) {
      setState(() => _isLoading = true);

      final temoignage = Temoignage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        nom: _isAnonyme ? 'Anonyme' : _nomController.text,
        email: _isAnonyme ? null : _emailController.text,
        titre: _titreController.text,
        contenu: _contenuController.text,
        dateSoumission: DateTime.now(),
        isAnonyme: _isAnonyme,
        estPublie: _acceptePartage,
      );

      try {
        await SupabaseTemoignageService.ajouterTemoignage(temoignage);
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
    _titreController.clear();
    _contenuController.clear();
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
              'Votre témoignage a été partagé avec la communauté.',
            ),
            const SizedBox(height: 8),
            if (_acceptePartage)
              const Text(
                'Il est maintenant visible et pourra encourager d\'autres fidèles.',
                style: TextStyle(fontSize: 13),
              )
            else
              const Text(
                'Il sera gardé en privé selon votre souhait.',
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
              Navigator.pushNamed(context, '/temoignages_publiques');
            },
            child: const Text('Voir les témoignages'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
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
    _titreController.dispose();
    _contenuController.dispose();
    super.dispose();
  }
}