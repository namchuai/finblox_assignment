import 'dart:math';

import 'package:finblox_assignment/component/duration_selector/selectable_duration.dart';
import 'package:finblox_assignment/model/coin.dart';
import 'package:finblox_assignment/service/mock/mock_crypto_price_service.dart';
import 'package:stacked/stacked.dart';

import '../../app.locator.dart';

enum ChartFetchState {
  fetching,
  success,
}

class ChartViewModel extends BaseViewModel {
  final Coin coin;

  final _chartDurations = <SelectableDuration>[];

  ChartDuration _currentChartDuration = ChartDuration.values[0];

  ChartFetchState _chartFetchState = ChartFetchState.fetching;

  double? _currentPrice;

  double? _detailPriceChange;

  double? _percentPriceChange;

  final _coinPrices = <double>[];

  double? _minPrice;

  double? _maxPrice;

  String get fullCoinName => coin.fullRepresent();

  String get shortCoinName => coin.shortRepresent();

  String get titleBar => '${coin.fullRepresent()} charts';

  List<SelectableDuration> get chartDurations => _chartDurations;

  double get currentPrice => _currentPrice ?? 0.0;

  double get detailPriceChange => _detailPriceChange ?? 0.0;

  double get percentPriceChange => _percentPriceChange ?? 0.0;

  List<double> get coinPrices => _coinPrices;

  int get minX => _currentChartDuration.min();

  int get maxX => _currentChartDuration.max();

  double get minPrice => _minPrice ?? 0.0;

  double get maxPrice => _maxPrice ?? 0.0;

  ChartFetchState get chartFetchState => _chartFetchState;

  ChartViewModel({
    required this.coin,
  });

  Future<void> init() async {
    setBusy(true);
    for (final duration in ChartDuration.values) {
      _chartDurations.add(SelectableDuration(
        duration: duration,
        isSelected: duration == _currentChartDuration,
      ));
    }

    await _getCoinStatus();
    await _getCoinPrices(_currentChartDuration);

    setBusy(false);
  }

  Future<void> _getCoinStatus() async {
    final priceService = locator.get<MockCryptoPriceService>();

    _currentPrice = await priceService.getCurrentPrice(coin);
    _detailPriceChange = await priceService.getDetailChange(coin);
    _percentPriceChange = await priceService.getPercentChange(coin);
  }

  Future<void> _getCoinPrices(ChartDuration duration) async {
    final prices = await locator
        .get<MockCryptoPriceService>()
        .getCoinPriceByDuration(duration);
    if (prices != null && prices.isNotEmpty) {
      _coinPrices.clear();
      _coinPrices.addAll(prices);
      _minPrice = _coinPrices.reduce(min);
      _maxPrice = _coinPrices.reduce(max);
    }
    _chartFetchState = ChartFetchState.success;
  }

  void onChartStateChangeRequest(SelectableDuration newDuration) {
    if (newDuration.duration == _currentChartDuration) {
      // nothing to do.
      return;
    }

    // update chart state
    _currentChartDuration = newDuration.duration;
    for (final duration in _chartDurations) {
      duration.isSelected = duration.duration == newDuration.duration;
    }
    _chartFetchState = ChartFetchState.fetching;
    _getCoinPrices(_currentChartDuration).then((value) {
      // _chartFetchState = ChartFetchState.success;
      notifyListeners();
    });
    notifyListeners();
  }
}
