import 'package:flutter/material.dart';

import '../../data/models/task_list_model.dart';

class TaskItems extends StatelessWidget {
  const TaskItems({
    super.key,
    required this.taskModel,
    required this.onDeleteTask,
    required this.onUpdateTaskStatus,
  });

  final TaskListModel taskModel;

  final Future<void> Function(String id) onDeleteTask;
  final Future<void> Function(String id, String status)
  onUpdateTaskStatus;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final String statusText = taskModel.status ?? 'New';
    final Color statusColor;

    switch (statusText) {
      case 'New':
        statusColor = Colors.cyan;
        break;
      case 'Progress':
        statusColor = Colors.amber;
        break;
      case 'Completed':
        statusColor = Colors.green;
        break;
      case 'Canceled':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        tileColor: Colors.white,
        title: Text(
          taskModel.title ?? '',
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskModel.description ?? '',
            ),
            Text(
              'Date:${taskModel.createdDate ?? ''}',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    statusText,
                    style: textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                ),
                Row(children: [
                  IconButton(
                    onPressed: () async {
                      final String? newStatus = await _showEditStatusDialog(
                        context,
                        taskModel.status ?? '',
                      );
                      if (newStatus != null && newStatus != taskModel.status) {
                        await onUpdateTaskStatus(
                            taskModel.sId ?? '', newStatus);
                      }
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.cyan,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final bool? confirm = await showDialog<bool>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Delete!'),
                            content: const Text('Do you want to delete?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },
                                child: const Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );

                      if (confirm == true) {
                        await onDeleteTask(taskModel.sId ?? '');
                      }
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String?> _showEditStatusDialog(
      BuildContext context, String currentStatus) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        String? selectedStatus = currentStatus;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Update Task Status'),
              content: DropdownButton<String>(
                value: selectedStatus,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'New',
                    child: Text('New'),
                  ),
                  DropdownMenuItem(
                    value: 'Progress',
                    child: Text('Progress'),
                  ),
                  DropdownMenuItem(
                    value: 'Completed',
                    child: Text('Completed'),
                  ),
                  DropdownMenuItem(
                    value: 'Canceled',
                    child: Text('Canceled'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value;
                  });
                },
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, selectedStatus);
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(color: Colors.cyan),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
