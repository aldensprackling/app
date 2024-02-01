import 'dart:math';

class Logic {
  static String getRandomRoomCode() {
    final Random random = Random();
    const String characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String code = '';

    for (int i = 0; i < 4; i++) {
      code += characters[random.nextInt(characters.length)];
    }

    return code;
  }
}