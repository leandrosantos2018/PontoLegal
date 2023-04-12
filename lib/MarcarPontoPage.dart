
//  registro de marcação de ponto
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MarcarPontoPage extends StatefulWidget {
  @override
  _MarcarPontoPageState createState() => _MarcarPontoPageState();
}


class _MarcarPontoPageState extends State<MarcarPontoPage> {
  String? _Entrada;
  String?  _Sainda;
  String? _IntervaloSaida;
  String? _InstervaloEntrada;
  String? dataAtual=  DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
  String?HoraAtual =  DateFormat('HH:mm').format(DateTime.now()).toString();


  Map<String?,dynamic> Marcacoes = {
    "Entrada1": null,
    "Sainda1": null,
    "Entrda2": null,
    "Saida2": null
  };

// late Future<DateTime> _currentTime;

  late Timer _timer;
  late DateFormat _timeFormat;
  late String? _currentTime;

  @override
  void initState() {
    super.initState();
    _timeFormat = DateFormat('HH:mm:ss');
    _currentTime = _timeFormat.format(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = _timeFormat.format(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }



  MarcarPonto(){



    if(dataAtual == dataAtual){


      if(Marcacoes["Entrada1"] == null){

        Marcacoes["Entrada1"] = DateFormat('HH:mm').format(DateTime.now());


      }else if( Marcacoes["saida1"] == null){

        bool validated =  Marcacoes["Entrada1"] != HoraAtual;
        print('valided ' + validated.toString() );

        if(validated){

          Marcacoes["saida1"] = DateFormat('HH:mm').format(DateTime.now());

        }else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Erro ao Processar Marcação'),
                content: Text('Aguarde alguns minuto e tente novamente'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Fechar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );

          print('horario atual ${HoraAtual} é igual a de entrada ${_Entrada}');
        }

      }else if(Marcacoes["Entrada2"] == null){
        bool validated = Marcacoes["Saida1"] != HoraAtual;
        if(validated) {
          Marcacoes["Entrada2"] = DateFormat('HH:mm').format(DateTime.now());
        }else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Erro ao Processar Marcação'),
                content: Text('Aguarde alguns minuto e tente novamente'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Fechar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );

          print('horario atual ${HoraAtual} é igual a de entrada ${_Entrada}');
        }
      }else if(Marcacoes["saida2"] ==null){
        bool validated = Marcacoes["Entrada2"] != HoraAtual;

        if(validated)
          Marcacoes["saida2"] = DateFormat('HH:mm').format(DateTime.now());
      }else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro ao Processar Marcação'),
              content: Text('Aguarde alguns minuto e tente novamente'),
              actions: <Widget>[
                TextButton(
                  child: Text('Fechar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

        print('horario atual ${HoraAtual} é igual a de entrada ${_Entrada}');
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marcar ponto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.access_time_sharp,
              size: 125,
              color: Colors.blue,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FutureBuilder(
                  future: Future.delayed(Duration(seconds: 1)),
                  builder: (context, snapshot) {
                    return Center(
                      child: Text(
                        _currentTime!,
                        style: TextStyle(fontSize: 32),
                      ),
                    );
                  },
                ),
              ],
            ),


            SizedBox(height: 20),
            ElevatedButton (
              child: Text('Marcar Ponto'),
              onPressed: () {
                setState(() {
                  MarcarPonto();
                });
              },
            ),

            SizedBox(height: 20),
            if (Marcacoes["Entrada1"] != null)

              Text(
                'Entrada marcada às ${Marcacoes["Entrada1"].toString()}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,color: Colors.green),

              ),


            if (Marcacoes["saida1"] != null)
              Text(
                'Saída marcada às ${Marcacoes["saida1"].toString()}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,color: Colors.red),
              ),
            if (Marcacoes["Entrada2"] != null)
              Text(
                'Entrada marcada às ${Marcacoes["Entrada2"].toString()}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,color: Colors.green),
              ),
            if (Marcacoes["saida2"] != null)
              Text(
                'Saída marcada às ${Marcacoes["saida2"].toString()}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}