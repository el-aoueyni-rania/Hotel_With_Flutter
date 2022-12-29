import 'package:flutter/material.dart';
class home extends StatefulWidget{
  @override
  _homeState createState()=> _homeState();
}

class _homeState extends State<home> {
@override
  Widget build(BuildContext context){
  return new Scaffold(
          appBar: new AppBar(

            title: new Text('Bienvenue...'),
            backgroundColor: Colors.transparent,
          ) ,
    body:GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 0.9,
      crossAxisCount: 2,
      children: [
        Card(
          child: Column(
            children: [
              Image(image: AssetImage('images/chm4.jpg'),),
              ListTile(
                title: Text("Chambres et suites",textDirection: TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              Image(image: AssetImage('images/rest3.png'),),
              ListTile(
                title: Text("Restaurants et Bars",textDirection: TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),

        Card(
          child: Column(
            children: [
              Image(image: AssetImage('images/reun.png'),),
              ListTile(
                title: Text("Réunions et Evenements",textDirection: TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              Image(image: AssetImage('images/spa3.jpg'),),
              ListTile(
                title: Text("Thalasso et SPA",textDirection: TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              Image(image: AssetImage('images/golf4.jpg'),),
              ListTile(
                title: Text("Golf",textDirection: TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              Image(image: AssetImage('images/stade.png'),),
              ListTile(
                title: Text("Complexe Sportif",textDirection: TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ],),
  );
}
}