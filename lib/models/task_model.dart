class TaskModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TaskModel({this.userId, this.id, this.title, this.completed});

  TaskModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

}
