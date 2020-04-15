import 'package:app_covid19/src/models/paises_model.dart';
import 'package:app_covid19/src/providers/paises_provider.dart';
import 'package:rxdart/rxdart.dart';
// import 'package:tu_moto_express/src/models/paises_model.dart';
// import 'package:tu_moto_express/src/providers/paises_provider.dart';

class PaisesBloc {

  final _paisesController = new BehaviorSubject<List<Pais>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _paisesProvider = new PaisesProvider();


  Stream<List<Pais>> get paisesStream => _paisesController.stream;
  Stream<bool> get cargandoStream => _cargandoController.stream;


  void cargarPaises() async {

    final paises = await _paisesProvider.getPaises();
    _paisesController.sink.add( paises );

  }

  Future<void> refrescarPaises() async {

      cargarPaises();

  }
  

  dispose() {

    _paisesController?.close();
    _cargandoController?.close();

  }

}