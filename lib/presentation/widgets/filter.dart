import 'package:cat_tinder/presentation/bloc/history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../utils/filter_builder.dart';

class FilterWindow extends StatelessWidget {
  final FilterBuilder filterBuilder = GetIt.instance<FilterBuilder>();
  FilterWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment(0, -0.5),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: SingleChildScrollView(
            child: BlocBuilder<HistoryBloc, HistoryState>(
              builder: (context, state) {
                return Column(
                  children: filterBuilder.getFilterItems(state.filter),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
