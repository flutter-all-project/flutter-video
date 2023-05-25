import 'package:flutter/material.dart';

// https://blog.csdn.net/ZuoYueLiang/article/details/125140890
// Theme.of(context).extension<StatusColors>().open;

@immutable
class StatusColors extends ThemeExtension<StatusColors> {
  static const light = StatusColors(
    open: Colors.green,
    closed: Colors.red,
  );

  static const dark = StatusColors(
    open: Colors.white,
    closed: Colors.brown,
  );

  const StatusColors({required this.open, required this.closed});

  final Color? open;
  final Color? closed;

  @override
  StatusColors copyWith({
    Color? success,
    Color? info,
  }) {
    return StatusColors(
      open: success ?? open,
      closed: info ?? closed,
    );
  }

  @override
  StatusColors lerp(ThemeExtension<StatusColors>? other, double t) {
    if (other is! StatusColors) {
      return this;
    }

    return StatusColors(
      open: Color.lerp(open, other.open, t),
      closed: Color.lerp(closed, other.closed, t),
    );
  }

  @override
  String toString() => 'StatusColors('
      'open: $open, closed: $closed'
      ')';
}
