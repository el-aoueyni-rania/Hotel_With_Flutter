import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' ;

class Activite {
  String id;
  String nom_activite;
  String date_activite;
 

  Activite({
    required this.id,
    required this.nom_activite,
    required this.date_activite,
   
} );

  factory Activite.fromJson(Map<String, dynamic> json){
    return Activite(
        id: json['id'] ,
        nom_activite: json['nom_activite'],
        date_activite: json['date_activite'],
     
    );
  }
  
}

class activite extends StatefulWidget{
  @override
  _activiteState createState()=> _activiteState();
}

class _activiteState extends State<activite> {
  //final String url= "https://10.0.2.2:3000/reservations";

  //final String url= "https://localhost:3000/reservations";

  final String url="https://my-json-server.typicode.com/mariem-fatnassi/activite/activites";

  //final String url= "http://localhost:3000/api/reservations";

  List<dynamic> _activites=[];

  bool loading = true;
  @override
  void initState (){
    getActivites();
    super.initState();
  }


  Future <void> getActivites() async {
    var response = await http.get(Uri.parse(url));

    if(response.statusCode ==200 ){
      
      final parsedData = jsonDecode(response.body).cast<Map<String, dynamic>>();

      _activites = parsedData.map<Activite>((json)=> Activite.fromJson(json)).toList();

      setState(() {
        loading=!loading;
      });

    }else{
      throw Exception('failed to load activity');
    }
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Liste des activites :'),
        backgroundColor: Colors.black12,

      ) ,
      body: loading ? waitingScreen(): activitesList()

    );
  }
  Widget waitingScreen(){
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
  Widget activitesList(){
    return ListView.builder(
      itemCount: _activites.length,

      itemBuilder: (context, index) {
        Activite activite = _activites[index];
        return Container(
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
                  "Id de l'activite : " +
                      activite.id,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Nom de l'activite : " +
                      activite.nom_activite,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "date de l'activite: " + activite.date_activite.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),

              ],
            ),
          ),
        );
      });
  }
}