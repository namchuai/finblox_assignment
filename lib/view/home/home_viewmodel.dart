import 'package:finblox_assignment/model/coin.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app.locator.dart';
import '../../app.router.dart';

class HomeViewModel extends BaseViewModel {
  final _homeTitle = 'Home';

  String get homeTitle => _homeTitle;

  void onChartPress() {
    locator.get<NavigationService>().navigateTo(Routes.chartView,
        arguments: ChartViewArguments(coin: Coin.bitcoin));
  }
}
