import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/riverpod_as_solution/listprovider.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
            scrollDirection: Axis.horizontal,
            itemCount: ref.watch(listProvider).length,
            itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      ref.watch(listProvider)[index],
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
