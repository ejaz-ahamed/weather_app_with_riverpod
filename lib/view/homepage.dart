import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/riverpod_as_solution/provider_weather.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: ref.watch(weatherProvider).when(
            data: (data) {
              if (data == null) {
                return const Center(
                  child: Text("Error occured while fetching data...!"),
                );
              } else {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: Column(
                    children: [
                      Text(
                        data.city.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/images/cloudy.png",
                        width: 70,
                      ),
                      Text(
                          "${(data.list[1].main.temp - 273.15).toStringAsFixed(2)}°C",
                          style: GoogleFonts.ptSans(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      Text(
                        "Feels like  ${(data.list[1].main.feelsLike - 273.15).toStringAsFixed(2)}°C",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        data.list[0].weather[0].description.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Wind Speed : ${data.list[0].wind.speed.toString()} mb",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              "Humidity : ${data.list[0].main.humidity.toString()}°C",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              "Pressure : ${data.list[0].main.pressure.toString()}Kwp",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height / 2.8,
                            decoration: BoxDecoration(
                              color: const Color(0xff6AA6E5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  final temp = data.list[index].main.temp;
                                  int weather = 280;
                                  return ListTile(
                                    title: Text(
                                      "${data.list[index].dtTxt.hour}:${data.list[index].dtTxt.minute}${data.list[index].dtTxt.minute}:${data.list[index].dtTxt.second}${data.list[index].dtTxt.millisecond}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    leading: weather <= temp
                                        ? const Icon(
                                            Icons.cloud,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.sunny,
                                            color: Colors.white,
                                          ),
                                    trailing: Text(
                                      data.list[index].main.temp.toString(),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 15,
                                    ),
                                itemCount: 8)),
                      )
                    ],
                  ),
                );
              }
            },
            error: (error, stackTrace) => const Center(
              child: Text("Something went wrong...please retry"),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
