import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Control Your Devices"),
      ),
      body: DefaultTabController(
        length: 2,
        child: TabBarView(
          children: [
            humidityWidget,
            tempuratureWidget,
          ],
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
