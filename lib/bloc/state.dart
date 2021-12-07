import 'package:equatable/equatable.dart';
import 'package:hwr_app/model/psycho.dart';

abstract class CommonState extends Equatable {
  CommonState([List props = const []]) : super();
}

class CommonInitial extends CommonState {
  @override
  String toString() => "CommonInitial";

  @override
  List<Object?> get props => [];
}

class CommonLoading extends CommonState {
  @override
  String toString() => "CommonLoading";

  @override
  List<Object?> get props => [];
}

class CommonFailure extends CommonState {
  final String error;

  CommonFailure({required this.error}) : super([error]);

  @override
  String toString() => "CommonFailure{error: $error}";

  @override
  List<Object?> get props => [];
}

class CommonSuccessful extends CommonState {
  final String successMsg;
  final PsychoModel data;

  CommonSuccessful({required this.successMsg, required this.data}) : super([successMsg, data]);

  @override
  String toString() => "CommonSuccess{msg: $successMsg}";

  @override
  List<Object?> get props => [];
}
