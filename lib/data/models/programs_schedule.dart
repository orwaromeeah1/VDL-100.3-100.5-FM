class ProgramSchedule {
  String time;
  String image;
  String title;
  bool active;
  String link;
  int id;

  ProgramSchedule(
      {this.time, this.image, this.title, this.active, this.link, this.id});

  static List<ProgramSchedule> fromJson(Map<String, dynamic> json) {
    List<ProgramSchedule> result = [];
    json.keys.forEach((key) {
      result.add(new ProgramSchedule(
        time: key,
        image: json[key]['image'],
        title: json[key]['title'],
        active: json[key]['active'],
        link: json[key]['link'],
        id: json[key]['id'],
      ));
    });

    return result;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['active'] = this.active;
    data['link'] = this.link;
    data['id'] = this.id;
    return data;
  }
}
