// lib/widgets/audio_player_widget.dart
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl; // Peut être une URL en ligne ou un chemin local
  final String titre;

  const AudioPlayerWidget({Key? key, required this.audioUrl, required this.titre}) : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer? _audioPlayer;
  PlayerState playerState = PlayerState.stopped;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  bool _isLoading = false;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer();

    _audioPlayer!.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() {
          _duration = duration;
          _isInitialized = true;
          _hasError = false;
        });
      }
    });

    _audioPlayer!.onPositionChanged.listen((position) {
      if (mounted) {
        setState(() {
          _position = position;
        });
      }
    });

    _audioPlayer!.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          _isPlaying = false;
          _position = Duration.zero;
        });
      }
    });

    _audioPlayer!.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          playerState = state;
          _isPlaying = state == PlayerState.playing;
        });
      }
    });
  }

  Future<void> _playPause() async {
    if (_isPlaying) {
      await _audioPlayer!.pause();
    } else {
      setState(() {
        _isLoading = true;
        _hasError = false;
      });
      
      try {
        // Détecter si c'est une URL en ligne ou un fichier local
        if (widget.audioUrl.startsWith('http')) {
          // URL en ligne
          debugPrint('🎵 Lecture URL en ligne: ${widget.audioUrl}');
          if (_position == Duration.zero || _position == _duration) {
            await _audioPlayer!.play(UrlSource(widget.audioUrl));
          } else {
            await _audioPlayer!.resume();
          }
        } else {
          // Fichier local
          debugPrint('🎵 Lecture fichier local: ${widget.audioUrl}');
          if (_position == Duration.zero || _position == _duration) {
            await _audioPlayer!.play(DeviceFileSource(widget.audioUrl));
          } else {
            await _audioPlayer!.resume();
          }
        }
      } catch (e) {
        debugPrint('❌ Erreur lecture audio: $e');
        
        setState(() {
          _hasError = true;
        });
        
        // Afficher un message d'erreur à l'utilisateur
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.error_outline, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Impossible de lire le fichier audio',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  Future<void> stop() async {
    await _audioPlayer!.stop();
    if (mounted) {
      setState(() {
        _position = Duration.zero;
        _isPlaying = false;
      });
    }
  }

  Future<void> _seek(double value) async {
    final position = Duration(seconds: value.toInt());
    await _audioPlayer!.seek(position);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _audioPlayer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _hasError ? Colors.red.shade300 : Colors.brown.shade200),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.music_note, // Changé de audio_file à music_note pour plus de clarté
                color: _hasError ? Colors.red : Colors.brown,
                size: 24,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  widget.titre,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _hasError ? Colors.red : Colors.brown.shade800,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (_hasError)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Erreur',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Barre de progression
          if (_duration > Duration.zero && !_hasError) ...[
            Slider(
              value: _position.inSeconds.toDouble(),
              min: 0,
              max: _duration.inSeconds.toDouble(),
              onChanged: _seek,
              activeColor: Colors.brown,
              inactiveColor: Colors.brown.shade200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(_position),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    _formatDuration(_duration),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ] else if (_isLoading) ...[
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(color: Colors.brown),
              ),
            ),
          ] else if (_hasError) ...[
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Fichier audio non disponible',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
          
          const SizedBox(height: 8),
          
          // Contrôles (cachés en cas d'erreur)
          if (!_hasError) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10),
                  onPressed: _isInitialized ? () async {
                    final newPosition = _position - const Duration(seconds: 10);
                    if (newPosition > Duration.zero) {
                      await _audioPlayer!.seek(newPosition);
                    } else {
                      await _audioPlayer!.seek(Duration.zero);
                    }
                  } : null,
                  color: Colors.brown,
                  iconSize: 30,
                ),
                const SizedBox(width: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      _isLoading
                          ? Icons.hourglass_empty
                          : (_isPlaying ? Icons.pause : Icons.play_arrow),
                      color: Colors.white,
                    ),
                    onPressed: _isLoading ? null : _playPause,
                    iconSize: 36,
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.forward_10),
                  onPressed: _isInitialized ? () async {
                    final newPosition = _position + const Duration(seconds: 10);
                    if (newPosition < _duration) {
                      await _audioPlayer!.seek(newPosition);
                    } else {
                      await _audioPlayer!.seek(_duration);
                    }
                  } : null,
                  color: Colors.brown,
                  iconSize: 30,
                ),
              ],
            ),
            
            if (_isPlaying) ...[
              const SizedBox(height: 8),
              Text(
                'Lecture en cours...',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.brown,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ] else ...[
            // Bouton pour réessayer en cas d'erreur
            Center(
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    _hasError = false;
                    _isInitialized = false;
                    _duration = Duration.zero;
                  });
                  _playPause();
                },
                icon: const Icon(Icons.refresh, color: Colors.brown),
                label: const Text('Réessayer', style: TextStyle(color: Colors.brown)),
              ),
            ),
          ],
        ],
      ),
    );
  }
}