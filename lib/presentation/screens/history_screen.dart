import 'package:cat_tinder/presentation/utils/history_builder.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../widgets/button.dart';

class HistoryScreen extends StatelessWidget {

  final HistoryBuilder cardsProvider = GetIt.instance<HistoryBuilder>();

  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("You liked those cats"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: cardsProvider.getHistoryCards(),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 16,
            left: 16,
            child: Button(
                icon: Icons.sort,
                action: () => {}
            ),
          ),
        ],
      ),
    );
  }
}