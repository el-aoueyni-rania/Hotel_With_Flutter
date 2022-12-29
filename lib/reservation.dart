import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Reservation {
  String id;
  String clientname;
  String datearrivee;
  num nbrnuits;
  num nbrenfants;
  num nbradultes;
  num nbrchambres;

  Reservation(
      {required this.id,
      required this.clientname,
      required this.datearrivee,
      required this.nbrnuits,
      required this.nbrenfants,
      required this.nbradultes,
      required this.nbrchambres});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
        id: json['id'],
        clientname: json['clientname'],
        datearrivee: json['datearrivee'],
        nbrnuits: json['nbrnuits'],
        nbrenfants: json['nbrenfants'],
        nbradultes: json['nbradultes'],
        nbrchambres: json['nbrchambres']);
  }
}

class reservation extends StatefulWidget {
  @override
  _reservationState createState() => _reservationState();
}

class _reservationState extends State<reservation> {
  //final String url= "https://10.0.2.2:3000/reservations";

  //final String url= "https://localhost:3000/reservations";

  final String url =
      "https://my-json-server.typicode.com/eya-ghazouani/public-reservations-api/reservations";

  //final String url= "http://localhost:3000/api/reservations";

  List<dynamic> _reservations = [];

  bool loading = true;
  @override
  void initState() {
    getReservations();
    super.initState();
  }

  Future<void> getReservations() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final parsedData = jsonDecode(response.body).cast<Map<String, dynamic>>();

      _reservations = parsedData
          .map<Reservation>((json) => Reservation.fromJson(json))
          .toList();

      setState(() {
        loading = !loading;
      });
    } else {
      throw Exception('failed to load reservations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Liste des reservations :'),
          backgroundColor: Colors.black12,
        ),
        body: loading ? waitingScreen() : reservationsList());
  }

  Widget waitingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text("Loading data..."),
          Padding(padding: EdgeInsets.only(bottom: 25)),
          CircularProgressIndicator()
        ],
      ),
    );
  }

  Widget reservationsList() {
    return ListView.builder(
        itemCount: _reservations.length,
        itemBuilder: (context, index) {
          Reservation reservation = _reservations[index];
          return Container(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    "Id du reservation : " + reservation.id,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Nom du client : " + reservation.clientname,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Nombre des chambres : " +
                        reservation.nbrchambres.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Nombre des nuits : " + reservation.nbrnuits.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Nombre des adultes : " + reservation.nbradultes.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Nombre des enfants : " + reservation.nbrenfants.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Date d'arrivée : " + reservation.datearrivee,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
