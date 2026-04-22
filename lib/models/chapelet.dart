// models/chapelet.dart
class ChapeletSaintJoseph {
  static const int totalGrains = 20; // 4 dizaines de 5 grains
  List<bool> grainsPries = List.filled(20, false);
  int priereEnCours = 0;
  
  void avancer() {
    if (priereEnCours < totalGrains - 1) {
      priereEnCours++;
      grainsPries[priereEnCours] = true;
    }
  }
  
  void reset() {
    grainsPries = List.filled(20, false);
    priereEnCours = 0;
  }
}