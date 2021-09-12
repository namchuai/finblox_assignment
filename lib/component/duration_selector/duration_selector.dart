import 'package:finblox_assignment/component/duration_selector/selectable_duration.dart';
import 'package:flutter/material.dart';

class DurationSelector extends StatelessWidget {
  final List<SelectableDuration> durations;
  final Function(SelectableDuration) onDurationTap;

  const DurationSelector({
    Key? key,
    required this.durations,
    required this.onDurationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (durations.isEmpty) {
      return const SizedBox();
    }
    final children = <Widget>[];
    for (final duration in durations) {
      children.add(
        _SelectableDurationWidget(duration: duration, onTap: onDurationTap),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}

class _SelectableDurationWidget extends StatelessWidget {
  final SelectableDuration duration;
  final Function(SelectableDuration) onTap;

  const _SelectableDurationWidget({
    Key? key,
    required this.duration,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onTap(duration),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // TODO: this should be declared in using Theme.
            color: duration.isSelected ? Colors.black : Colors.white,
          ),
          child: Center(
            child: Text(
              duration.duration.toShort(),
              style: TextStyle(
                color: duration.isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      );
}
