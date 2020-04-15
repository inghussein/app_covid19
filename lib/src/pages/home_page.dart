import 'package:app_covid19/src/models/orden_model.dart';
import 'package:app_covid19/src/pages/mundo_page.dart';
import 'package:app_covid19/src/pages/paises_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final bool ordenAscendente = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    length: 2,
      child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          // indicatorColor: Colors.red,
          tabs: [
            Tab(
              text: 'Paises',                  
              // icon: Icon(Icons.directions_car)
              ),
            Tab(
              text: 'Mundo',
              // icon: Icon(Icons.directions_transit)
              ),
            
          ],
        ),       
        // backgroundColor: utils.colorPrimarioFuerte(),
        // iconTheme: IconThemeData(color: utils.colorBlanco()),
        centerTitle: true,
        title: Text('App Covid-19', style: TextStyle(color: Colors.white),),
      ),
      body: TabBarView(
        children: [
         PaisesPage(),
         MundoPage()              
        ],
      ),
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.sort),
        onPressed: (){

          final ordenacionModelo = Provider.of<OrdenModelo>(context, listen: false);
      
          bool orden = ordenacionModelo.ordenAscendente;
     
          ordenacionModelo.ordenAscendente = !orden;

          String textoOrden;

          textoOrden = (orden) ? 'Descendente' :'Ascendente' ;
          setState(() {

          Toast.show(
            'Ordenando paises en forma $textoOrden', 
            context, 
            duration: 3, 
            gravity: 5, 
            // backgroundColor: colorPrimario(),
            // textColor: colorBlanco()
            );

          });

          
          
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ),
        );
  }
}

