import 'package:cat_tinder/presentation/utils/history_builder.dart';
import 'package:cat_tinder/presentation/widgets/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/history_bloc.dart';
import '../widgets/button.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  HistoryScreenState createState() => HistoryScreenState();

}

class HistoryScreenState extends State<HistoryScreen> {

  final HistoryBuilder cardsProvider = GetIt.instance<HistoryBuilder>();
  bool filterVisible = false;

  HistoryScreenState();

  _toggleFilterVisible() {
    setState(() {
      filterVisible = !filterVisible;
    });
  }

  List<HistoryCard> _getFilteredCards(HistoryState state) {
    return cardsProvider.getHistoryCards().where((HistoryCard card) => state.filter[card.data.cat.breedName]!).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("You liked those cats"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<HistoryBloc, HistoryState>(builder: (context, state) {
                return Column(
                  children: _getFilteredCards(state),
                );
              }),
            ),
          ),
          if (filterVisible)
            FilterWindow(),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 16,
            left: 16,
            child: Button(
                icon: Icons.sort,
                action: _toggleFilterVisible
            ),
          ),
        ],
      ),
    );
  }
}