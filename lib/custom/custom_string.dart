import 'dart:math';

String generateRandomString(int lengthOfString) {
  final random = Random();
  const allChars =
      'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
  final randomString = List.generate(lengthOfString,
          (index) => allChars[random.nextInt(allChars.length)]).join();
  return randomString;
}