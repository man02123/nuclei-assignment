import 'util.dart';
import 'dart:convert';
import 'dart:io';
import 'Functions.dart';

class User {
  final String userName;
  final int userAge;
  final String userAddress;
  late int userRollNumber;
  late List<String> userCources;
  static Set<int> regieteredRollNumber = {};
  static List<User> currentUsers = [];

  User(
      {required this.userName,
      required this.userAge,
      required this.userAddress,
      required this.userRollNumber,
      required this.userCources});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userName: json['userName'],
        userRollNumber: json['userRollNumber'],
        userCources: List<String>.from(json['userCources']),
        userAge: json['userAge'],
        userAddress: json['userAddress']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': this.userName,
      'userRollNumber': this.userRollNumber,
      'userCourses': this.userCources,
      'userAge': this.userAge,
      'userAddress': this.userAddress,
    };
  }

  static Future<List<User>> previousUsers() async {
    await Util.checkFile();
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

  static void saveUserDetails() {
    List<Map<String, dynamic>> convertedObjected = [];
    for (var user in User.currentUsers) {
      convertedObjected.add(user.toJson());
    }

    var json = jsonEncode(convertedObjected);
    File('userdetails.json').writeAsStringSync(jsonEncode(json));
  }

  static void deleteUser() {
    print('enter a valid roll number');
    int inputRollNumber = Util.validIntegerInput();
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

  static List<String> readCources() {
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

  static User readDeatais() {
    String userName = '';
    int userRollNumber = 0;
    int userAge = 0;
    String userAddress = '';

    print('enter the name of user');
    userName = stdin.readLineSync()!;

    print('enter the Roll number of user');

    userRollNumber = Functions.validRollNumber();

    print('enter the address of user');
    userAddress = stdin.readLineSync()!;

    userAge = Functions.validUserAge();

    List<String> userCources = readCources();

    return User(
        userName: userName,
        userAge: userAge,
        userAddress: userAddress,
        userRollNumber: userRollNumber,
        userCources: userCources);
  }

  static void displayUser() {
    if (User.currentUsers.length == 0) {
      print("no registered Users avilable ");
    }
    print("enter 1 for displaying in decending order");
    print('enter 2 to display the particular student');
    int userChoice = Util.validIntegerInput();
    if (userChoice != 1) {
      for (var user in User.currentUsers) {
        print(user.userName);
        print(user.userRollNumber);
      }
    } else if (userChoice == 2) {
      int rollNo = Util.validIntegerInput();

      List<User> reversedUsers = User.currentUsers.reversed.toList();
      for (var user in reversedUsers) {
        if (rollNo == user.userRollNumber) print(user.userName);
        print(user.userRollNumber);
        break;
      }
    } else {
      List<User> reversedUsers = User.currentUsers.reversed.toList();
      for (var user in reversedUsers) {
        print(user.userName);
        print(user.userRollNumber);
      }
    }
  }

  static void sortonRollNumber() {
    List<User> currentUsers = User.currentUsers;

    currentUsers.sort((a, b) {
      return a.userRollNumber
          .compareTo(b.userRollNumber); // change as per question
    });
    User.currentUsers = currentUsers;
  }

  static void sortOnName() {
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

  static void sortOnAge() {
    List<User> currentUsers = User.currentUsers;

    currentUsers.sort((a, b) {
      return a.userAge.compareTo(b.userAge); // change as per question
    });
    User.currentUsers = currentUsers;
  }

  static void sortOnAddress() {
    List<User> currentUsers = User.currentUsers;

    currentUsers.sort((a, b) {
      return a.userAddress.compareTo(b.userAddress); // change as per question
    });
    User.currentUsers = currentUsers;
  }

  static void sortAscondition(int userChoice) {
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
}
