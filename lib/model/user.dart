class users {
  final String? uid;

  users({this.uid});
}

class userData {
  final String? uid;
  final String title;
  final String task;
  final String time;

  userData(
      {this.uid, required this.title, required this.task, required this.time});
}
