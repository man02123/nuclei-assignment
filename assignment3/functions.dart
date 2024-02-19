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
  // print('5:Exit');
}

int takeUserChoice() {
  int validChoice = Util.validateInteger();

  while (validateUserChoice(validChoice) == false) {
    printOptions();
    validChoice = Util.validateInteger();
  }
  return validChoice;
}

int validGraphId() {
  int isValid = Util.validateInteger();

  while (Graph.uniqueId.contains(isValid)) {
    print('please enter a unique graph Id');
    isValid = Util.validateInteger();
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
    existigNode = Util.validateInteger();
    if (Graph.uniqueId.contains(existigNode)) {
      isValid = true;
    }
  }
  return existigNode;
}

void addGraphDependency() {
  print("for no parent or child enter -1 respectively");
  int nodeId = readExistingNode();
  print("enter the parent of node");
  int parent = Util.validateInteger();

  if (parent != -1 && !Graph.uniqueId.contains(parent)) {
    print("parent is not present dependency Cant be added");
    return;
  }

  print("enter the child of node");
  int children = Util.validateInteger();

  if (children != -1 && !Graph.uniqueId.contains(children)) {
    print("children is not present dependency Cant be added");
    return;
  }

  if (parent == -1 || children == -1) {
    if (parent == -1 && children != -1) {
      Graph.allExistingNodes[nodeId]?.immediateChildren.add(children);
      Graph.allExistingNodes[children]?.immediateParent.add(nodeId);
      print('dependecy established between ${nodeId} -> ${children}');
    } else if (parent != -1 && children == -1) {
      Graph.allExistingNodes[nodeId]?.immediateParent.add(parent);
      Graph.allExistingNodes[parent]?.immediateChildren.add(nodeId);
      print('dependecy established between ${parent} -> ${nodeId}');
    } else {
      print("both parent and children are NULL");
    }
    return;
  } //else {
  //   Graph.allExistingNodes[nodeId]?.immediateChildren.add(children);
  //   Graph.allExistingNodes[children]?.immediateParent.add(nodeId);
  //   Graph.allExistingNodes[nodeId]?.immediateParent.add(parent);
  //   Graph.allExistingNodes[parent]?.immediateChildren.add(nodeId);
  // }

  bool c = Graph.cyclicityCheck(nodeId, parent, children);

  if (c == false) {
    Graph.allExistingNodes[nodeId]?.immediateChildren.add(children);
    Graph.allExistingNodes[nodeId]?.immediateParent.add(parent);
    print(
        "dependency sucessfully added between parent: ${parent} -> Node:${nodeId} -> child${children}");
  } else {
    print("dependency cant be cyclic : error message ");
  }
}

void getImmediateParents() {
  bool isValid = false;
  int existigNode = -1;
  while (!isValid) {
    print('enter the node whoose immidiate parent need to be displayed');
    existigNode = Util.validateInteger();
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
    existigNode = Util.validateInteger();
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
    existigNode = Util.validateInteger();
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
    existigNode = Util.validateInteger();
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
    existigNode = Util.validateInteger();
    if (Graph.uniqueId.contains(existigNode)) {
      isValid = true;
    }
  }
  Graph.deleteNode(existigNode);
}
