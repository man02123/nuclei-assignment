import 'dart:io';
import 'util.dart';
import 'functions.dart';

class Node {
  late int nodeId;
  late String nodeName;
  Set<int> immediateChildren = {};
  Set<int> immediateParent = {};

  Map<dynamic, dynamic> additionalDetails = {};
  static Set<int> uniqueId = {};
  static Map<int, Node> allExistingNodes = {};

  Node({required this.nodeId, required this.nodeName});

  static bool cyclicityCheck(int node, int parent, int child) {
    Set<int> visited = {};

    Set<int> allNodes = cyclicityHelper(parent, visited);
    if (allNodes.contains(child)) {
      print("dependency cant be creatd");
      return true;
    } else
      return false;
  }

  static void getImmediateParents(int nodeId) {
    if (Node.allExistingNodes[nodeId]!.immediateParent.isEmpty) {
      print("no immediate parent found");
      return;
    }
    print("immediate parents of ${nodeId} are :");
    for (var parent in Node.allExistingNodes[nodeId]!.immediateParent) {
      print(parent);
    }
  }

  static void getImmediateChildrens(int nodeId) {
    if (Node.allExistingNodes[nodeId]!.immediateChildren.isEmpty) {
      print("no immediate Children found");
      return;
    }
    print("immediate Children of ${nodeId} are :");
    for (var parent in Node.allExistingNodes[nodeId]!.immediateChildren) {
      print(parent);
    }
  }

  static void getAllAncesters(int nodeId) {
    Set<int> visited = {};
    if (Node.allExistingNodes[nodeId]!.immediateParent.isEmpty) {
      print("Node does not have any Childrens");
      return;
    }
    getAllAncesterHelper(nodeId, visited);
  }

  static void getAllAncesterHelper(int currentNode, Set<int> visited) {
    visited.add(currentNode);
    if (Node.allExistingNodes[currentNode]!.immediateParent.isEmpty) {
      return;
    }

    for (var nodes in Node.allExistingNodes[currentNode]!.immediateParent) {
      print(
          "nodeId : ${Node.allExistingNodes[nodes]!.nodeId}  nodename : ${Node.allExistingNodes[nodes]!.nodeName}");
      if (!visited.contains(nodes)) {
        getAllAncesterHelper(nodes, visited);
      }
    }
  }

  static void getAllChildren(int nodeId) {
    Set<int> visited = {};
    if (Node.allExistingNodes[nodeId]!.immediateChildren.isEmpty) {
      print("Node does not have any Childrens");
      return;
    }
    getAllChildrenHepler(nodeId, visited);
  }

  static void getAllChildrenHepler(int currentNode, Set<int> visited) {
    visited.add(currentNode);
    if (Node.allExistingNodes[currentNode]!.immediateChildren.isEmpty) {
      return;
    }

    for (var nodes in Node.allExistingNodes[currentNode]!.immediateChildren) {
      print(
          "nodeId : ${Node.allExistingNodes[nodes]!.nodeId}  nodename : ${Node.allExistingNodes[nodes]!.nodeName}");
      if (!visited.contains(nodes)) {
        getAllChildrenHepler(nodes, visited);
      }
    }
  }

  static void deleteNode(int nodeId) {
    for (var childNodes in Node.allExistingNodes[nodeId]!.immediateChildren) {
      Node.allExistingNodes[childNodes]!.immediateParent.remove(nodeId);
    }

    for (var parentNodes in Node.allExistingNodes[nodeId]!.immediateParent) {
      Node.allExistingNodes[parentNodes]!.immediateChildren.remove(nodeId);
    }

    Node.uniqueId.remove(nodeId);
    print("node with Id ${nodeId} is sucessfully deleted");
  }

  static Set<int> cyclicityHelper(int curr, Set<int> visited) {
    visited.add(curr);
    Set<int> currParent = Node.allExistingNodes[curr]!.immediateParent;
    Set<int> currChild = Node.allExistingNodes[curr]!.immediateChildren;

    for (var i in currChild) {
      if (!visited.contains(i)) cyclicityHelper(i, visited);
    }
    for (var i in currParent) {
      if (!visited.contains(i)) cyclicityHelper(i, visited);
    }

    return visited;
  }

  static void addGraphDependency() {
    print("for no parent or child enter -1 respectively");
    int nodeId = Functions.readExistingNode();
    print("enter the parent of node");
    int parent = Util.validUserInput();

    if (parent != -1 && !Node.uniqueId.contains(parent)) {
      print("parent is not present dependency Cant be added");
      return;
    }

    print("enter the child of node");
    int children = Util.validUserInput();

    if (children != -1 && !Node.uniqueId.contains(children)) {
      print("children is not present dependency Cant be added");
      return;
    }

    if (parent == -1 || children == -1) {
      if (parent == -1 && children != -1) {
        Node.allExistingNodes[nodeId]?.immediateChildren.add(children);
        Node.allExistingNodes[children]?.immediateParent.add(nodeId);
        print('dependecy established between ${nodeId} -> ${children}');
      } else if (parent != -1 && children == -1) {
        Node.allExistingNodes[nodeId]?.immediateParent.add(parent);
        Node.allExistingNodes[parent]?.immediateChildren.add(nodeId);
        print('dependecy established between ${parent} -> ${nodeId}');
      } else {
        print("both parent and children are NULL");
      }
      return;
    }

    bool isCyclic = Node.cyclicityCheck(nodeId, parent, children);

    if (isCyclic == false) {
      Node.allExistingNodes[nodeId]?.immediateChildren.add(children);
      Node.allExistingNodes[nodeId]?.immediateParent.add(parent);
      print(
          "dependency sucessfully added between parent: ${parent} -> Node:${nodeId} -> child${children}");
    } else {
      print("dependency cant be cyclic : error message ");
    }
  }
}
