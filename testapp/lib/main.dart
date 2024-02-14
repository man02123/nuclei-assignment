import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  //cant change over the time frame :(reusability)
  @override
  Widget build(BuildContext context) {
    // pata ni kya karta hai ye(BuildContext wala)
    // rebuild karta hai waha jaha pe cod echange hota h
    return Scaffold(
      appBar: AppBar(
        title: Text('my app '),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      // body: Center(
      //   child: Text(
      //     'Application nya',
      //     style: TextStyle(
      //       backgroundColor: Colors.green,
      //       fontSize: 30,
      //       fontWeight: FontWeight.bold,
      //       letterSpacing: 2.0,
      //     ),
      //   ),
      // ),
      // body: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
      //   margin: EdgeInsets.symmetric(horizontal: 80, vertical: 230),
      //   color: Colors.grey[600],
      //   child: Text(
      //     'main hoon Zian',
      //   style: TextStyle(
      //     fontSize: 30,
      //   )
      //   ),
      // ),
      body: Row(
        //mainAxisAlignment: ,
        children: <Widget>[
          Text(
            'Ninja Hatori ',
            style: TextStyle(
              fontSize: 30,
              color: Colors.amber,
            ),
          ),
          Container(
            child: Text(
              'Nobita',
              style: TextStyle(
                fontSize: 30,
                color: Colors.lime,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // relatively fix hi rhta hai
        onPressed: () {},
        splashColor: Colors.red,
        child: Text(
          'click mee',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Colors.lightGreen),
        ),
      ),
    );
  }
}
//void fun (){}

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stateful Widget',
          style: TextStyle(color: Colors.red[200]),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Text(
          '${counter}',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // jse hi ye caall hoga rebulid hoga app
            counter++;
          });
        },
        child: Text('click'),
      ),
    );
  }
}

// void main(){
//   runApp(MaterialApp(
//     home:ListTraversal(),
//   ));
// }
//
// class ListTraversal extends StatefulWidget {
//   const ListTraversal({super.key});
//
//   @override
//   State<ListTraversal> createState() => _ListTraversalState();
// }
//
// class _ListTraversalState extends State<ListTraversal> {
//   List<String> quotes = ["maneeh" , 'kumar' , 'bgmi', 'food'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar : AppBar(
//         title: Text('my app '),
//         centerTitle: true,
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: Column(
//         children: quotes.map((quote) {    // map functon working
//         return Text(quote);
//     }).toList()
//       )
//     );
//   }
// }

//Text('body ke ander'),

//NetworkImage()  && AssetImage()

// widget k ander widget to child use krte h

// container widget k ander jo bhi child pad ahoga container uski space le lega

// Expanded widget ka bhut acha use case hai ki images ko shape kara dega(important  && flex (ye bhi jaroori h)

//______________________________________________________________________________________________________________________
// flutter and its arch.
// why flutter
// widget tree kya hai
// stateful && statless formally
// constraints (imp)
// responsiveness
