import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_bloc/bloc/switch_bloc.dart';
import 'package:flutter_multi_bloc/bloc/switch_event.dart';
import 'package:flutter_multi_bloc/bloc/switch_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiBloc Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),

          /// Switch
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) =>
                previous.isValue != current.isValue,
            builder: (context, state) {
              return Switch(
                value: state.isValue,
                onChanged: (newValue) {
                  context.read<SwitchBloc>().add(EnableOrDisableSwitch());
                },
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),

          /// Red Color Container
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) =>
                previous.sliderValue != current.sliderValue,
            builder: (context, state) {
              return Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(state.sliderValue),
                ),
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),

          /// Slider
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) =>
                previous.sliderValue != current.sliderValue,
            builder: (context, state) {
              return Slider(
                  value: state.sliderValue,
                  onChanged: (value) {
                    context
                        .read<SwitchBloc>()
                        .add(SliderEvent(sliderValue: value));
                  });
            },
          )
        ],
      ),
    );
  }
}
