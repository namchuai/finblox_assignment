import 'package:finblox_assignment/component/duration_selector/selectable_duration.dart';
import 'package:finblox_assignment/model/coin.dart';

abstract class CryptoPriceService {
  Future<double?> getCurrentPrice(Coin coin);

  Future<double?> getPercentChange(Coin coin);

  Future<double?> getDetailChange(Coin coin);

  Future<List<double>?> getCoinPriceByDuration(ChartDuration duration);
}
