import 'package:flutter/material.dart';

class InforItemModel {
  final String? title;
  final String? value;

  const InforItemModel({
    required this.title,
    required this.value,
  });
}

class InfoItemWidget extends StatelessWidget {
  final InforItemModel model;

  const InfoItemWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final title = model.title ?? "";
    final value = model.value ?? "";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            ": $value",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
