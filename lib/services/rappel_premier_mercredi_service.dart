// lib/services/rappel_premier_mercredi_service.dart
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RappelPremierMercrediService {
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
        debugPrint('Notification cliquée: ${response.payload}');
      },
    );
  }

  // Envoyer une notification de test immédiate
  static Future<void> envoyerNotificationTest() async {
    try {
      const androidDetails = AndroidNotificationDetails(
        'test_channel',
        'Test Saint Joseph',
        channelDescription: 'Canal pour les notifications de test',
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
        id: 0,
        title: 'Saint Joseph',
        body: '🙏 Les notifications fonctionnent ! Que sa paix soit avec vous.',
        notificationDetails: details,
        payload: 'test_notification',
      );
      
      debugPrint('✅ Notification de test envoyée avec succès');
    } catch (e) {
      debugPrint('❌ Erreur lors de l\'envoi de la notification: $e');
    }
  }

  // Calculer le prochain premier mercredi du mois
  static DateTime _getProchainPremierMercredi() {
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month, 1);
    
    // Trouver le premier mercredi du mois courant
    int daysToAdd = (DateTime.wednesday - currentMonth.weekday + 7) % 7;
    DateTime firstWednesday = DateTime(now.year, now.month, 1 + daysToAdd, 9, 0, 0);
    
    // Si c'est déjà passé, prendre le mois prochain
    if (firstWednesday.isBefore(now)) {
      // Mois prochain (gérer le changement d'année)
      int nextMonth = now.month == 12 ? 1 : now.month + 1;
      int nextYear = now.month == 12 ? now.year + 1 : now.year;
      
      final nextMonthFirst = DateTime(nextYear, nextMonth, 1);
      daysToAdd = (DateTime.wednesday - nextMonthFirst.weekday + 7) % 7;
      firstWednesday = DateTime(nextYear, nextMonth, 1 + daysToAdd, 9, 0, 0);
    }
    
    return firstWednesday;
  }

  // Programmer le rappel mensuel
  static Future<void> programmerRappelMensuel() async {
    try {
      final rappelDate = _getProchainPremierMercredi();
      
      // Calculer le délai en millisecondes
      final now = DateTime.now();
      final delay = rappelDate.difference(now);
      
      if (delay.inMilliseconds > 0) {
        const androidDetails = AndroidNotificationDetails(
          'premier_mercredi_channel',
          'Premier Mercredi',
          channelDescription: 'Rappel pour le premier mercredi du mois',
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

        // Programmer la notification
        await Future.delayed(delay, () async {
          await _notifications.show(
            id: 1,
            title: 'Premier mercredi du mois',
            body: 'C\'est aujourd\'hui ! Récitez le chapelet de Saint Joseph avec dévotion.',
            notificationDetails: details,
            payload: 'premier_mercredi',
          );
          
          // Reprogrammer pour le mois prochain
          await programmerRappelMensuel();
        });
        
        debugPrint('✅ Rappel programmé pour le ${rappelDate.day}/${rappelDate.month} à 9h');
      }
    } catch (e) {
      debugPrint('❌ Erreur lors de la programmation du rappel: $e');
    }
  }

  // Activer les rappels
  static Future<void> activerRappels() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rappel_premier_mercredi', true);
    
    // Envoyer une notification de test
    await envoyerNotificationTest();
    
    // Programmer le rappel mensuel
    await programmerRappelMensuel();
    
    debugPrint('✅ Rappels activés avec succès');
  }

  // Désactiver les rappels
  static Future<void> desactiverRappels() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rappel_premier_mercredi', false);
    
    debugPrint('❌ Rappels désactivés');
  }

  // Activer ou désactiver selon le booléen
  static Future<void> setRappelActif(bool activer) async {
    if (activer) {
      await activerRappels();
    } else {
      await desactiverRappels();
    }
  }

  // Vérifier si les rappels sont actifs
  static Future<bool> estRappelActif() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rappel_premier_mercredi') ?? false;
  }

  // Réinitialiser les rappels au démarrage
  static Future<void> verifierEtReprogrammer() async {
    final actif = await estRappelActif();
    if (actif) {
      await programmerRappelMensuel();
      debugPrint('🔄 Rappels reprogrammés au démarrage');
    }
  }

  static Future<void> activerRappel(bool value) async {}
}