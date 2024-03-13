import 'package:test/test.dart';
import 'Functions.dart';
import 'user.dart';

void main() {
  test('test  User Class', () {
    User testUser = User(
        userName: 'user1',
        userAddress: 'kanpur',
        userAge: 5,
        userCources: ['A', 'B', 'C', 'D'],
        userRollNumber: 10);

    String result = testUser.userAddress;

    expect(result, 'kanpur');
  });

  test(' test to check Delete user', () {
    User testUser2 = User(
        userName: 'user2',
        userAddress: 'kanpur',
        userAge: 5,
        userCources: ['A', 'B', 'C', 'E'],
        userRollNumber: 2);

    string result = deleteUser(2);
    expect(result , user deleted with roll number 2 : name })
  });

  
}
