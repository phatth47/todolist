import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/modules/profile/presentation/bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  final String title;

  const ProfileScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = ProfileBloc();
    _profileBloc.add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => _profileBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Control Your Devices"),
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          bloc: _profileBloc,
          listener: (context, state) {
            if (state is DataState) {
              final data = state.data;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Data is $data"),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is DataState) {
              final data = state.data;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$data',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _profileBloc.add(RemoveEvent());
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      IconButton(
                        onPressed: () {
                          _profileBloc.add(AddEvent());
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget get humidityWidget {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Humidity Room"),
        const SizedBox(height: 20),
        Container(
          height: 100,
          width: 100,
          color: Colors.redAccent,
          child: const Center(
            child: Text(
              "Humidity Clock",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget get tempuratureWidget {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Tempurature Room"),
        const SizedBox(height: 20),
        Container(
          height: 100,
          width: 100,
          color: Colors.greenAccent,
          child: const Center(
            child: Text(
              "Tempurature Clock",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
