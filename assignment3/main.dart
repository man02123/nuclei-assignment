import 'dart:io';

import 'dart:io';
import 'util.dart';
import 'graph.dart';
import 'functions.dart';

void main() {
  while (true) {
    printOptions();
    int validChoice = takeUserChoice();

    switch (validChoice) {
      case 1:
        Node user = createNewNode();
        Node.allExistingNodes[user.nodeId] = user;
        break;

      case 2:
        Node.addGraphDependency();
        break;

      case 3:
        getImmediateParents();
        break;
      case 4:
        getImmediateChildrens();
        break;
      case 5:
        getAllAncesters();
        break;
      case 6:
        getAllDecendents();
        break;
      case 7:
        deleteNode();
        break;
      case 8:
        exit(0);
      default:
        break;
    }
  }
}
