//
//
// class TaskItemWidget extends StatefulWidget {
//   const TaskItemWidget({
//     super.key,
//     required this.taskModel,
//   });
//   final TaskListModel taskModel;
//
//   @override
//   State<TaskItemWidget> createState() => _TaskItemWidgetState();
// }
//
// class _TaskItemWidgetState extends State<TaskItemWidget> {
//   bool _deleteTaskItemInProgress = false;
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     //final chipTheme = Theme.of(context).chipTheme;
//     return Card(
//       color: Colors.white,
//       elevation: 0,
//       child: ListTile(
//         title: Text(
//           widget.taskModel.title ?? '',
//           style: textTheme.titleMedium,
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(widget.taskModel.description ?? '',
//                 style: textTheme.titleSmall),
//             Text('Date: ${widget.taskModel.createdDate ?? ''}',
//                 style: textTheme.titleSmall),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Chip(
//                   label: Text(
//                     widget.taskModel.status ?? 'New',
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                   backgroundColor:
//                   _getStatusColor(widget.taskModel.status ?? 'New'),
//                   side: BorderSide.none,
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           _showEditStatusDialog(widget.taskModel.sId.toString());
//                         },
//                         icon: const Icon(
//                           Icons.edit,
//                           color: Colors.cyan,
//                         )),
//                     Visibility(
//                       visible: _deleteTaskItemInProgress == false,
//                       replacement: const CenterCircularProgressIndicator(),
//                       child: IconButton(
//                           onPressed: () {
//                             _onTapDeleteTaskItemButton(
//                                 widget.taskModel.sId.toString());
//                           },
//                           icon: const Icon(
//                             Icons.delete,
//                             color: Colors.red,
//                           )),
//                     ),
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showEditStatusDialog(String id) {
//     showDialog(context: context, builder: (context){
//       return AlertDialog(
//         title: const Text('Update Task Status'),
//         content: DropdownButton(
//           //value: ,
//           isExpanded: true,
//           items: const [
//             DropdownMenuItem(
//               value: 'New',
//               child: Text('New'),
//             ),
//             DropdownMenuItem(
//               value: 'Progress',
//               child: Text('Progress'),
//             ),
//             DropdownMenuItem(
//               value: 'Completed',
//               child: Text('Completed'),
//             ),
//             DropdownMenuItem(
//               value: 'Cancelled',
//               child: Text('Cancelled'),
//             ),
//           ], onChanged: (value){},
//         ),
//         actions: [
//           OutlinedButton(onPressed: (){Navigator.pop(context);}, child: const Text('Update')),
//           const SizedBox(width: 8,),
//           OutlinedButton(onPressed: (){Navigator.pop(context);}, child: const Text('Cancel')),
//         ],
//       );
//     });
//   }
//
//
//   void _onTapDeleteTaskItemButton(String id) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: const Text('Delete Task Item!'),
//             content: const Text('Do you want to delete?'),
//             actions: [
//               OutlinedButton(
//                   onPressed: () {
//                     _deleteTaskItem(id);
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Yes')),
//               const SizedBox(width: 20,),
//               OutlinedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('No')),
//             ],
//           );
//         });
//   }
//
//   Future<void> _deleteTaskItem(String id) async {
//     _deleteTaskItemInProgress = true;
//     setState(() {});
//     final NetworkResponse response =
//     await NetworkCaller.getRequest(url: Urls.deleteTaskItemUrl(id));
//     _deleteTaskItemInProgress = false;
//     setState(() {});
//     if (response.isSuccess) {
//       showSnackBarMessage(context, 'delete successful');
//     } else {
//       showSnackBarMessage(context, response.errorMessage);
//     }
//   }
//
//   Color _getStatusColor(String status) {
//     if (status == 'New') {
//       return Colors.cyan;
//     } else if (status == 'Progress') {
//       return Colors.purple;
//     } else if (status == 'Completed') {
//       return Colors.green;
//     } else {
//       return Colors.red;
//     }
//   }
// }
