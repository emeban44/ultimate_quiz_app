import 'package:flutter/material.dart';

enum Rank {
  panj,
  bronze,
  silver,
  gold,
  emerald,
  platinum,
  diamond,
}

class RankStyleData {
  static final rankStyle = <dynamic>[];

  static String getImage(String rank) {
    switch (rank) {
      case 'panj':
        return 'assets/images/panj.png';
      case 'bronze':
        return 'assets/images/bronze.png';
      case 'silver':
        return 'assets/images/silver.png';
      case 'gold':
        return 'assets/images/gold.png';
      case 'emerald':
        return 'assets/images/emerald.png';
      case 'platinum':
        return 'assets/images/platinum.png';
      case 'diamond':
        return 'assets/images/diamond.png';
      default:
        return 'assets/images/higlogo.png';
    }
  }

  static LinearGradient getGradient(String rank) {
    switch (rank) {
      case 'panj':
        return LinearGradient(
          colors: [
            Colors.brown,
            Colors.brown.shade900,
          ],
        );
      case 'bronze':
        return LinearGradient(
          colors: [
            Colors.brown,
            Colors.brown.shade900,
          ],
        );
      case 'silver':
        return LinearGradient(
          colors: [
            Colors.brown,
            Colors.brown.shade900,
          ],
        );
      case 'gold':
        return LinearGradient(
          colors: [
            Colors.brown,
            Colors.brown.shade900,
          ],
        );
      case 'emerald':
        return LinearGradient(
          colors: [
            Colors.brown,
            Colors.brown.shade900,
          ],
        );
      case 'platinum':
        return LinearGradient(
          colors: [
            Colors.brown,
            Colors.brown.shade900,
          ],
        );
      case 'diamond':
        return LinearGradient(
          colors: [
            Colors.brown,
            Colors.brown.shade900,
          ],
        );
      default:
        return LinearGradient(
          colors: [
            Colors.brown,
            Colors.brown.shade900,
          ],
        );
    }
  }
}
