import 'package:app_covid19/src/bloc/provider.dart';
import 'package:app_covid19/src/models/mundo_model.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';



class MundoPage extends StatefulWidget {
  @override
  _MundoPageState createState() => _MundoPageState();
}

class _MundoPageState extends State<MundoPage> {
  @override
  Widget build(BuildContext context) {
    final mundoBloc = ProviderBloc.mundoBloc(context);
    mundoBloc.cargarMundo();

    return StreamBuilder(
       stream: mundoBloc.mundoStream ,     
       builder: (BuildContext context, AsyncSnapshot<List<Mundo>> snapshot){

         if ( snapshot.hasData ){


           final mundo = snapshot.data;            


           if(mundo.length > 0){

             return LiquidPullToRefresh(
             showChildOpacityTransition: false,
             springAnimationDurationInMilliseconds: 500,
            //  color: utils.colorPrimarioFuerte(),
             onRefresh: actualizarMundo,
             child: ListView.builder(                              
               itemCount: mundo.length,
               itemBuilder: (context, i) {

                 return Center(
          child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Text('Nuevos Casos Confirmados:', 
          style: TextStyle(
            fontSize: 18
          ),),
          Text('${mundo[i].newConfirmed}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          )),
          Divider(color: Colors.blue,),
          Text('Total Casos Confirmados:', 
          style: TextStyle(
            fontSize: 18
          ),),
          Text('${mundo[i].totalConfirmed}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          )),
          Divider(color: Colors.blue,),
          Text('Nuevas Muertes:', 
          style: TextStyle(
            fontSize: 18
          ),),
          Text('${mundo[i].newDeaths}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          )),
          Divider(color: Colors.blue,),
          Text('Total Muertes:', 
          style: TextStyle(
            fontSize: 18
          ),),
          Text('${mundo[i].totalDeaths}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          )),
          Divider(color: Colors.blue,),
          Text('Nuevos Recuperados:', 
          style: TextStyle(
            fontSize: 18
          ),),
          Text('${mundo[i].newRecovered}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          )),
          Divider(color: Colors.blue,),
          Text('Total Recuperados:', 
          style: TextStyle(
            fontSize: 18
          ),),  
          Text('${mundo[i].totalRecovered}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          )),      
        ],
      ),
    );



               },                      

             ),
           );

             


           } else {        

              return Container(
                child: Center(
                  child: Text('No hay datos'),
                ),
              );
            
           }         

         } else{

              // utils.nuevoIndicadorCarga(context);
              return Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              );

         }

         }
      );
    
    
    
  }

  Future<Null> actualizarMundo() async
  {
    final mundoBloc = ProviderBloc.mundoBloc(context);

    mundoBloc.refrescarMundo();

 
  }
}