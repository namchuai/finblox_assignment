import 'package:finblox_assignment/view/chart/chart_view.dart';
import 'package:finblox_assignment/view/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'service/mock/mock_crypto_price_service.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomeView, initial: true),
  MaterialRoute(page: ChartView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: MockCryptoPriceService),
])
class App {}
