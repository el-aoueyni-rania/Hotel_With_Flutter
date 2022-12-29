import './reservation_class.dart';
import './date_class.dart';
void main() {
  Date D1 = Date(2021,05,01);
  Reservation R1 = Reservation(1,"aya",D1,5,5,1,4,5);
  print(R1.clientName);
}
