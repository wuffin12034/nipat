// import 'package:flutter/material.dart';
// import 'package:nipat/src/models/student.dart';
// import 'package:nipat/src/pages/report_page/show_info.dart';
// import 'package:nipat/src/utils/constant.dart';
// import 'package:nipat/src/widgets/Service/AlogoliaService.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';



// class ReprotPage extends StatefulWidget {
//   ReprotPage({Key key,
//   this.identificationNumber,}):super(key:key);
//   final String identificationNumber;
//    @override
//   _ReprotPageState createState() => _ReprotPageState();
// }

// class _ReprotPageState extends State<ReprotPage> {
  
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(Constant.REPORT),
//         centerTitle: true,
//         backgroundColor: Constant.BG_COLOR,
//         actions: <Widget>[
//           // IconButton(
//               // icon: Icon(Icons.add), onPressed: () {
//               // Navigator.push(context, MaterialPageRoute(builder: (context){
//               //   return InsertsecPage();
//               // }));
//               // }),
//               //           IconButton(
//               // icon: Icon(Icons.search), onPressed: () => showSearch(context: context,delegate: DataSearch()))
//         ],
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//           stream: Firestore.instance
//               .collection('students')
//               .snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasError) return Text('Error: ${snapshot.error}');
//             switch (snapshot.connectionState) {
//               case ConnectionState.waiting:
//                 return Center(
//                     child: Text('Loading...',
//                         style: TextStyle(color: Colors.black)));
//               default:
//                 return ListView(
//                   children:
//                       snapshot.data.documents.map((DocumentSnapshot document) {
//                     return ListTile(
//                       title: Text(
//                         document['identificationNumber'],
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       trailing: Icon(
//                         Icons.keyboard_arrow_right,
//                         color: Colors.black,
//                       ),
                      
//                       // onTap: () {
//                       //   Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //       builder: (context) =>ShowInfoPage(
                                  
                                  
//                       //             identificationNumber: document['identificationNumber'],
                                  
//                       //           ),
//                       //     ),
//                       //   );
//                       // },
//                     );
//                   }).toList(),
//                 );
//             }
//           },
//         ),
//     );
//   }
// }
// class DataSearch extends SearchDelegate<String> {
//   final algoliaService = AlogoliaService.instance;

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//           icon: Icon(Icons.clear),
//           onPressed: () {
            
//           })
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         icon: AnimatedIcon(
//             icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
//         onPressed: () {
//           close(context, null);
//         });
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Container();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return FutureBuilder<List<Student>>(
     
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final students = snapshot.data.map((student) {
//             return Container(
//               child: Center(
//                   child: GestureDetector(
//                 child: Card(
//                   color: Colors.yellow[200],
//                   child: Column(
//                     children: <Widget>[
//                       Row(children: <Widget>[
//                         Padding(
//                             padding: EdgeInsets.all(7.0),
//                             child: Text(
//                               student.firstName,
//                               style: TextStyle(fontSize: 18.0),
                              
//                             )),
//                       ]),
//                     ],
//                   ),
                  
//                 ),
//                   onTap: (){
//                     // Navigator.push(context,MaterialPageRoute(builder: (context)=>ShowInfoPage(
                      
//                     // )),);
//                   },
//               )),
//             );
//           }).toList();

//           return ListView(children: students);
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text("${snapshot.error.toString()}"),
//           );
//         }

//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
