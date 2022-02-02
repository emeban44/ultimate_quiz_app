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
      case 'strucnjak':
        return 'assets/images/strucnjak.png';
      default:
        return 'assets/images/higlogo.png';
    }
  }

  static Color getRankTextColor(String rank) {
    switch (rank) {
      case 'panj':
        return Colors.brown.shade50;
      case 'bronze':
        return Colors.deepOrange.shade50; //Colors.deepOrange.shade100;
      case 'silver':
        return Colors.grey.shade900;
      case 'gold':
        return Colors.yellow.shade50; //Color.fromRGBO(153, 101, 21, 1);
      case 'emerald':
        return Colors.green.shade100;
      case 'platinum':
        return Colors.teal.shade50;
      case 'diamond':
        return Colors.deepPurple.shade50;
      case 'strucnjak':
        return Colors.red.shade50;
      default:
        return Colors.black;
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
        return const LinearGradient(
          colors: [
            Color.fromRGBO(210, 105, 30, 0.6),
            Color.fromRGBO(210, 105, 30, 0.9),
            Color.fromRGBO(210, 105, 30, 0.85),
          ],
        );
      case 'silver':
        return const LinearGradient(
          colors: [
            Color.fromRGBO(220, 220, 220, 0.65),
            Color.fromRGBO(220, 220, 220, 0.9),
            Color.fromRGBO(220, 220, 220, 0.75),
          ],
        );
      case 'gold':
        return const LinearGradient(
          colors: [
            Color.fromRGBO(229, 183, 59, 0.8),
            Color.fromRGBO(229, 183, 59, 0.9),
            Color.fromRGBO(229, 183, 59, 0.75),
          ],
        );
      case 'emerald':
        return const LinearGradient(
          colors: [
            Color.fromRGBO(28, 172, 120, 0.8),
            Color.fromRGBO(28, 172, 120, 0.9),
            Color.fromRGBO(28, 172, 120, 0.75),
          ],
        );
      case 'platinum':
        return LinearGradient(
          colors: [
            Colors.cyan.shade800,
            Colors.cyan.shade700,
            Colors.cyan.shade500,
            Colors.cyan.shade700,
          ],
        );
      case 'diamond':
        return LinearGradient(
          colors: [
            Colors.deepPurple.shade900,
            Colors.deepPurple.shade700,
            Colors.deepPurple.shade500,
            Colors.deepPurple.shade900,
          ],
        );
      case 'strucnjak':
        return LinearGradient(
          colors: [
            Color.fromRGBO(56, 0, 0, 1),
            // Colors.black.withOpacity(0.5),
            // Colors.black26,
            Color.fromRGBO(127, 23, 52, 1),
            Color.fromRGBO(97, 0, 0, 0.75),
            Color.fromRGBO(56, 0, 0, 0.8)
            // Colors.pink.shade800,
            // Colors.pink.shade900,
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
