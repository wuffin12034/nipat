// import 'package:flutter/material.dart';
// import 'package:nipat/src/utils/constant.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// class ShowInfoPage extends StatefulWidget {
//    @override
//    ShowInfoPage({
//      Key key,
//      this.docID,
//      this.identificationNumber,
//      this.documentName,
//    }):super(key:key);
//    final String identificationNumber;
//     final String documentName;
//    final String docID;
//   _ShowInfoPageState createState() => _ShowInfoPageState();
// }

// class _ShowInfoPageState extends State<ShowInfoPage > {
//   final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

//   void _submitForm() async {
//     // Navigator.push(context, M);
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Constant.GRAY_COLOR,
//       appBar: AppBar(
//         backgroundColor: Constant.GRAY_COLOR,
//         centerTitle: true,
//         title: Text(widget.identificationNumber),
//         actions: <Widget>[
  
//         ],
//       ),
//       body: StreamBuilder(
//           stream: Firestore.instance
//               .collection('students')
//               .document(widget.docID)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return Text("Loading");
//             }
//             var document = snapshot.data;
//             return SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
                
//                   Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           width: double.infinity,
//                           child: Card(
//                             child: Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Text(
//                                     "ชื่อนิสิต",
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Row(
//                                       children: <Widget>[
//                                       Icon(Icons.store),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(document['firstName'],
//                                           style:
//                                               TextStyle(color: Colors.black)),
//                                     ],
//                                   ),
//                                   //  Padding(
//                     // padding: const EdgeInsets.all(15),
//                     // child: Column(
//                     //   children: <Widget>[
//                     //     Container(
//                     //       width: double.infinity,
//                     //       child: Card(
//                     //         child: Padding(
//                     //           padding: const EdgeInsets.all(10),
//                     //           child: Column(
//                     //             crossAxisAlignment: CrossAxisAlignment.start,
//                     //             children: <Widget>[
//                     //               Text(
//                     //                 "นามสกุล",
//                     //                 style: TextStyle(
//                     //                     fontSize: 18,
//                     //                     color: Colors.black,
//                     //                     fontWeight: FontWeight.bold),
//                     //               ),
//                     //               Row(
//                     //                 children: <Widget>[
//                     //                   Icon(Icons.person),
//                     //                   SizedBox(
//                     //                     width: 5,
//                     //                   ),
//                     //                   Text(document['lastName'],
//                     //                       style:
//                     //                           TextStyle(color: Colors.black)),
//                     //                 ],
//                     //               ),
//                     //             ]))))]))
//                                 ]))))]))]));}));}}