import 'package:cat_tinder/services/cat_fetch_service.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/cat.dart';
import '../widgets/button.dart';
import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  late Future<Cat> _cat;

  @override
  void initState() {
    super.initState();
    _updateCat();
  }

  void _like() {
    setState(() {
      _counter++;
    });
    _updateCat();
  }

  void _dislike() {
    _updateCat();
  }

  void _catInfo(Cat cat) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoScreen(cat: cat)),
    );
  }

  void _updateCat() {
    setState(() {
      _cat = CatFetchService().getCat();
    });
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

  Widget _buildCatContainer(BuildContext context, Cat cat) {
    return GestureDetector(
      onTap: () => _catInfo(cat),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            _like();
          } else if (direction == DismissDirection.endToStart) {
            _dislike();
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
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 48),
            child: FutureBuilder<Cat>(
              future: _cat,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return _buildPlaceholderContainer();
                } else if (snapshot.hasError) {
                  return _buildPlaceholderContainer(
                      child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData) {
                  return _buildPlaceholderContainer(
                      child: const Text('No cat data available'));
                }

                Cat cat = snapshot.data!;

                return _buildCatContainer(context, cat);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                    icon: Icons.arrow_circle_left_outlined, action: _dislike),
                Text(
                  'You liked $_counter ${_counter != 1 ? 'cats' : 'cat'}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Button(
                  icon: Icons.favorite,
                  action: _like,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
