// lib/views/a_propos_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AProposPage extends StatefulWidget {
  @override
  _AProposPageState createState() => _AProposPageState();
}

class _AProposPageState extends State<AProposPage> {
  final String appVersion = '1.0.0';
  
  // Coordonnées personnelles
  String _nom = 'Développeur';
  String _role = 'Créateur de l\'application';
  String _email = 'wendkuunia12@gmail.com';
  String _siteWeb = '';
  String _description = 'Passionné par le développement d\'applications spirituelles et la dévotion à Saint Joseph.';
  
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _siteWebController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  
    bool _isEditing = false;
  bool _isAdmin = false; // Variable pour vérifier si l'utilisateur est admin
  final String _adminPassword = 'admin123';

  @override
  void initState() {
    super.initState();
    _checkAdminStatus(); 
    _chargerCoordonnees();
  }
   Future<void> _checkAdminStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool isAdmin = prefs.getBool('is_admin') ?? false;
    setState(() {
      _isAdmin = isAdmin;
    });
  }

   // Fonction pour se connecter en tant qu'admin
  Future<void> _loginAsAdmin() async {
    TextEditingController passwordController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Accès administrateur'),
        content: TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Mot de passe',
            hintText: 'Entrez le mot de passe admin',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (passwordController.text == _adminPassword) {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('is_admin', true);
                setState(() {
                  _isAdmin = true;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('✅ Mode admin activé'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('❌ Mot de passe incorrect'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text('Se connecter'),
          ),
        ],
      ),
    );
  }
 // Fonction pour se déconnecter du mode admin
  Future<void> _logoutAdmin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_admin', false);
    setState(() {
      _isAdmin = false;
      _isEditing = false; // Fermer le mode édition si ouvert
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🔒 Mode admin désactivé'),
        backgroundColor: Colors.grey,
      ),
    );
  }

  Future<void> _chargerCoordonnees() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nom = prefs.getString('coordonnees_nom') ?? 'Développeur';
      _role = prefs.getString('coordonnees_role') ?? 'Créateur de l\'application';
      _email = prefs.getString('coordonnees_email') ?? 'wendkuunia12@gmail.com';
      _siteWeb = prefs.getString('coordonnees_siteWeb') ?? '';
      _description = prefs.getString('coordonnees_description') ?? 'Passionné par le développement d\'applications spirituelles et la dévotion à Saint Joseph.';
      
      _nomController.text = _nom;
      _roleController.text = _role;
      _emailController.text = _email;
      _siteWebController.text = _siteWeb;
      _descriptionController.text = _description;
    });
  }

  Future<void> _sauvegarderCoordonnees() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('coordonnees_nom', _nomController.text);
    await prefs.setString('coordonnees_role', _roleController.text);
    await prefs.setString('coordonnees_email', _emailController.text);
    await prefs.setString('coordonnees_siteWeb', _siteWebController.text);
    await prefs.setString('coordonnees_description', _descriptionController.text);
    
    setState(() {
      _nom = _nomController.text;
      _role = _roleController.text;
      _email = _emailController.text;
      _siteWeb = _siteWebController.text;
      _description = _descriptionController.text;
      _isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Coordonnées sauvegardées !'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos'),
        backgroundColor: Colors.brown,
        elevation: 0,
        actions: [
          // Bouton admin (visible uniquement si admin)
          if (_isAdmin) ...[
            IconButton(
              icon: Icon(_isEditing ? Icons.close : Icons.edit),
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                  if (!_isEditing) {
                    _nomController.text = _nom;
                    _roleController.text = _role;
                    _emailController.text = _email;
                    _siteWebController.text = _siteWeb;
                    _descriptionController.text = _description;
                  }
                });
              },
              tooltip: _isEditing ? 'Annuler' : 'Modifier',
            ),
            if (_isEditing)
              IconButton(
                icon: const Icon(Icons.save),
                onPressed: _sauvegarderCoordonnees,
                tooltip: 'Sauvegarder',
              ),
          ] else ...[
            // Bouton pour se connecter en tant qu'admin
            IconButton(
              icon: const Icon(Icons.admin_panel_settings),
              onPressed: _loginAsAdmin,
              tooltip: 'Mode admin',
            ),
          ],
          // Bouton déconnexion admin (si admin connecté)
          if (_isAdmin)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _logoutAdmin,
              tooltip: 'Quitter mode admin',
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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // En-tête avec logo
            _buildHeader(),
            
            const SizedBox(height: 24),
            
            // Section Mes coordonnées
            _buildCoordonneesSection(),
            
            const SizedBox(height: 16),
            
            // Description de l'application
            _buildSection(
              icon: Icons.info_outline,
              title: 'À propos de l\'application',
              content: '''
Cette application est dédiée à la dévotion à Saint Joseph, père nourricier de Jésus et époux de la Vierge Marie. Elle a été conçue pour nous aider à prier et à méditer sur la vie de ce grand saint, si important dans la tradition chrétienne.

Saint Joseph a été déclaré Patron de l'Église universelle par le Pape Pie IX en 1870. Le Pape François a consacré l'année 2021 comme "Année Saint Joseph" et a publié la lettre apostolique "Patris corde" (Avec un cœur de père).

Que cette application nous aide à grandir dans votre dévotion à Saint Joseph et à découvrir la puissance de son intercession. ''',
            ),
            
            const SizedBox(height: 16),
            
            // Fonctionnalités
            _buildSection(
              icon: Icons.star,
              title: 'Fonctionnalités',
              content: '',
              isList: true,
             items: [
  '📿 Chapelet de Saint Joseph',
  '🙏 Neuvaines complètes avec méditations',
  '📖 Bibliothèque de prières (30+ prières)',
  '💭 Enseignements des papes et saints (40+ textes)',
  '😢 7 Douleurs et 7 Joies de Saint Joseph',
  '🔔 Rappel pour le premier mercredi du mois',
  '📝 Notes personnelles pour les neuvaines',
  '🎵 Chants à Saint Joseph',
  '📖 Saints du jour',
  '🙏 Intentions de prière partagées en ligne',
  '📅 7 Dimanches de Saint Joseph',
  '🕊️ Prière du manteau de Saint Joseph',
  '🔔 Rappels quotidiens pour les prières',
  '📈 Progression des neuvaines et bien d\'autres...',
],
            ),
            
            const SizedBox(height: 16),
            
            // Sources et inspirations
            _buildSection(
              icon: Icons.source,
              title: 'Sources et inspirations',
              content: '''
Les prières et méditations de cette application sont inspirées de sources traditionnelles de l'Église catholique, notamment :

• La lettre apostolique "Patris corde" du Pape François
• L'exhortation "Redemptoris Custos" de Saint Jean-Paul II
• Les écrits des saints : Thérèse de Lisieux, François de Sales, Bernard de Clairvaux
• La tradition des 7 Douleurs et 7 Joies de Saint Joseph
• Le chapelet de Saint Joseph selon la tradition populaire

Tous les textes ont été compilés dans un esprit de fidélité à la tradition de l'Église et de dévotion à Saint Joseph.''',
            ),
            
            const SizedBox(height: 16),
            
            // Crédits
            _buildCredits(context),
            
            const SizedBox(height: 16),
            
            // Version et contact
            _buildVersionInfo(context),
            
            const SizedBox(height: 24),
            
            // Boutons d'action
            _buildActionButtons(context),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.brown.shade300, Colors.brown.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.church,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Prière à Saint Joseph',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Version $appVersion',
              style: TextStyle(
                fontSize: 14,
                color: Colors.amber.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoordonneesSection() {
    return Card(
      elevation: 4,
      shadowColor: Colors.brown.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.brown,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Mes coordonnées',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const Spacer(),
                  if (!_isEditing)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            size: 14,
                            color: Colors.amber.shade800,
                          ),
                          const SizedBox(width: 1),
                          Text(
                            'Personnalisable',
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.amber.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              
              if (_isEditing)
                _buildEditForm()
              else
                _buildCoordonneesDisplay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoordonneesDisplay() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildInfoTile(
                icon: Icons.badge,
                label: 'Nom',
                value: _nom,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildInfoTile(
                icon: Icons.work,
                label: 'Rôle',
                value: _role,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildInfoTile(
                icon: Icons.email,
                label: 'Email',
                value: _email,
                isEmail: true,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildInfoTile(
                icon: Icons.language,
                label: 'Site web',
                value: _siteWeb,
                isWeb: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
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
                    Icons.description,
                    size: 16,
                    color: Colors.brown.shade600,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.brown.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                _description,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
    bool isEmail = false,
    bool isWeb = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.brown.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 14,
                color: Colors.brown.shade600,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.brown.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          InkWell(
            onTap: (isEmail || isWeb) ? () => _launchLink(value, isEmail, isWeb) : null,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: (isEmail || isWeb) ? Colors.blue : Colors.black87,
                decoration: (isEmail || isWeb) ? TextDecoration.underline : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditForm() {
    return Column(
      children: [
        TextField(
          controller: _nomController,
          decoration: InputDecoration(
            labelText: 'Nom',
            prefixIcon: Icon(Icons.badge, color: Colors.brown),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _roleController,
          decoration: InputDecoration(
            labelText: 'Rôle / Fonction',
            prefixIcon: Icon(Icons.work, color: Colors.brown),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email, color: Colors.brown),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _siteWebController,
          keyboardType: TextInputType.url,
          decoration: InputDecoration(
            labelText: 'Site web',
            prefixIcon: Icon(Icons.language, color: Colors.brown),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _descriptionController,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Description',
            prefixIcon: Icon(Icons.description, color: Colors.brown),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            alignLabelWithHint: true,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _isEditing = false;
                    _nomController.text = _nom;
                    _roleController.text = _role;
                    _emailController.text = _email;
                    _siteWebController.text = _siteWeb;
                    _descriptionController.text = _description;
                  });
                },
                icon: const Icon(Icons.cancel),
                label: const Text('Annuler'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey,
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: _sauvegarderCoordonnees,
                icon: const Icon(Icons.save),
                label: const Text('Sauvegarder'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
    bool isList = false,
    List<String>? items,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.brown.shade700,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (!isList)
              Text(
                content,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black87,
                ),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items!.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.brown.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                )).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCredits(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Remerciements',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Nous remercions tous ceux qui ont contribué de près ou de loin à cette application par leurs prières, leurs conseils et leurs soutiens.',
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildCreditChip('Les Saints', Icons.person),
                _buildCreditChip('Ma fiancée', Icons.person),
                 _buildCreditChip('Mme Christel Damiba', Icons.person),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreditChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.brown.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: Colors.brown.shade600,
          ),
          const SizedBox(width: 6),
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

  Widget _buildVersionInfo(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.brown.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.update,
                color: Colors.brown,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dernière mise à jour',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Mars 2026',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.brown.shade100,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.email,
                color: Colors.brown,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'wendkuunia12@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            context,
            icon: Icons.star,
            label: 'Noter',
            color: Colors.amber,
            onTap: () {
              _showComingSoon(context, 'Noter l\'application');
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            context,
            icon: Icons.share,
            label: 'Partager',
            color: Colors.green,
            onTap: () {
              Share.share(
                'Découvrez l\'application "Prière à Saint Joseph" pour Android et iOS ! Une application magnifique pour approfondir votre dévotion à Saint Joseph. 🙏\n\nDéveloppée par $_nom',
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature - Fonctionnalité à venir'),
        backgroundColor: Colors.brown,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Future<void> _launchLink(String value, bool isEmail, bool isWeb) async {
    String url;
    if (isEmail) {
      url = 'mailto:$value';
    } else if (isWeb) {
      url = value.startsWith('http') ? value : 'https://$value';
    } else {
      return;
    }
    
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}