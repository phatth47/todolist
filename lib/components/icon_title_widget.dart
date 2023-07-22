import 'package:flutter/material.dart';

class IconTitleWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onPressed;
  final Color? color;

  const IconTitleWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ListTile(
        onTap: onPressed,
        leading: Icon(
          icon,
          color: _color,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: _color,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Color get _color => color ?? Colors.black;
}
