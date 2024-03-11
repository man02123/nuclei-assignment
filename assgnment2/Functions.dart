import 'dart:convert';
import 'util.dart';
import 'user.dart';
import 'dart:io';

class Functions {
  static bool validateUserChoice(int userChoice) {
    if (userChoice < 1 || userChoice > 5) {
      print('please enter an integer ranging 1-5');
      return false;
    }
    return true;
  }

  static int takeUserChoice() {
    int validChoice = Util.validIntegerInput();

    while (validateUserChoice(validChoice) == false) {
      Functions.printOptions();
      validChoice = Util.validIntegerInput();
    }
    return validChoice;
  }

  static void printOptions() {
    print('Enter the as per options below');
    print('1:Add user details');
    print('2:Display the existing user detaiils');
    print('3:Delete the user details');
    print('4:Save the user details');
    print('5:Exit');
  }

  static int validRollNumber() {
    int isValid = Util.validIntegerInput();

    while (User.regieteredRollNumber.contains(isValid)) {
      print('please enter a unique roll number');
      isValid = Util.validIntegerInput();
    }
    return isValid;
  }

  static validUserAge() {
    bool isValid = false;
    int userAge = 0;
    while (!isValid) {
      print('enter the Valid  Age of user');
      userAge = Util.validIntegerInput();
      if (userAge > 0) isValid = true;
    }
    return userAge;
  }

  static int SortingOptions() {
    int validInteger = 0;
    do {
      print("enter 1 for sorting on basis of roll number");
      print("enter 2 for sorting on basis of Name");
      print("enter 3 for sorting on basis of age");
      print("enter 4 for sorting on basis of address");
      validInteger = Util.validIntegerInput();
    } while (validInteger < 1 || validInteger > 4);
    return validInteger;
  }
}
