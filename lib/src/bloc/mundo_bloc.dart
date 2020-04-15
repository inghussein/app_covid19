import 'package:app_covid19/src/models/mundo_model.dart';
import 'package:app_covid19/src/providers/mundo_provider.dart';

import 'package:rxdart/rxdart.dart';

class MundoBloc {

  final _mundoController = new BehaviorSubject<List<Mundo>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _mundoProvider = new MundoProvider();


  Stream<List<Mundo>> get mundoStream => _mundoController.stream;
  Stream<bool> get cargandoStream => _cargandoController.stream;


  void cargarMundo() async {

    final mundo = await _mundoProvider.getMundo();
    _mundoController.sink.add( mundo );

  }

  Future<void> refrescarMundo() async {

      cargarMundo();

  }
  

  dispose() {

    _mundoController?.close();
    _cargandoController?.close();

  }

}