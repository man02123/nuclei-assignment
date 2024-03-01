import 'package:test/test.dart';
import 'functions.dart';
import 'graph.dart';

void main() {
  test('i want to test graph Class', () {
    Node testGraph = Node(nodeId: 1, nodeName: "A");

    String result = testGraph.nodeName;

    expect(result, 'A');
  });

  test('i want to test Immediate parents  user', () {
    Node testGraph = Node(nodeId: 2, nodeName: "B");
    getAllAncesters();
  });
}
