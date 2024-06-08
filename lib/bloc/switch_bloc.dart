import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_bloc/bloc/switch_event.dart';
import 'package:flutter_multi_bloc/bloc/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwitchState>{
  SwitchBloc(): super(const SwitchState()){
    on<EnableOrDisableSwitch>(_enableOrDisableSwitch);
    on<SliderEvent>(_performSliderOperation);
  }
  void _enableOrDisableSwitch(EnableOrDisableSwitch event , Emitter<SwitchState> emit){
    emit(state.copyWith(isValue: !state.isValue));
  }
  void _performSliderOperation(SliderEvent event, Emitter<SwitchState> emit){
    emit(state.copyWith(sliderValue: event.sliderValue.toDouble()));
  }
}
