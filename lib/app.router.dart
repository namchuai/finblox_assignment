// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'model/coin.dart';
import 'view/chart/chart_view.dart';
import 'view/home/home_view.dart';

class Routes {
  static const String homeView = '/';
  static const String chartView = '/chart-view';
  static const all = <String>{
    homeView,
    chartView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.chartView, page: ChartView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    ChartView: (data) {
      var args = data.getArgs<ChartViewArguments>(nullOk: false);
      return MaterialPageRoute<MaterialRoute<dynamic>>(
        builder: (context) => ChartView(
          key: args.key,
          coin: args.coin,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// ChartView arguments holder class
class ChartViewArguments {
  final Key? key;
  final Coin coin;
  ChartViewArguments({this.key, required this.coin});
}
