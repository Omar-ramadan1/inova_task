import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  @optionalTypeArgs
  void pop<T extends Object?>([T? result]) {
    return Navigator.of(this).pop<T>(result);
  }

  @optionalTypeArgs
  Future<T?> push<T extends Object?>(Widget widget) {
    return Navigator.of(this).push(
      MaterialPageRoute<T>(builder: (_) => widget),
    );
  }

  @optionalTypeArgs
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed<T?, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  @optionalTypeArgs
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamed<T?>(routeName, arguments: arguments);
  }

  @optionalTypeArgs
  Future<T?> pushAndRemoveUntil<T extends Object?>(Widget widget) {
    return Navigator.of(this).pushAndRemoveUntil<T?>(
      MaterialPageRoute(builder: (_) => widget),
      (route) => false,
    );
  }
}
