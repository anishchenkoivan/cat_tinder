import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/models/cat_model.dart';
import '../bloc/history_bloc.dart';
import '../bloc/like_bloc.dart';
import '../widgets/button.dart';
import 'history_screen.dart';
import 'info_screen.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  void _catInfo(BuildContext context, CatModel cat) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoScreen(cat: cat)),
    );
  }

  void _history(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder:
          (context) => BlocProvider(
            create: (_) => GetIt.instance<HistoryBloc>(),
              child: const HistoryScreen()
          ),
      ),
    );
  }

  void _like(BuildContext context, state) async {
    context.read<LikeBloc>().add(LikePressed(await state.cat));
  }

  void _likeWithCat(BuildContext context, CatModel cat) {
    context.read<LikeBloc>().add(LikePressed(cat));
  }

  void _dislike(BuildContext context) {
    context.read<LikeBloc>().add(DislikePressed());
  }

  Widget _buildPlaceholderContainer({Widget? child}) {
    return Container(
      height: 552,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: child ?? const CircularProgressIndicator(),
    );
  }

  Widget _buildCatContainer(BuildContext context, CatModel cat) {
    return GestureDetector(
      onTap: () => _catInfo(context, cat),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            // _like(context);
            _likeWithCat(context, cat);
          } else if (direction == DismissDirection.endToStart) {
            _dislike(context);
          }
        },
        background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        secondaryBackground: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12.0)),
                child: CachedNetworkImage(
                  imageUrl: cat.imageUrl,
                  height: 500,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, error, stackTrace) =>
                      const Icon(Icons.image_not_supported, size: 100),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  cat.breedName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Stack(
                children: [
                  _buildPlaceholderContainer(),
                  BlocBuilder<LikeBloc, MainState>(builder: (context, state) {
                    return FutureBuilder<CatModel>(
                      future: state.cat,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return _buildPlaceholderContainer();
                        } else if (snapshot.hasError) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content: Text('Failed to load cat: ${snapshot.error}'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          });
                          return _buildPlaceholderContainer(
                              child: const Text('An error occurred while loading cat data.'));
                        } else if (!snapshot.hasData) {
                          return _buildPlaceholderContainer(
                              child: const Text('No cat data available'));
                        }

                        CatModel cat = snapshot.data!;
                        return _buildCatContainer(context, cat);
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: BlocBuilder<LikeBloc, MainState>(builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                      icon: Icons.arrow_circle_left_outlined,
                      action: () => _dislike(context)),
                  GestureDetector(
                    onTap: () {
                      _history(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'You liked ${state.counter} ${state.counter != 1 ? 'cats' : 'cat'}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ),
                  Button(
                    icon: Icons.favorite,
                    action: () => _like(context, state),
                  )
                ],
              );
            }),
          ),
          const SizedBox(height: kBottomNavigationBarHeight),
        ],
      ),
    );
  }
}
