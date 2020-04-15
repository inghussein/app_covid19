import 'dart:async';
import 'dart:convert';

import 'package:app_covid19/src/models/paises_model.dart';
import 'package:http/http.dart' as http;


class PaisesProvider{

  // final _prefs = new PreferenciasUsuario();

  String _url = "https://api.covid19api.com/summary";

  // bool _cargando = false;

  List<Pais> _paises = new List();

  final _paisesStreamController = StreamController<List<Pais>>.broadcast();

  Function(List<Pais>) get paisesSink => _paisesStreamController.sink.add;

  Stream<List<Pais>> get paisesStream => _paisesStreamController.stream;

  void disposeStreams()
  {
    _paisesStreamController?.close();
  }



  Future<List<Pais>> _procesarRespuesta(String url) async {

    final resp = await http.get( url );

    if(resp.statusCode == 200){

    final decodeData = json.decode(resp.body);

    final paises = new Paises.fromJsonList(decodeData['Countries']);
    
    return paises.items;

    } else 
    {

         return [];

    }
    
  }

  Future<List<Pais>> getPaises() async {

    // if ( _cargando ) return [];

    // _cargando = true;

    final resp = await _procesarRespuesta(_url);

    _paises.addAll(resp);
    paisesSink( _paises );
   

    // _cargando = false;
    return resp;

  }

}