import 'package:animelist/features/home/presentation/blocs/anime_list_bloc.dart';
import 'package:animelist/features/home/presentation/widgets/anime_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Animelist'),
      ),
      body: BlocProvider(
        create: (context) => AnimeListBloc(),
        child: const AnimeListView(),
      ),
    );
  }
}
