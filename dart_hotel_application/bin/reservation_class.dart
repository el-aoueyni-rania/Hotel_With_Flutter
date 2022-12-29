import './date_class.dart';
class Reservation {
  
  int? id;
  String? _clientName;
  Date? dateArrivee;
  int? nbrNuits;
  int? nbrChambres;
  int? nbrAdultes;
  int? nbrEnfants;
  int? userId;

  Reservation(this.id, this._clientName, this.dateArrivee, this.nbrNuits,this.nbrChambres,this.nbrAdultes,this.nbrEnfants,this.userId);

String get clientName => _clientName.toString();

set clientName (String value){
  _clientName = value;
}

}