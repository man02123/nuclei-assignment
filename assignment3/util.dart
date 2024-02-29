import 'dart:io';

class Util {
  static int validUserInput() {
    bool validInteger = false;
    late int userInput;
    while (!validInteger) {
      try {
        userInput = int.parse(stdin.readLineSync()!);
        validInteger = true;
      } catch (e) {
        print("INVALID INPUT PLZ ENTER AN INTEGER ");
        validInteger = false;
      }
    }
    return userInput;
  }
}
