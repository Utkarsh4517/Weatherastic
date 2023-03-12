import 'package:flutter/material.dart';
import 'repo.dart';
import 'weather_model.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text("Weatherastic!"),
              centerTitle: true,
            ),
            body: SingleChildScrollView(

              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Check Weather",
                      maxLines: 2,
                      // ignore: unnecessary_new
                      style: new TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: <Color>[
                              Colors.pinkAccent,
                              Colors.deepPurpleAccent,
                              Colors.red
                              //add more color here.
                            ],
                          ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 1000.0, 100.0),
                          ),
                      ),
                    ),
                    Text(
                      "City: ${weatherModel?.name} ",
                      style: GoogleFonts.fragmentMono(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Text(
                      "Current Temp: ${weatherModel?.main?.temp} °C",
                      style: GoogleFonts.fragmentMono(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Text(
                      "Minimum Temp: ${weatherModel?.main?.tempMin} °C",
                      style: GoogleFonts.fragmentMono(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Text(
                      "Maximum Temp: ${weatherModel?.main?.tempMax} °C",
                      style: GoogleFonts.fragmentMono(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Text(
                      "Feels Like: ${weatherModel?.main?.feelsLike} °C",
                      style: GoogleFonts.fragmentMono(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Text(
                      "Pressure: ${weatherModel?.main?.pressure} hPa",
                      style: GoogleFonts.fragmentMono(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Text(
                      "Humidity: ${weatherModel?.main?.humidity} %",
                      style: GoogleFonts.fragmentMono(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Text(
                      "Wind speed: ${weatherModel?.wind?.speed} kmph",
                      style: GoogleFonts.fragmentMono(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 450,
                        child: TextField(
                          
                          controller: controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            filled: true,
                            fillColor: Colors.grey,
                            hintText: 'Enter City!',
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          weatherModel = await Repo().getWeather(controller.text);
                          // ignore: avoid_print
                          print(weatherModel?.main?.temp ?? "error");
                          setState(() {});
                        },
                        child: const Text("search")),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      'made with ♡ by utkarsh shrivastava\nusing openweatherapi',
                      style: GoogleFonts.montserrat(
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
