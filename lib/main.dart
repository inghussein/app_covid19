import 'package:app_covid19/src/bloc/provider.dart';
import 'package:app_covid19/src/models/orden_model.dart';
import 'package:app_covid19/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => OrdenModelo(),
  child: MyApp()
  )
  );
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderBloc(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App COVID-19',
        home: HomePage()
      ),
    );
  }
}