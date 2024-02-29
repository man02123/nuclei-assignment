import 'dart:io';
import 'graph.dart';
import 'util.dart';

void printOptions() {
  print('Enter the as per options below');
  print('1 : Add new node to the tree');
  print('2 : Add dependency');
  print('3 : Get the immediate parents of a node');
  print('4 : Get the immediate children of a node');
  print('5 : Get all the ancestors of a node');
  print('6 : Get all the descendants of a node');
  print('7 : Delete a node from tree');
  print('8 : exit');
}

int takeUserChoice() {
  int validChoice = Util.validUserInput();

  while (validateUserChoice(validChoice) == false) {
    printOptions();
    validChoice = Util.validUserInput();
  }
  return validChoice;
}

int validGraphId() {
  int isValid = Util.validUserInput();

  while (Graph.uniqueId.contains(isValid)) {
    print('please enter a unique graph Id');
    isValid = Util.validUserInput();
  }
  return isValid;
}

bool validateUserChoice(int userChoice) {
  if (userChoice < 1 || userChoice > 8) {
    print('please enter an integer ranging 1-8');
    return false;
  }
  return true;
}

Graph createNewNode() {
  print("enter a valid graph Id");
  int graphId = validGraphId();
  print("enter the name of node");
  String? nameOfNode = stdin.readLineSync();
  Graph newNode = Graph(
      nodeId: graphId, nodeName: nameOfNode ?? " no name assigned by user");
  Graph.uniqueId.add(graphId);
  return newNode;
}

int readExistingNode() {
  bool isValid = false;
  int existigNode = -1;
  while (!isValid) {
    print('enter the node whoose dependency has to be added');
    existigNode = Util.validUserInput();
    if (Graph.uniqueId.contains(existigNode)) {
      isValid = true;
    }
  }
  return existigNode;
}

void getImmediateParents() {
  bool isValid = false;
  int existigNode = -1;
  while (!isValid) {
    print('enter the node whoose immidiate parent need to be displayed');
    existigNode = Util.validUserInput();
    if (Graph.uniqueId.contains(existigNode)) {
      isValid = true;
    }
  }
  Graph.getImmediateParents(existigNode);
}

void getImmediateChildrens() {
  bool isValid = false;
  int existigNode = -1;
  while (!isValid) {
    print('enter the node whoose immidiate children need to be displayed');
    existigNode = Util.validUserInput();
    if (Graph.uniqueId.contains(existigNode)) {
      isValid = true;
    }
  }
  Graph.getImmediateChildrens(existigNode);
}

void getAllAncesters() {
  bool isValid = false;
  int existigNode = -1;
  while (!isValid) {
    print('enter the node whoose ancestor  are to be displayed');
    existigNode = Util.validUserInput();
    if (Graph.uniqueId.contains(existigNode)) {
      isValid = true;
    }
  }
  Graph.getAllAncesters(existigNode);
}

void getAllDecendents() {
  bool isValid = false;
  int existigNode = -1;
  while (!isValid) {
    print('enter the node whoose ancestor  are to be displayed');
    existigNode = Util.validUserInput();
    if (Graph.uniqueId.contains(existigNode)) {
      isValid = true;
    }
  }
  Graph.getAllChildren(existigNode);
}

void deleteNode() {
  bool isValid = false;
  int existigNode = -1;
  while (!isValid) {
    print('enter the node  to be deleted ');
    existigNode = Util.validUserInput();
    if (Graph.uniqueId.contains(existigNode)) {
      isValid = true;
    }
  }
  Graph.deleteNode(existigNode);
}
