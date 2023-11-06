import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }
  //async keyword to modify the function
  //await means that wait until this complete before you continue doing anything

  void initState() {
    //TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    String myMargin = '50';
    double myMarginAsADouble;

    try {
      myMarginAsADouble = double.parse(myMargin);
    } catch (e) {
      print(e);
      myMarginAsADouble = 30.0;
    }

    return const Scaffold(
      body: Center(
        child: SpinKitSpinningCircle(
          color: Colors.yellow,
          size: 100,
        ),
      ),
    );
  }
}

// try{
//   //do something that might fail
// }
// catch(e){
//   //catch an exceptions that occur
// }

// main(){
//   String myString = 'abc';
//   try{
//     double myStringAsDouble = double.parse(myString);
//     print(myStringAsDouble + 5);
//   }
//   catch(exception){
//     print(exception);
//   }
// }
