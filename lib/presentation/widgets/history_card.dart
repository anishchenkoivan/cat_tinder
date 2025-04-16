import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_tinder/presentation/bloc/history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/like_model.dart';
import 'button.dart';

class HistoryCard extends StatelessWidget {
  final LikeModel data;

  const HistoryCard(this.data, {super.key});

  String _formatDateTime(DateTime dt) {
    return '${dt.day.toString().padLeft(2, '0')}.'
        '${dt.month.toString().padLeft(2, '0')}.'
        '${dt.year} '
        '${dt.hour.toString().padLeft(2, '0')}:'
        '${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child:
        Row(
          children:
            [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                child: CachedNetworkImage(
                  imageUrl: data.cat.imageUrl,
                  width: 68,
                  height: 68,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.cat.breedName,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            // fontWeight: FontWeight.bold),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        _formatDateTime(data.dateTime),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
              ),
              BlocBuilder<HistoryBloc, HistoryState>(
                builder: (context, state) {
                  return Button(
                    icon: Icons.delete,
                    action: () {
                      context.read<HistoryBloc>().add(CardDeleted(data.id));
                    },
                  );
                }
              ),
            ]
        ),
    );
  }

}