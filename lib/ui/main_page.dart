// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_28/model/weather_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    final formatter = DateFormat('MMMM dd, yyyy');
    final formattedDate = formatter.format(currentDate);

    List<WeatherModel> data = [
      WeatherModel(day: 'Mondat', image: 'assets/sun_1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun_1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun_1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun_1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun_1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun_1.png', temp: '10'),
      WeatherModel(day: 'Mondat', image: 'assets/sun_1.png', temp: '10'),
    ];
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xffBC2C35),
              Color(0xffF1B14B),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Text(
                'San Francisco',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                    color: Colors.white),
              ),
              const SizedBox(height: 15),
              const Text(
                'Clear',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                    color: Colors.white),
              ),
              const SizedBox(height: 33),
              Image.asset(
                'assets/sun_1.png',
                height: 100,
              ),
              const SizedBox(height: 12),
              Text(
                formattedDate,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
              //  const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) => WeatherWidget(
                    model: data[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.model,
  });
  final WeatherModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.day,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Image.asset(model.image, width: 25),
          Text(
            model.temp,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
