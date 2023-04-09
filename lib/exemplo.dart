import 'package:intl/intl.dart';

main(){


  Map<String?,dynamic> Marcacoes = {
    "Entrada1": '',
    "Sainda1": '',
    "Entrda2": '',
    "Saida2": ''
  };

  Marcacoes["Entrada1"] = DateFormat('HH:mm').format(DateTime.now());;
  Marcacoes["Saida1"] = DateFormat('HH:mm').format(DateTime.now());


  print(Marcacoes["Entrada1"]);
  print(Marcacoes["Saida1"]);
}