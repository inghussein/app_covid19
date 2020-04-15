class Mundiales{

  List<Mundo> items = new List();

  Mundiales();

  Mundiales.fromJsonList( Map jsonList ){

    if( jsonList == null ) return;

      final mundo = new Mundo.fromJsonMap( jsonList );

      items.add( mundo );
    

  }
}


class Mundo {

  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  Mundo({
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
  });


  Mundo.fromJsonMap( Map<String, dynamic> json ) {

    newConfirmed          =json['NewConfirmed'];
    totalConfirmed        =json['TotalConfirmed'];
    newDeaths             =json['NewDeaths'];
    totalDeaths           =json['TotalDeaths'];
    newRecovered          =json['NewRecovered'];
    totalRecovered        =json['TotalRecovered'];
  }

}
