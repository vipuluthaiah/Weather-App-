import 'package:flutter/material.dart';
import 'json.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MidView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;

  const MidView({Key key, this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    // var country = snapshot.data.city.country;
    var temo = forecastList[0].temp.day.toStringAsFixed(0);
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          color: Colors.redAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Currently in $city,",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
           
               Text(
                "$temo °F ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600),
              ),
                 Text(
                "${forecastList[0].weather[0].description}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      
        Container(
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
             Expanded(child: Padding(padding: EdgeInsets.all(20.0),
        child:  ListView.builder(
          scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          // itemCount: snapshot.data.list.length,
          itemBuilder: (BuildContext context,int index){
            return Column(
              children: <Widget>[
  ListTile(
                leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                title: Text("Temperature"),
                trailing: Text( "${forecastList[0].temp.day.toStringAsFixed(0)}°F "),
              ),
                ListTile(
                leading: FaIcon(FontAwesomeIcons.cloud),
                title: Text("Weather"),
                trailing: Text("${forecastList[0].weather[0].description}"),
              ),
                ListTile(
                leading: FaIcon(FontAwesomeIcons.sun),
                title: Text("Humidity"),
                trailing: Text("${forecastList[0].humidity.toStringAsFixed(1)} %"),
              ),
                ListTile(
                leading: FaIcon(FontAwesomeIcons.wind),
                title: Text("Wind Speed"),
                trailing: Text("${forecastList[0].speed.toStringAsFixed(1)} min/h"),
              ),
                 ListTile(
                leading: FaIcon(FontAwesomeIcons.airFreshener),
                title: Text("Feels Like"),
                trailing: Text( "${forecastList[0].feelsLike.morn}°F "),
              ),
                ListTile(
                leading: FaIcon(FontAwesomeIcons.temperatureLow),
                title: Text("Temp Min"),
                trailing: Text("${forecastList[0].temp.min}"),
              ),
                ListTile(
                leading: FaIcon(FontAwesomeIcons.temperatureHigh),
                title: Text("Temp Max"),
                trailing: Text("${forecastList[0].temp.max} %"),
              ),
                ListTile(
                leading: FaIcon(FontAwesomeIcons.water),
                title: Text("Sea Level"),
                trailing: Text("${forecastList[0].pressure} "),
              ),
              
                ListTile(
                leading: FaIcon(FontAwesomeIcons.cloud),
                title: Text("temp _KF"),
                trailing: Text("${forecastList[0].temp.max}"),
              ),
                ListTile(
                leading: FaIcon(FontAwesomeIcons.sun),
                title: Text("Wind Deg"),
                trailing: Text("${forecastList[0].deg} %"),
              ),
                ListTile(
                leading: FaIcon(FontAwesomeIcons.locationArrow),
                title: Text("Cod"),
                trailing: Text("${forecastList[0].weather[0].id}"),
              ),
              ],
            );
          },
          
          ),

        )),
            ],
          ),
        ),
      ],
    );
  }
}


