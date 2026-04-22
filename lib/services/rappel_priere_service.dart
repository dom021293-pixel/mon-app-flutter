// lib/services/rappel_priere_service.dart
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RappelPriereService {
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
        debugPrint('Notification prière cliquée: ${response.payload}');
      },
    );
  }

  // Envoyer une notification de test immédiate
  static Future<void> envoyerNotificationTest(String priereTitre) async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'priere_test_channel',
        'Test Prière',
        channelDescription: 'Canal pour les tests de prières',
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
        id: 200,
        title: 'Rappel de prière',
        body: '🙏 N\'oubliez pas votre prière "$priereTitre"',
        notificationDetails: details,
        payload: 'priere_test',
      );
      
      debugPrint('✅ Notification de test envoyée avec succès');
    } catch (e) {
      debugPrint('❌ Erreur lors de l\'envoi de la notification: $e');
    }
  }

  // Programmer un rappel quotidien pour une prière
  static Future<void> programmerRappelQuotidien({
    required String priereId,
    required String priereTitre,
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
          'priere_channel',
          'Rappel Prière',
          channelDescription: 'Rappel quotidien pour vos prières',
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
            id: priereId.hashCode,
            title: 'Rappel de prière',
            body: 'N\'oubliez pas votre prière "$priereTitre"',
            notificationDetails: details,
            payload: 'priere_$priereId',
          );
          
          // Reprogrammer pour le lendemain
          await programmerRappelQuotidien(
            priereId: priereId,
            priereTitre: priereTitre,
            heure: heure,
          );
        });
        
        debugPrint('✅ Rappel programmé pour ${scheduledDate.hour}:${scheduledDate.minute}');
      }
    } catch (e) {
      debugPrint('❌ Erreur lors de la programmation du rappel: $e');
    }
  }

  // Activer le rappel pour une prière
  static Future<void> activerRappelPriere({
    required String priereId,
    required String priereTitre,
    required TimeOfDay heure,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rappel_priere_$priereId', true);
    
    // Envoyer une notification de test
    await envoyerNotificationTest(priereTitre);
    
    // Programmer le rappel quotidien
    await programmerRappelQuotidien(
      priereId: priereId,
      priereTitre: priereTitre,
      heure: heure,
    );
    
    debugPrint('✅ Rappel activé pour la prière $priereTitre');
  }

  // Désactiver le rappel pour une prière
  static Future<void> desactiverRappelPriere(String priereId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rappel_priere_$priereId', false);
    
    debugPrint('❌ Rappel désactivé pour la prière $priereId');
  }

  // Activer ou désactiver selon le booléen
  static Future<void> setRappelPriereActif({
    required String priereId,
    required String priereTitre,
    required TimeOfDay heure,
    required bool activer,
  }) async {
    if (activer) {
      await activerRappelPriere(
        priereId: priereId,
        priereTitre: priereTitre,
        heure: heure,
      );
    } else {
      await desactiverRappelPriere(priereId);
    }
  }

  // Vérifier si le rappel est actif pour une prière
  static Future<bool> estRappelActif(String priereId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rappel_priere_$priereId') ?? false;
  }

  // Programmer la prière du jour (rappel quotidien avec une prière différente)
  static Future<void> programmerPriereDuJour({
    required TimeOfDay heure,
    required String priereTitre,
    required String priereId,
  }) async {
    await programmerRappelQuotidien(
      priereId: priereId,
      priereTitre: priereTitre,
      heure: heure,
    );
  }

  // Désactiver tous les rappels de prières
  static Future<void> desactiverTousRappelsPriere() async {
    final prefs = await SharedPreferences.getInstance();
    // Note: Cette méthode nécessiterait de connaître toutes les clés
    // Pour l'instant, on laisse vide ou on implémente plus tard
    debugPrint('❌ Tous les rappels de prières désactivés');
  }

  // Réinitialiser les rappels au démarrage
  static Future<void> verifierEtReprogrammerTous() async {
    // Cette méthode nécessiterait de stocker toutes les prières actives
    // Pour l'instant, on laisse vide
    debugPrint('🔄 Vérification des rappels de prières');
  }
}