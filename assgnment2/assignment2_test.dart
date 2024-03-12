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

  test('i want to test sorting of  user(on Roll no)', () {
    User testUser3 = User(
        userName: 'user3',
        userAddress: 'kanpur',
        userAge: 5,
        userCources: ['A', 'B', 'C', 'E'],
        userRollNumber: 10);

    User testUser4 = User(
        userName: 'user4',
        userAddress: 'kanpur',
        userAge: 5,
        userCources: ['A', 'B', 'C', 'E'],
        userRollNumber: 2);

    sortonRollNumber();
    displayUser();
  });

  test('i want to test sorting of  user(on Age)', () {
    User testUser3 = User(
        userName: 'user3',
        userAddress: 'kanpur',
        userAge: 5,
        userCources: ['A', 'B', 'C', 'E'],
        userRollNumber: 10);

    User testUser4 = User(
        userName: 'user4',
        userAddress: 'kanpur',
        userAge: 5,
        userCources: ['A', 'B', 'C', 'E'],
        userRollNumber: 2);

    sortOnAge();
    displayUser();
  });

  test('i want to test sorting of  user(on Address)', () {
    User testUser3 = User(
        userName: 'user3',
        userAddress: 'allahabad',
        userAge: 5,
        userCources: ['A', 'B', 'C', 'E'],
        userRollNumber: 10);

    User testUser4 = User(
        userName: 'user4',
        userAddress: 'kanpur',
        userAge: 5,
        userCources: ['A', 'B', 'C', 'E'],
        userRollNumber: 2);

    sortOnAddress();
    displayUser();
  });

  test('i want to test Save  user details', () {
    User testUser3 = User(
        userName: 'user3',
        userAddress: 'kanpur',
        userAge: 5,
        userCources: ['A', 'B', 'F', 'E'],
        userRollNumber: 10);

    saveUserDetails();
    displayUser();
  });
}
