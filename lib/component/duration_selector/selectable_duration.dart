class SelectableDuration {
  ChartDuration duration;
  bool isSelected;

  SelectableDuration({required this.duration, this.isSelected = false});
}

enum ChartDuration {
  week,
  month,
  sixMonth,
}

extension ChartDurationX on ChartDuration {
  String toShort() {
    switch (this) {
      case ChartDuration.week:
        return '1W';
      case ChartDuration.month:
        return '1M';
      case ChartDuration.sixMonth:
        return '6M';
      default:
        throw UnsupportedError('Not support ChartDuration $this');
    }
  }

  int max() {
    switch (this) {
      case ChartDuration.week:
        return 6;
      case ChartDuration.month:
        return 30;
      case ChartDuration.sixMonth:
        return 180;
      default:
        throw UnsupportedError('Not support ChartDuration $this');
    }
  }

  int min() {
    return 0;
  }
}
