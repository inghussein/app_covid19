import 'package:flutter/material.dart';

class OrdenModelo extends ChangeNotifier{

  bool _ordenAscendente = true;

  bool get ordenAscendente => this._ordenAscendente;

  set ordenAscendente (bool valor){
    this._ordenAscendente = valor;
    notifyListeners();
  }

}