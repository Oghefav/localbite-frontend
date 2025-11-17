class NotificationModel {
   String id;
   String title;
   String description;
   DateTime time;
   bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.isRead,
  });
}
