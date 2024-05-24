import 'package:flutter/material.dart';
import 'package:projeto_api_clima_localizacao/Model/city_db_model.dart';

import '../Controller/city_db_controller.dart';
import '../Controller/weather_controller.dart';

class CityDetailsScreen extends StatefulWidget {
  final String city;
  const CityDetailsScreen({super.key, required this.city});

  @override
  State<CityDetailsScreen> createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  final WeatherController _controller = WeatherController();
  bool isFavorited = false;
  final CityDbController _dbController = CityDbController();
  late CityDb cityDb;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _favoriteState(widget.city);
  }

  Future<void> _favoriteState(String city) async{
    cityDb = (await _dbController.getCity(city))!;
    if(cityDb.favoritesCities == 0){
      isFavorited = false;
    }else{
      isFavorited = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.city),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child:Center(
          child: FutureBuilder(
            future: _controller.getFromWeatherService(widget.city), 
            builder: (context,snapshot){
              if(_controller.listWeather.isEmpty){
                return CircularProgressIndicator();
              }else{
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_controller.listWeather.last.city),
                        //favorite icon
                        IconButton(
                          icon: isFavorited ? Icon(Icons.favorite):Icon(Icons.favorite_border_outlined),
                          onPressed: (){
                            setState(() {
                              isFavorited = !isFavorited;
                            });
                            if(isFavorited ==true) {
                              cityDb.favoritesCities = 1;
                              //update
                              _dbController.update(cityDb);
                            }else{
                              cityDb.favoritesCities = 0;
                              //update
                              _dbController.update(cityDb);
                            }
                            //criar a função para favoritar
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 12,),
                    Text(_controller.listWeather.last.description),
                    const SizedBox(height: 12,),
                    Text((_controller.listWeather.last.temp-273).toStringAsFixed(2)),
                    const SizedBox(height: 12,),
                  ],
                );
              }
            }),
        )),
      
    );
  }
}