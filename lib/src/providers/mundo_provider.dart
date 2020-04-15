import 'dart:async';
import 'dart:convert';

import 'package:app_covid19/src/models/mundo_model.dart';
import 'package:http/http.dart' as http;


class MundoProvider{

  // final _prefs = new PreferenciasUsuario();

  String _url = "https://api.covid19api.com/summary";

  // bool _cargando = false;

  List<Mundo> _mundo = new List();

  final _mundoStreamController = StreamController<List<Mundo>>.broadcast();

  Function(List<Mundo>) get mundoSink => _mundoStreamController.sink.add;

  Stream<List<Mundo>> get mundoStream => _mundoStreamController.stream;

  void disposeStreams()
  {
    _mundoStreamController?.close();
  }



  Future<List<Mundo>> _procesarRespuesta(String url) async {

    final resp = await http.get( url );

    if(resp.statusCode == 200){

    final decodeData = json.decode(resp.body);

    final mundo = new Mundiales.fromJsonList(decodeData['Global']);
    
    return mundo.items;

    } else 
    {

         return [];

    }
    
  }

  Future<List<Mundo>> getMundo() async {

    // if ( _cargando ) return [];

    // _cargando = true;

    final resp = await _procesarRespuesta(_url);

    _mundo.addAll(resp);
    mundoSink( _mundo );
   

    // _cargando = false;
    return resp;

  }

}