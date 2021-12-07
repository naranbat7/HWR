import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class CommonEvent extends Equatable {
  CommonEvent([List props = const []]) : super();
}

class CommonRequest extends CommonEvent {
  final File file;

  CommonRequest({required this.file}) : super([file]);

  List<Object?> get props => [file];
}
