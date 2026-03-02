import 'package:flutter/material.dart';
import 'package:girl_clan/core/enums/view_state_model.dart';
import 'package:provider/provider.dart';

class counterScreen extends StatelessWidget {
  const counterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("build");
    return ChangeNotifierProvider(
      create: (context) => counterViewModel(),
      child: Consumer<counterViewModel>(
        builder:
            (context, model, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  model.increment();
                  print(model.counter);
                  //  setState(() {});
                },
              ),
              body: Center(child: Text(model.counter.toString())),
            ),
      ),
    );
  }
}

class counterViewModel extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}
