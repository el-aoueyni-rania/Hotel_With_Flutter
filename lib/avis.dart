import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/choice_list.dart';
import 'package:mobile/nourriture_list.dart';

class avis extends StatefulWidget{
  @override
  _avisState createState()=> _avisState();
}

class _avisState extends State<avis> {

  String _txtSubmitted ="";

  Choiceslist _radioChoice = Choiceslist.Danse;

  String _activite ="Danse";

  String _nourriture ="";

  Map _mapNourriture ={
      NourrituresList.Pizza:false,
     NourrituresList.Sushi : false,
    NourrituresList.Hamburger:false,

  };

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new  SingleChildScrollView(
       child: Center (
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text("Remplir le formulaire s'il vous plait :",
          style: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,

            ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 20)),

            Container(

              height: MediaQuery.of(context).size.height*0.7,
              width: MediaQuery.of(context).size.width*0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text('Que pensez vous de notre services?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Entrer votre avis'
                    ),
                    keyboardType: TextInputType.url,
                    onSubmitted: (value){
                          setState(() {
                            _txtSubmitted="Merci de vous continuer :)";
                          });
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 20)),
                  Container(
                    width:MediaQuery.of(context).size.width*0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          _txtSubmitted,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                        const Divider(color: Colors.blueAccent,thickness: 4),
                        const Padding(padding: EdgeInsets.only(bottom: 30)),
                        const Text('Choisir la meilleure activité :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: <Widget>[
                                   Radio(
                                     value: Choiceslist.Cinema,
                                     groupValue: _radioChoice, onChanged: (value){
                                       setState(() {
                                         _radioChoice= Choiceslist.Cinema;
                                         _activite ="Cinema";
                                       });
                                   },
                                   ),
                                  Text("Cinema",
                                   style: _radioChoice== Choiceslist.Cinema ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                                   ),
                                   Radio(
                                     value: Choiceslist.Danse,
                                     groupValue: _radioChoice, onChanged: (value){
                                     setState(() {
                                       _radioChoice= Choiceslist.Danse;

                                     });
                                   },
                                   ),
                                   Text("Danse",style: _radioChoice== Choiceslist.Danse ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                                   ),
                                   Radio(
                                     value: Choiceslist.Bowling,
                                     groupValue: _radioChoice, onChanged: (value){
                                     setState(() {
                                       _radioChoice= Choiceslist.Bowling;
                                       _activite="Bowling";
                                     });
                                   },
                                   ),
                                   Text("Bowling",style: _radioChoice== Choiceslist.Bowling? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                                   ),


                                 ],
                               ),
                        Text(_activite),
                        const Divider(color: Colors.blueAccent,thickness: 4),
                        const Text('Quelle est la meilleure nourriture :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                              value: _mapNourriture[NourrituresList.Pizza],
                              onChanged: (value){
                              setState(() {
                                _mapNourriture[NourrituresList.Pizza] =value;
                                 _nourriture+="Pizza";
                              });
                            },
                            ),
                            Text("Pizza",
                              style: _mapNourriture[NourrituresList.Pizza] ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                            ),
                            Checkbox(
                              value: _mapNourriture[NourrituresList.Hamburger],
                               onChanged: (value){
                              setState(() {
                                _mapNourriture[NourrituresList.Hamburger] =value;


                              });
                            },
                            ),
                            Text("Humburger",
                              style: _mapNourriture[NourrituresList.Hamburger] ? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                            ),
                            Checkbox(
                              value: _mapNourriture[NourrituresList.Sushi],
                               onChanged: (value){
                              setState(() {
                                _mapNourriture[NourrituresList.Sushi] =value;
                              });
                            },
                            ),
                            Text("Sushi",style: _mapNourriture[NourrituresList.Sushi]? const TextStyle(fontWeight: FontWeight.bold) : const TextStyle(),
                            ),

                    ],

                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 40)),

                        Text("Merci pour  intéraction"),

                    ],
                    ),

                  )
                ],
              )

            )
          ],
        ),
        ),
      ),
    );
  }
}