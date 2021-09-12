import 'package:finblox_assignment/view/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<HomeViewModel>.nonReactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (_, vm, __) => Scaffold(
          appBar: AppBar(
            title: Text(vm.homeTitle),
          ),
          body: Center(
            child: ElevatedButton(
              child: const Text('Bitcoin chart'),
              onPressed: vm.onChartPress,
            ),
          ),
        ),
      );
}
