import 'package:cat_tinder/presentation/bloc/history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterItem extends StatelessWidget {
  final String breedName;
  const FilterItem({super.key, required this.breedName});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        return CheckboxListTile(
          title: Text(breedName),
          value: state.filter[breedName],
          onChanged: (bool? value) {
            Map<String, bool> curFilter = Map.of(state.filter);
            curFilter[breedName] = value!;
            context.read<HistoryBloc>().add(CardFiltered(curFilter));
          },
        );
      },
    );
  }
}
