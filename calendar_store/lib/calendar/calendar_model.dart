class CalendarItem {
  static String table = "events";
  
  int? id;
  String? code;
  String? name;
  String? description;
  String? date;

  CalendarItem({this.id,this.code, this.name, this.description, this.date});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'code': code,
      'name': name,
      'description': description,
      'date': date
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

    static CalendarItem fromMap(Map<String, dynamic> map) {
    return CalendarItem(
        id: map['id'],
        code: map['code'],
        name: map['name'],
        description: map['description'],
        date: map['date']);
  }
}
