
import 'dart:convert';
import 'util.dart';
import 'user.dart';         /// two classes approach (util input, util validation)
import 'dart:io';
bool validateUserChoice(int userChoice){

 if( userChoice <1 || userChoice > 5){
  print('please enter an integer ranging 1-5');
  return false;
 }
 return true;

}
 int takeUserChoice() {

 int validChoice = Util.validateInteger();// kya ye valid

 while(validateUserChoice(validChoice) == false){
   validChoice = Util.validateInteger();
 }
 return validChoice;

}

void printOptions() {

  print('Enter the as per options below');
  print('1:For Adding user details');
  print('2:Displayng the existing user detaiils');
  print('3:Deleting the user details');
  print('4:Saving the user details');
  print('5:Exit');
  
}
int validRollNumber(){
  
  int valid= Util.validateInteger();

  while(User.regieteredRollNumber.contains(valid)){
    print('please enter a unique roll number');
    valid = Util.validateInteger();
  }
   return valid; 
}


 List<String> readCources(){
 Set<String> courcesOffered = {"A" , "B" ,"C" , "D","E" , "F"};  
 Set<String> currentCources = {};

 print('Cources offered are A,B,C,D,E,F');


 while(currentCources.length < 4){
  print("please  select atleat 4 cources out of 6");
  String cource = stdin.readLineSync()!;
                                                                  
  if(courcesOffered.contains(cource)){

  if( currentCources.contains(cource)){
    print('Cource already exist enter another on from offeredCources');
  }
  else
  currentCources.add(cource);
 }
 else{
  print('entered cource is not being offered');
 }

}
print('choosen cources are');
List<String> courceChosen=[];

for(var curr in currentCources){
  print(curr);
  courceChosen.add(curr);
}


return courceChosen;
}

User readDeatais(){
  String userName ='';
  int userRollNumber= 0;
  int userAge = 0;
  String userAddress='';

  print('enter the name of user');
  userName = stdin.readLineSync()!;

  print('enter the Roll number of user');

  userRollNumber= validRollNumber();
  

  print('enter the address of user');
  userAddress = stdin.readLineSync()!;

  print('enter the Age of user');
  userAge = Util.validateInteger();

  List<String> userCources = readCources();
  
  return User(userName: userName, userAge: userAge, userAddress: userAddress, userRollNumber: userRollNumber, userCources: userCources);
}

void displayUser(){
  if(User.currentUsers.length ==0){
    print("no registered Users avilable ");
  }
  for( var user in User.currentUsers){
     print(user.userName);
     print(user.userRollNumber);
  }

}

void sortAscondition(){
  List<User> currentUsers = User.currentUsers;

  currentUsers.sort((a,b){

     if(a.userName != b.userName)
     return a.userName.compareTo(b.userName);
     else
     return a.userRollNumber.compareTo(b.userRollNumber);

  });
  
  

}
void deleteUser(){
  
  print('enter a valid roll number');
  int inputRollNumber = Util.validateInteger();
  bool userDeleted  = false;
  
  for(int userIndex = 0; userIndex < User.currentUsers.length;userIndex++){
    if(User.currentUsers[userIndex].userRollNumber == inputRollNumber){
      print('user deleted with roll number ${inputRollNumber} : name ${User.currentUsers[userIndex].userName}');
      User.currentUsers.removeAt(userIndex);
      userDeleted = true;
    }
  }
  if(!userDeleted){
    print('This roll number dosent exist');
  }

}




void saveUserDetails(){

 List<Map<String, dynamic>> convertedObjected = [];
 for(var user in User.currentUsers){
    convertedObjected.add(user.toJson());
 }
 
 var json  = jsonEncode(convertedObjected);
 File('userdetail.json').writeAsStringSync(jsonEncode(json));
}

List<User> previousUsers(){
    String jsonString = File('userdetail.json').readAsStringSync();
   
    var decodedUserList = json.decode(jsonString);
    
    const JsonDecoder  decoder = JsonDecoder();
    var listOfUserAsMap = decoder.convert(decodedUserList);
   
    List<User> savedUsers=[];

    for(var object in listOfUserAsMap){
      savedUsers.add(User.fromJson(object));
    }
    print(savedUsers);
    return savedUsers;
}
