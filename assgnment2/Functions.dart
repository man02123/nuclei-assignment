import 'dart:convert';
import 'util.dart';
import 'user.dart';
import 'dart:io';

bool validateUserChoice(int userChoice) {
  if (userChoice < 1 || userChoice > 5) {
    print('please enter an integer ranging 1-5');
    return false;
  }
  return true;
}

int takeUserChoice() {
  int validChoice = Util.validateInteger();

  while (validateUserChoice(validChoice) == false) {
    printOptions();
    validChoice = Util.validateInteger();
  }
  return validChoice;
}

void printOptions() {
  print('Enter the as per options below');
  print('1:Add user details');
  print('2:Display the existing user detaiils');
  print('3:Delete the user details');
  print('4:Save the user details');
  print('5:Exit');
}

int validRollNumber() {
  int isValid = Util.validateInteger();

  while (User.regieteredRollNumber.contains(isValid)) {
    print('please enter a unique roll number');
    isValid = Util.validateInteger();
  }
  return isValid;
}

List<String> readCources() {
  Set<String> courcesOffered = {"A", "B", "C", "D", "E", "F"};
  Set<String> currentCources = {};

  print('Cources offered are A,B,C,D,E,F');
  print("enter the unique cources offered");
  while (currentCources.length < 4) {
    String cource = stdin.readLineSync()!;
    if (courcesOffered.contains(cource)) currentCources.add(cource);
  }

  print('choosen cources are');
  List<String> courceChosen = [];

  for (var curr in currentCources) {
    print(curr);
    courceChosen.add(curr);
  }

  return courceChosen;
}

int validUserAge() {
  bool isValid = false;
  int userAge = 0;
  while (!isValid) {
    print('enter the Valid  Age of user');
    userAge = Util.validateInteger();
    if (userAge > 0 && userAge < 100) isValid = true;
  }
  return userAge;
}

User readDeatais() {
  String userName = '';
  int userRollNumber = 0;
  int userAge = 0;
  String userAddress = '';

  print('enter the name of user');
  userName = stdin.readLineSync()!;

  print('enter the Roll number of user');

  userRollNumber = validRollNumber();

  print('enter the address of user');
  userAddress = stdin.readLineSync()!;

  userAge = validUserAge();

  List<String> userCources = readCources();

  return User(
      userName: userName,
      userAge: userAge,
      userAddress: userAddress,
      userRollNumber: userRollNumber,
      userCources: userCources);
}

void displayUser() {
  if (User.currentUsers.length == 0) {
    print("no registered Users avilable ");
  }
  print("enter 1 for displaying in decending order");
  int userChoice = Util.validateInteger();
  if (userChoice != 1) {
    for (var user in User.currentUsers) {
      print(user.userName);
      print(user.userRollNumber);
    }
  } else {
    List<User> reversedUsers = User.currentUsers.reversed.toList();
    for (var user in reversedUsers) {
      print(user.userName);
      print(user.userRollNumber);
    }
  }
}

void sortonRollNumber() {
  List<User> currentUsers = User.currentUsers;

  currentUsers.sort((a, b) {
    return a.userRollNumber
        .compareTo(b.userRollNumber); // change as per question
  });
  User.currentUsers = currentUsers;
}

void sortOnName() {
  List<User> currentUsers = User.currentUsers;

  currentUsers.sort((a, b) {
    if (a.userName != b.userName)
      return a.userName.compareTo(b.userName);
    else
      return a.userRollNumber
          .compareTo(b.userRollNumber); // change as per question
  });
  User.currentUsers = currentUsers;
}

void sortOnAge() {
  List<User> currentUsers = User.currentUsers;

  currentUsers.sort((a, b) {
    return a.userAge.compareTo(b.userAge); // change as per question
  });
  User.currentUsers = currentUsers;
}

void sortOnAddress() {
  List<User> currentUsers = User.currentUsers;

  currentUsers.sort((a, b) {
    return a.userAddress.compareTo(b.userAddress); // change as per question
  });
  User.currentUsers = currentUsers;
}

void sortAscondition(int userChoice) {
  switch (userChoice) {
    case 1:
      sortonRollNumber();
    case 2:
      sortOnName();
    case 3:
      sortOnAge();
    case 4:
      sortOnAddress();
    default:
      sortonRollNumber();
  }
}

void deleteUser() {
  print('enter a valid roll number');
  int inputRollNumber = Util.validateInteger();
  bool userDeleted = false;

  for (int userIndex = 0; userIndex < User.currentUsers.length; userIndex++) {
    if (User.currentUsers[userIndex].userRollNumber == inputRollNumber) {
      print(
          'user deleted with roll number ${inputRollNumber} : name ${User.currentUsers[userIndex].userName}');
      User.currentUsers.removeAt(userIndex);
      userDeleted = true;
    }
  }
  if (!userDeleted) {
    print('This roll number dosent exist');
  }
}

void saveUserDetails() {
  List<Map<String, dynamic>> convertedObjected = [];
  for (var user in User.currentUsers) {
    convertedObjected.add(user.toJson());
  }

  var json = jsonEncode(convertedObjected);
  File('userdetails.json').writeAsStringSync(jsonEncode(json));
}

void checkFile() {
  File file = File('userdetails.json');
  file.exists().then((exists) {
    if (exists) {
      print('File exists.');
    } else {
      print('File does not exist. Creating file...');
      file.create().then((file) {
        print('File created successfully.');
      }).catchError((error) {
        print('Error creating file: $error');
      });
    }
  });
}

List<User> previousUsers() {
  checkFile();
  String jsonString = File('userdetails.json').readAsStringSync();
  if (jsonString.length > 0) {
    var decodedUserList = json.decode(jsonString);
    const JsonDecoder decoder = JsonDecoder();
    var listOfUserAsMap = decoder.convert(decodedUserList);

    List<User> savedUsers = [];

    for (var object in listOfUserAsMap) {
      savedUsers.add(User.fromJson(object));
    }

    return savedUsers;
  } else
    return [];
}

int SortingOptions() {
  int validInteger = 0;
  do {
    print("enter 1 for sorting on basis of roll number");
    print("enter 2 for sorting on basis of Name");
    print("enter 3 for sorting on basis of age");
    print("enter 4 for sorting on basis of address");
    validInteger = Util.validateInteger();
  } while (validInteger < 1 || validInteger > 4);
  return validInteger;
}
