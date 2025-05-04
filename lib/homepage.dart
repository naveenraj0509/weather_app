import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/grid_view_model.dart';
import 'package:weather_app/widgets/grid_view_widget.dart';
import 'package:weather_app/widgets/weather_hour_widget.dart';
import 'models/get_weather_forecast_model.dart';
import 'models/weather_hour_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Dio dio = Dio();

  GetWeatherForecastModel? forecastModel;
  String? _currentAddress;
  Position? _currentPosition;
  bool isLoading = true;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services'),
        ),
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.'),
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    print("1234567890");
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
          print("qwertyuiop");
      setState(() => _currentPosition = position);
      await _getAddressFromLatLng(_currentPosition!);
      print("asdfghjkl");
      getWeather();
      // await getWeather();
    }).catchError((e) {
      debugPrint(e.toString());
    });
    // await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
    //     .then((Position position) async {
    //   setState(() => _currentPosition = position);
    //   // await  getWeather();
    // }).catchError((e) {
    //   debugPrint(e);
    // });

  }

  Future<void> _getAddressFromLatLng(Position position) async {
    print("[]]");
    print(_currentPosition!.latitude);
    print(_currentPosition!.longitude);
    await placemarkFromCoordinates(
            _currentPosition?.latitude??0.00, _currentPosition?.longitude??0.00)
        .then((List<Placemark> placemarks) {
      print("\\\\\\\\\\\\\\\\");
      Placemark place = placemarks[0];
      setState(() {

        _currentAddress =
            '${place.subAdministrativeArea},${place.administrativeArea}';
      });
      print("|qwertyuiqwertyuio"*20);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  // getWeather() async {
  //   final response = await dio.get(
  //     "https://open-weather13.p.rapidapi.com/city/landon/EN",
  //     options: Options(headers: {
  //       'x-rapidapi-host': 'open-weather13.p.rapidapi.com',
  //       'x-rapidapi-key': 'c262066a73msh5a43f0a74557867p141731jsn00ed867afcdb'
  //
  //     }),
  //   );
  //   forecastModel = GetWeatherForecastModel.fromJson(response.data);
  // }
  getWeather() async {
    final lat = _currentPosition!.latitude;
    final lon = _currentPosition!.longitude;

    // Use the lat and lon values to construct the API URL
    final response = await dio.get(
      "https://api.tomorrow.io/v4/weather/forecast?location=$lat,$lon&apikey=ApfEckILWycJToUoMrFnegh2YaxzGipW",
    );

    // Process the response data
    forecastModel = GetWeatherForecastModel.fromJson(response.data);
    setState(() {
      isLoading = false;
      // Update the UI with the weather forecast data
    });
  }

  @override
  void initState() {
    _getCurrentPosition();

    // TODO: implement initState
    super.initState();
  }

  @override
  final List<WeatherHourModel> weatherperhr = [
    WeatherHourModel(
        time: 'NOW', image: 'assets/images/cloud.png', temp: '31°'),
    WeatherHourModel(time: '12', image: 'assets/images/cloud.png', temp: '30°'),
    WeatherHourModel(
        time: '13', image: 'assets/images/sunshine.png', temp: '30°'),
    WeatherHourModel(
        time: '14', image: 'assets/images/sunshine.png', temp: '29°'),
    WeatherHourModel(
        time: '15', image: 'assets/images/sunshine.png', temp: '28°')
  ];
  final List<GridViewModel> gridviewlist = [
    GridViewModel(
        gridicon: Icons.sunny,
        title: 'UV INDEX',
        text: "",
        image: 'assets/images/uv-index.png',
        text2: 'High for the rest of the day'),
    GridViewModel(
        gridicon: CupertinoIcons.sunset_fill,
        title: 'SUNSET',
        text: '18.01',
        image: 'assets/images/sunset.png',
        text2: 'Sunrise 06:32 '),
    GridViewModel(
        gridicon: CupertinoIcons.wind,
        title: 'WIND',
        text: '2 Km/hr',
        image: 'assets/images/compass.png'),
    GridViewModel(
        gridicon: CupertinoIcons.thermometer,
        title: 'FEELS LIKE',
        text: '21°c',
        image: 'assets/images/snowflake.png',
        text2: 'Similar to the actual temperature'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              // width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/snow.webp'),
                    fit: BoxFit.cover),
              ),
              child: SingleChildScrollView(scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Lottie.asset(
                      'assets/lottie/Animation - 1733737632675.json',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            ' ${_currentAddress ?? ""}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                height: 1,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        const SizedBox(height: 32),
                        IconButton(
                          onPressed: _getCurrentPosition,
                          icon: Icon(
                            CupertinoIcons.refresh_circled,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'LAT: ${_currentPosition?.latitude ?? ""}',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     Text(
                    //       'LNG: ${_currentPosition?.longitude ?? ""}',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //     Text(
                    //       'ADDRESS: ${_currentAddress ?? ""}',
                    //       style: TextStyle(color: Colors.white),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          forecastModel?.timelines!.daily?[0].values
                                  ?.temperatureApparentAvg
                                  ?.round()
                                  .toString() ??
                              "",
                          style: TextStyle(
                              color: Colors.white,
                              height: 1,
                              fontSize: 80,
                              fontWeight: FontWeight.w100),
                        ),
                        Text(
                          '°C',
                          style: TextStyle(
                              color: Colors.white,
                              height: 1,
                              fontSize: 50,
                              fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                    Text(
                      'Mostly cloudy',
                      style: TextStyle(
                          color: Colors.white,
                          height: 1,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "H :",
                          style: TextStyle(
                              color: Colors.white,
                              height: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          forecastModel?.timelines!.daily?[0].values
                                  ?.temperatureApparentMax
                                  ?.round()
                                  .toString() ??
                              "",
                          style: TextStyle(
                              color: Colors.white,
                              height: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "L :",
                          style: TextStyle(
                              color: Colors.white,
                              height: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          forecastModel?.timelines?.daily?[0].values
                                  ?.temperatureApparentMin
                                  ?.round()
                                  .toString() ??
                              "",
                          style: TextStyle(
                              color: Colors.white,
                              height: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),

                    Card(
                      color: Colors.transparent,
                      surfaceTintColor: Colors.green,
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: weatherperhr.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: WeatherHourWidget(
                                  // time: weatherperhr[index].time,
                                  time: index == 0
                                      ? forecastModel!
                                          .timelines!.daily![0].time!.day
                                          .toString()
                                      : index == 1
                                          ? forecastModel!
                                              .timelines!.daily![1].time!.day
                                              .toString()
                                          : index == 2
                                              ? forecastModel!.timelines!
                                                  .daily![2].time!.day
                                                  .toString()
                                              : index == 3
                                                  ? forecastModel!.timelines!
                                                      .daily![3].time!.day
                                                      .toString()
                                                  : forecastModel!.timelines!
                                                      .daily![4].time!.day
                                                      .toString(),
                                  image: AssetImage(weatherperhr[index].image),
                                  temp: index == 0
                                      ? forecastModel!.timelines!.daily![0]
                                          .values!.temperatureAvg!
                                          .round()
                                          .toString()
                                      : index == 1
                                          ? forecastModel!.timelines!.daily![1]
                                              .values!.temperatureAvg!
                                              .round()
                                              .toString()
                                          : index == 2
                                              ? forecastModel!
                                                  .timelines!
                                                  .daily![2]
                                                  .values!
                                                  .temperatureAvg!
                                                  .round()
                                                  .toString()
                                              : index == 3
                                                  ? forecastModel!
                                                      .timelines!
                                                      .daily![3]
                                                      .values!
                                                      .temperatureAvg!
                                                      .round()
                                                      .toString()
                                                  : forecastModel!
                                                      .timelines!
                                                      .daily![4]
                                                      .values!
                                                      .temperatureAvg!
                                                      .round()
                                                      .toString()),
                            );
                          },
                        ),
                      ),
                    ),
                    GridView.count(physics: ScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      shrinkWrap: true,
                      children: List.generate(gridviewlist.length, (index) {
                        return Center(
                          child: GridViewWidget(
                            gridicon: gridviewlist[index].gridicon,
                            title: gridviewlist[index].title,
                            text: index == 0
                                ? forecastModel!
                                    .timelines!.daily![0].values!.uvIndexAvg!
                                    .round()
                                    .toString()
                                : index == 1
                                    ? DateFormat('HH: mm').format(
                                        DateTime.parse(forecastModel!.timelines!
                                            .daily![0].values!.sunriseTime!
                                            .toString()))
                                    : index == 2
                                        ? forecastModel!.timelines!.daily![0]
                                            .values!.windSpeedAvg
                                            .toString()
                                        : forecastModel!.timelines!.daily![0]
                                            .values!.visibilityAvg
                                            .toString(),
                            image: AssetImage(gridviewlist[index].image),
                            text2: gridviewlist[index].text2,
                          ),
                        );
                      }),
                    ),
                SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}
