class User{
  
  String userName;
  int userAge ;
  String userAddress;
  int userRollNumber;
  List<String> userCources;
  static Set<int> regieteredRollNumber = {}; 
  static List<User> currentUsers = [];
  
  User({required this. userName , required this.userAge , required this.userAddress , required this.userRollNumber , required this.userCources});

 factory User.fromJson(Map<String,dynamic> json) {

    return User(
      userName: json['userName'],
      userRollNumber: json['userRollNumber'],
      userCources: List<String>.from(json['userCources']),
      userAge: json['userAge'],
      userAddress: json['userAddress']
    );
  }


 Map<String , dynamic> toJson(){           
     
        Map<String , dynamic> currentMap = {};      // there is no use of this u can directly return it
      
        currentMap['userName'] = this.userName;
        currentMap['userRollNumber'] = this.userRollNumber;
        currentMap['userCources'] = this.userCources;
        currentMap['userAge'] = this.userAge;
        currentMap['userAddress'] = this.userAddress;
        
  
     return currentMap;

}

}
