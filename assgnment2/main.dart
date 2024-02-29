import 'dart:io';

import 'Functions.dart';

import 'user.dart';

void main() async {
  User.currentUsers = await User.previousUsers();

  while (true) {
    printOptions();
    int validChoice = takeUserChoice();

    switch (validChoice) {
      case 1:
        User user = User.readDeatais();
        User.currentUsers.add(user);
        User.regieteredRollNumber.add(user.userRollNumber);

        break;

      case 2:
        int userChoice = SortingOptions();
        User.sortAscondition(userChoice);
        User.displayUser();
        break;

      case 3:
        User.deleteUser();
        break;
      case 4:
        User.saveUserDetails();
        break;
      case 5:
        exit(0);
      default:
        break;
    }
  }
}
