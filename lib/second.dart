import 'package:counter_list_provider/provider/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Second extends StatelessWidget {
  const Second({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, numbersListProvider, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numbersListProvider.add();
          },
          child: const Icon(Icons.add_box_rounded),
        ),
        appBar: AppBar(
          title: const Text("Go Back"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: Text(
                numbersListProvider.numbers.last.toString(),
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              width: double.maxFinite,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: numbersListProvider.numbers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      numbersListProvider.numbers[index].toString(),
                      style: const TextStyle(fontSize: 30),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
