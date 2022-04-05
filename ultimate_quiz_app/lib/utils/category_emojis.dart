String getCategoryEmojiTitle(String category) {
  switch (category) {
    case 'historija':
      return 'HISTORIJA ⌛️';
    case 'filmovi':
      return 'FILMOVI 🍿';
    case 'nauka':
      return 'NAUKA 💡';
    case 'biologija':
      return 'BIOLOGIJA 🦠';
    case 'književnost':
      return 'KNJIŽEVNOST 📖';
    case 'umjetnost':
      return 'UMJETNOST 🎨';
    case 'sport':
      return 'SPORT 🎾';
    case 'tehnologija':
      return 'TEHNOLOGIJA 🖥';
    case 'geografija':
      return 'GEOGRAFIJA 🌍';
    case 'muzika':
      return 'MUZIKA 🎶';

    default:
      return '';
  }
}
