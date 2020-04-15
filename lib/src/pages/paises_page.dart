import 'package:app_covid19/src/bloc/paises_bloc.dart';
import 'package:app_covid19/src/bloc/provider.dart';
import 'package:app_covid19/src/models/orden_model.dart';
import 'package:app_covid19/src/models/paises_model.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PaisesPage extends StatefulWidget {
    
  @override
  _PaisesPageState createState() => _PaisesPageState();
}

class _PaisesPageState extends State<PaisesPage> {  

  @override
  Widget build(BuildContext context) {

    final paisesBloc = ProviderBloc.paisesBloc(context);
    paisesBloc.cargarPaises();

    return  Stack(
      children: <Widget>[
        listaPaises(paisesBloc)
      ],
    );
  }

  Future<Null> actualizarListaPaises() async
  {
    final paisesBloc = ProviderBloc.paisesBloc(context);

    paisesBloc.refrescarPaises();

 
  }

  Widget listaPaises(PaisesBloc paisesBloc) {

    final bool ordenAscendente = Provider.of<OrdenModelo>(context).ordenAscendente;

    return SafeArea(
          child: StreamBuilder(
       stream: paisesBloc.paisesStream ,     
       builder: (BuildContext context, AsyncSnapshot<List<Pais>> snapshot){

         if ( snapshot.hasData ){

        //  utils.detenerNuevoIndicadorCarga(context);

           List<Pais> paises = snapshot.data;  

           Comparator<Pais> ascendenteComparator = (a, b) => a.totalConfirmed.compareTo(b.totalConfirmed);

           Comparator<Pais> descendenteComparator = (a, b) => b.totalConfirmed.compareTo(a.totalConfirmed);

           paises.sort(
             (ordenAscendente) ? ascendenteComparator : descendenteComparator);

           if(paises.length > 0){

             return LiquidPullToRefresh(
             showChildOpacityTransition: false,
             springAnimationDurationInMilliseconds: 500,
            //  color: utils.colorPrimarioFuerte(),
             onRefresh: actualizarListaPaises,
             child: ListView.builder(                              
               itemCount: paises.length,
               itemBuilder: (context, i) => _lista(context, paises[i]),                      

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
      ),
    );
    
  }

  Widget _lista(BuildContext context, Pais pais){

    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      animationDuration: Duration(milliseconds: 500),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );


    return GestureDetector(
          onTap: (){

             Alert(
      context: context,
      style: alertStyle,
      // type: tipo == 'Error' ? AlertType.error : AlertType.success,
      title: 'Detalle de ${pais.country}',
      // desc: mensaje,
      content: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20,),
          Text('Nuevos Casos Confirmados: ${pais.newConfirmed}', 
          style: TextStyle(
            fontSize: 18
          ),),
          Divider(color: Colors.blue,),
          Text('Total Casos Confirmados: ${pais.totalConfirmed}', 
          style: TextStyle(
            fontSize: 18
          ),),
          Divider(color: Colors.blue,),
          Text('Nuevas Muertes: ${pais.newDeaths}', 
          style: TextStyle(
            fontSize: 18
          ),),
          Divider(color: Colors.blue,),
          Text('Total Muertes: ${pais.totalDeaths}', 
          style: TextStyle(
            fontSize: 18
          ),),
          Divider(color: Colors.blue,),
          Text('Nuevos Recuperados: ${pais.newRecovered}', 
          style: TextStyle(
            fontSize: 18
          ),),
          Divider(color: Colors.blue,),
          Text('Total Recuperados: ${pais.totalRecovered}', 
          style: TextStyle(
            fontSize: 18
          ),),
          Divider(color: Colors.blue,),
          Text('Fecha: ${pais.date}', 
          style: TextStyle(
            fontSize: 18
          ),),
        ],),
      buttons: [
        DialogButton(
          color: Colors.blue,
          child: Text(
            "Aceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
                
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Text(pais.countryCode),
                title: Text(pais.country),
                trailing: Text(pais.totalConfirmed.toString()),
              ),
              Divider(
                color: Colors.blue,
              )
            ],
          )
          );




                  

  }
}