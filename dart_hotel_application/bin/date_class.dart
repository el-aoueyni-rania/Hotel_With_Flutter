class Date{
int _year;
int _mounth;
int _day;

Date(this._year, this._mounth, this._day);

int get year => _year; 
int get mounth => _mounth; 
int get day => _day; 

set year(int value){
  _year = value;
}
set mounth(int value){
  _mounth = value;
}
set day(int value){
  _day = value;
}

}