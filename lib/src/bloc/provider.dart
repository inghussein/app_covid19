import 'package:app_covid19/src/bloc/mundo_bloc.dart';
import 'package:app_covid19/src/bloc/paises_bloc.dart';
import 'package:flutter/material.dart';

class ProviderBloc extends InheritedWidget {

  final _paisesBloc = new PaisesBloc();  
  final _mundoBloc = new MundoBloc();  


  static ProviderBloc _instancia;

  factory ProviderBloc({ Key key, Widget child }){

    if( _instancia == null )
    {

      _instancia = new ProviderBloc._internal(key: key, child: child);

    }

    return _instancia;

  }


  ProviderBloc._internal({ Key key, Widget child })
     : super(key: key, child: child );  
  

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PaisesBloc paisesBloc ( BuildContext context )  {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>()._paisesBloc);
  }  

  static MundoBloc mundoBloc ( BuildContext context )  {
    return (context.dependOnInheritedWidgetOfExactType<ProviderBloc>()._mundoBloc);
  }  


  
      

}