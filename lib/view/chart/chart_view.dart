import 'package:finblox_assignment/component/duration_selector/duration_selector.dart';
import 'package:finblox_assignment/model/coin.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stacked/stacked.dart';

import 'chart_viewmodel.dart';
import 'coin_status_header.dart';

class ChartView extends StatelessWidget {
  final Coin coin;

  const ChartView({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<ChartViewModel>.reactive(
        onModelReady: (vm) => vm.init(),
        viewModelBuilder: () => ChartViewModel(coin: coin),
        builder: (_, vm, __) => Scaffold(
          appBar: AppBar(title: Text(vm.titleBar)),
          body: vm.isBusy
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CoinStatusHeader(
                        currentPrice: vm.currentPrice,
                        detailChange: vm.detailPriceChange,
                        percentChange: vm.percentPriceChange,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: vm.chartFetchState == ChartFetchState.fetching
                            ? const Center(child: CircularProgressIndicator())
                            : LineChart(
                                LineChartData(
                                  lineTouchData: LineTouchData(),
                                  gridData: FlGridData(show: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      isCurved: true,
                                      colors: const [Colors.blue],
                                      barWidth: 2,
                                      isStrokeCapRound: true,
                                      dotData: FlDotData(show: false),
                                      belowBarData: BarAreaData(
                                        show: true,
                                        colors: [
                                          const Color(0x33aa4cfc),
                                        ],
                                      ),
                                      spots: _buildLineData(vm.coinPrices),
                                    ),
                                  ],
                                  minX: vm.minX.toDouble(),
                                  maxX: vm.maxX.toDouble(),
                                  maxY: vm.maxPrice,
                                  minY: vm.minPrice,
                                ),
                              ),
                      ),
                      const SizedBox(height: 24),
                      DurationSelector(
                        durations: vm.chartDurations,
                        onDurationTap: vm.onChartStateChangeRequest,
                      ),
                    ],
                  ),
                ),
        ),
      );

  List<FlSpot> _buildLineData(List<double> coinPrice) {
    final spots = <FlSpot>[];

    for (var i = 0; i < coinPrice.length; i++) {
      spots.add(FlSpot(i.toDouble(), coinPrice[i]));
    }

    return spots;
  }
}
