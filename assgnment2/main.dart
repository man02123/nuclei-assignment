import 'dart:io';
import 'util.dart';
import 'user.dart';
import 'funcions.dart';

void main(){
  User.currentUsers = previousUsers();  //working

while(true){
    printOptions();
    int validChoice = takeUserChoice();
    
    switch(validChoice){

        case 1: User user = readDeatais();
                User.currentUsers.add(user);
                User.regieteredRollNumber.add(user.userRollNumber);

                break;

        case 2: sortAscondition();
                displayUser();   
                break;

        case 3: deleteUser();
                break ;
        case 4: saveUserDetails();
                break;
        case 5: exit(0);
        default:break;

    }
 }
  
}