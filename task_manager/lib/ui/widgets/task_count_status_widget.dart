import 'package:flutter/material.dart';

class TaskCardStatusWidget extends StatelessWidget {
  const TaskCardStatusWidget({
    super.key,
    required this.title,
    required this.count,
  });
  final String title;
  final String count;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Column(
        children: [
          Text(
            count,
            style: textTheme.titleLarge,
          ),
          Text(
            title,
            style: textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
