import 'dart:io';

import 'Functions.dart';

import 'user.dart';

void main() {
  User.currentUsers = previousUsers();

  while (true) {
    printOptions();
    int validChoice = takeUserChoice();

    switch (validChoice) {
      case 1:
        User user = readDeatais();
        User.currentUsers.add(user);
        User.regieteredRollNumber.add(user.userRollNumber);

        break;

      case 2:
        int userChoice = SortingOptions();
        sortAscondition(userChoice);
        displayUser();
        break;

      case 3:
        deleteUser();
        break;
      case 4:
        saveUserDetails();
        break;
      case 5:
        exit(0);
      default:
        break;
    }
  }
}
