import 'dart:io';

class Util {
  static int validIntegerInput() {
    bool validInteger = false;
    int? userInput;
    while (!validInteger) {
      try {
        userInput = int.parse(stdin.readLineSync()!);
        validInteger = true;
      } catch (e) {
        print("INVALID INPUT PLZ ENTER AN INTEGER ");
        validInteger = false;
      }
    }
    return userInput ?? 0;
  }

  static Future<void> checkFile() async {
    File file = File('userdetails.json');
    await file.exists().then((exists) async {
      if (exists) {
        print('File exists.');
      } else {
        print('File does not exist. Creating file...');
        await file.create(recursive: true).then((file) {
          print('File created successfully.');
        }).catchError((error) {
          print('Error creating file: $error');
        });
      }
    });
  }
}
