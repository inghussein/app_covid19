class Paises{

  List<Pais> items = new List();

  Paises();

  Paises.fromJsonList( List<dynamic> jsonList ){

    if( jsonList == null ) return;

    for (var item in jsonList) {

      final pais = new Pais.fromJsonMap( item );
      items.add( pais );
    }

  }
}


class Pais {

  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;

  Pais({
    this.country,
    this.countryCode,
    this.slug,
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.date
  });


  Pais.fromJsonMap( Map<String, dynamic> json ) {

    country               =json['Country'];
    countryCode           =json['CountryCode'];
    slug                  =json['Slug'];
    newConfirmed          =json['NewConfirmed'];
    totalConfirmed        =json['TotalConfirmed'];
    newDeaths             =json['NewDeaths'];
    totalDeaths           =json['TotalDeaths'];
    newRecovered          =json['NewRecovered'];
    totalRecovered        =json['TotalRecovered'];
    date                  =json['Date'];

  }

}
