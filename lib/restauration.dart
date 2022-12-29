import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyAppRestaurations());

List<restauration> postFromJson(String str) => List<restauration>.from(
    json.decode(str).map((x) => restauration.fromMap(x)));

class restauration {
  int id;
  String nom_restaurant;
  String menu;
  String fruits;
  String boissons;

  restauration({
    required this.id,
    required this.nom_restaurant,
    required this.menu,
    required this.fruits,
    required this.boissons,
  });

  factory restauration.fromMap(Map<String, dynamic> json) => restauration(
        id: json["id"],
        nom_restaurant: json["nom_restaurant"],
        menu: json["menu"],
        fruits: json["fruits"],
        boissons: json["boissons"],
      );
}

Future<List<restauration>> fetchRestauration() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.186:8089/restaurations'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed
        .map<restauration>((json) => restauration.fromMap(json))
        .toList();
  } else {
    throw Exception('Failed to load restaurations');
  }
}

class MyAppRestaurations extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppRestaurations> {
  late Future<List<restauration>> futureRestaurations;

  @override
  void initState() {
    super.initState();
    futureRestaurations = fetchRestauration();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Container(
              child: Text('Liste des restaurations :' , style: TextStyle(
                                color: Colors.black,
                              ), ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: new Container(
            child: new FutureBuilder<List<restauration>>(
              future: futureRestaurations,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Color(0xff264e70),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Id du restaurant : " +
                                  "${snapshot.data![index].id}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "nom du restaurant : " +
                                  "${snapshot.data![index].nom_restaurant}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Menu : " + "${snapshot.data![index].menu}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Fruits : " + "${snapshot.data![index].fruits}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Boissons : " +
                                  "${snapshot.data![index].boissons}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}
