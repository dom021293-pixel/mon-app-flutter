// lib/services/rappel_neuvaine_service.dart
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RappelNeuvaineService {
  static final FlutterLocalNotificationsPlugin _notifications = 
      FlutterLocalNotificationsPlugin();

  // Initialisation des notifications
  static Future<void> initialize() async {
    // Configuration Android
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    
    // Configuration iOS
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        debugPrint('Notification neuvaine cliquée: ${response.payload}');
      },
    );
  }

  // Envoyer une notification de test immédiate
  static Future<void> envoyerNotificationTest(String neuvaineTitre) async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'neuvaine_test_channel',
        'Test Neuvaine',
        channelDescription: 'Canal pour les tests de neuvaines',
        importance: Importance.high,
        priority: Priority.high,
        showWhen: true,
        enableVibration: true,
        playSound: true,
      );

      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      const details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _notifications.show(
        id: 100,
        title: 'Rappel de neuvaine',
        body: '🙏 N\'oubliez pas votre neuvaine "$neuvaineTitre"',
        notificationDetails: details,
        payload: 'neuvaine_test',
      );
      
      debugPrint('✅ Notification de test envoyée avec succès');
    } catch (e) {
      debugPrint('❌ Erreur lors de l\'envoi de la notification: $e');
    }
  }

  // Programmer un rappel quotidien pour une neuvaine (version simple)
  static Future<void> programmerRappelQuotidien({
    required String neuvaineId,
    required String neuvaineTitre,
    required int jour,
    required TimeOfDay heure,
  }) async {
    try {
      final now = DateTime.now();
      DateTime scheduledDate = DateTime(
        now.year,
        now.month,
        now.day,
        heure.hour,
        heure.minute,
      );
      
      // Si l'heure est déjà passée aujourd'hui, programmer pour demain
      if (now.isAfter(scheduledDate)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }
      
      // Calculer le délai en millisecondes
      final delay = scheduledDate.difference(now);
      
      if (delay.inMilliseconds > 0) {
        const androidDetails = AndroidNotificationDetails(
          'neuvaine_channel',
          'Rappel Neuvaine',
          channelDescription: 'Rappel quotidien pour vos neuvaines',
          importance: Importance.high,
          priority: Priority.high,
          showWhen: true,
          enableVibration: true,
          playSound: true,
        );

        const iosDetails = DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        );

        const details = NotificationDetails(
          android: androidDetails,
          iOS: iosDetails,
        );

        // Programmer la notification avec Future.delayed
        await Future.delayed(delay, () async {
          await _notifications.show(
            id: neuvaineId.hashCode,
            title: 'Rappel de neuvaine',
            body: 'N\'oubliez pas votre neuvaine "$neuvaineTitre" - Jour $jour',
            notificationDetails: details,
            payload: 'neuvaine_$neuvaineId',
          );
          
          // Reprogrammer pour le lendemain
          await programmerRappelQuotidien(
            neuvaineId: neuvaineId,
            neuvaineTitre: neuvaineTitre,
            jour: jour + 1,
            heure: heure,
          );
        });
        
        debugPrint('✅ Rappel programmé pour ${scheduledDate.hour}:${scheduledDate.minute}');
      }
    } catch (e) {
      debugPrint('❌ Erreur lors de la programmation du rappel: $e');
    }
  }

  // Activer le rappel pour une neuvaine
  static Future<void> activerRappelNeuvaine({
    required String neuvaineId,
    required String neuvaineTitre,
    required int jour,
    required TimeOfDay heure,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rappel_neuvaine_$neuvaineId', true);
    
    // Envoyer une notification de test
    await envoyerNotificationTest(neuvaineTitre);
    
    // Programmer le rappel quotidien
    await programmerRappelQuotidien(
      neuvaineId: neuvaineId,
      neuvaineTitre: neuvaineTitre,
      jour: jour,
      heure: heure,
    );
    
    debugPrint('✅ Rappel activé pour la neuvaine $neuvaineTitre');
  }

  // Désactiver le rappel pour une neuvaine
  static Future<void> desactiverRappelNeuvaine(String neuvaineId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rappel_neuvaine_$neuvaineId', false);
    
    // Note: On ne peut pas annuler un Future.delayed facilement
    // Pour une vraie application, il faudrait utiliser un système plus robuste
    debugPrint('❌ Rappel désactivé pour la neuvaine $neuvaineId');
  }

  // Activer ou désactiver selon le booléen
  static Future<void> setRappelNeuvaineActif({
    required String neuvaineId,
    required String neuvaineTitre,
    required int jour,
    required TimeOfDay heure,
    required bool activer,
  }) async {
    if (activer) {
      await activerRappelNeuvaine(
        neuvaineId: neuvaineId,
        neuvaineTitre: neuvaineTitre,
        jour: jour,
        heure: heure,
      );
    } else {
      await desactiverRappelNeuvaine(neuvaineId);
    }
  }

  // Vérifier si le rappel est actif pour une neuvaine
  static Future<bool> estRappelActif(String neuvaineId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rappel_neuvaine_$neuvaineId') ?? false;
  }

  // Réinitialiser les rappels au démarrage (à appeler dans main)
  static Future<void> verifierEtReprogrammerTous() async {
    // Cette méthode nécessiterait de stocker toutes les neuvaines actives
    // Pour l'instant, on laisse vide
    debugPrint('🔄 Vérification des rappels de neuvaines');
  }
}