import 'package:counter_list_provider/provider/list_provider.dart';
import 'package:counter_list_provider/second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, numbersProviderModel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numbersProviderModel.add();
          },
          child: const Icon(Icons.add_box_rounded),
        ),
        appBar: AppBar(
          title: const Text("Number List Counter"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: Text(
                numbersProviderModel.numbers.last.toString(),
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: numbersProviderModel.numbers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      numbersProviderModel.numbers[index].toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Second()));
                  },
                  icon: const Icon(Icons.navigate_next),
                  label: const Text("Next Page")),
            )
          ],
        ),
      ),
    );
  }
}
