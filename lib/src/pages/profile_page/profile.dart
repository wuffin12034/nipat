import 'package:flutter/material.dart';
import '../../models/student.dart';
import 'insert_sec.dart';
import 'insert_sec_student.dart';
import '../../utils/constant.dart';
import '../../services/alogolia_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constant.PROFILE),
        centerTitle: true,
        backgroundColor: Constant.BG_COLOR,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InsertsecPage();
                }));
              }),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: DataSearch(),
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Sec').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(color: Colors.black),
                ),
              );
            default:
              return ListView(
                children: snapshot.data.documents.map(
                  (DocumentSnapshot document) {
                    return ListTile(
                      title: Text(
                        document['numbersec'],
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InsertsecStudentPage(
                              numbersec: document['numbersec'],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              );
          }
        },
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final algoliaService = AlogoliaService.instance;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Student>>(
      future: algoliaService.performProvinceSearch(text: query),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final students = snapshot.data.map((student) {
            return Container(
              child: Center(
                  child: GestureDetector(
                child: Card(
                  color: Colors.yellow[200],
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              student.firstName,
                              style: TextStyle(fontSize: 18.0),
                            )),
                      ]),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              )),
            );
          }).toList();

          return ListView(children: students);
        } else if (snapshot.hasError) {
          return Center(
            child: Text("${snapshot.error.toString()}"),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
