
import 'package:task_manager/data/models/task_count_model.dart';

class TaskCountByStatusModel {
  String? status;
  List<TaskCountModel>? taskCountByStatusList;

  TaskCountByStatusModel({this.status, this.taskCountByStatusList});

  TaskCountByStatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskCountByStatusList = <TaskCountModel>[];
      json['data'].forEach((v) {
        taskCountByStatusList!.add(TaskCountModel.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.taskCountByStatusList != null) {
      data['data'] = this.taskCountByStatusList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
