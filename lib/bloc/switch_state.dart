import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isValue;

  final double sliderValue;
  const SwitchState({this.isValue = false, this.sliderValue = .1});

  SwitchState copyWith({bool? isValue, double? sliderValue}) {
    return SwitchState(
      isValue: isValue ?? this.isValue,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  List<Object?> get props => [isValue,sliderValue];
}
