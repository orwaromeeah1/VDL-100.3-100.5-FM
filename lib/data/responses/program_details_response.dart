class ProgramDetailsResponse {
  int id;
  int date;
  int dateGmt;
  int modified;
  int modifiedGmt;
  String slug;
  String status;
  String link;
  String title;
  String content;
  String excerpt;
  int author;
  int menuOrder;
  String format;
  String programInfoDescription;
  List<TimeProgramm> timeProgramm;
  String programTextTime;
  Image image;
  String humanDate;
  String sinceDate;
  List<Episodes> episodes;

  ProgramDetailsResponse(
      {this.id,
        this.date,
        this.dateGmt,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.link,
        this.title,
        this.content,
        this.excerpt,
        this.author,
        this.menuOrder,
        this.format,
        this.programInfoDescription,
        this.timeProgramm,
        this.programTextTime,
        this.image,
        this.humanDate,
        this.sinceDate,
        this.episodes});

  ProgramDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    link = json['link'];
    title = json['title'];
    content = json['content'];
    excerpt = json['excerpt'];
    author = json['author'];
    menuOrder = json['menu_order'];
    format = json['format'];
    programInfoDescription = json['program_info_description'];
    if (json['time_programm'] != null) {
      timeProgramm = new List<TimeProgramm>();
      json['time_programm'].forEach((v) {
        timeProgramm.add(new TimeProgramm.fromJson(v));
      });
    }
    programTextTime = json['program_text_time'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    humanDate = json['human_date'];
    sinceDate = json['since_date'];
    if (json['episodes'] != null) {
      episodes = new List<Episodes>();
      json['episodes'].forEach((v) {
        episodes.add(new Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    data['modified'] = this.modified;
    data['modified_gmt'] = this.modifiedGmt;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['link'] = this.link;
    data['title'] = this.title;
    data['content'] = this.content;
    data['excerpt'] = this.excerpt;
    data['author'] = this.author;
    data['menu_order'] = this.menuOrder;
    data['format'] = this.format;
    data['program_info_description'] = this.programInfoDescription;
    if (this.timeProgramm != null) {
      data['time_programm'] = this.timeProgramm.map((v) => v.toJson()).toList();
    }
    data['program_text_time'] = this.programTextTime;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['human_date'] = this.humanDate;
    data['since_date'] = this.sinceDate;
    if (this.episodes != null) {
      data['episodes'] = this.episodes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeProgramm {
  String timeFrom;
  String timeTo;
  String daysOfTheWeek;

  TimeProgramm({this.timeFrom, this.timeTo, this.daysOfTheWeek});

  TimeProgramm.fromJson(Map<String, dynamic> json) {
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    daysOfTheWeek = json['days_of_the_week'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time_from'] = this.timeFrom;
    data['time_to'] = this.timeTo;
    data['days_of_the_week'] = this.daysOfTheWeek;
    return data;
  }
}

class Image {
  String original;
  String large;
  String medium;
  String thumbnail;

  Image({this.original, this.large, this.medium, this.thumbnail});

  Image.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Episodes {
  int id;
  String link;
  int author;
  int date;
  int dateGmt;
  String content;
  String title;
  String excerpt;
  String status;
  String name;
  int modified;
  int modifiedGmt;
  String humanDate;
  String sinceDate;
  Image image;

  Episodes(
      {this.id,
        this.link,
        this.author,
        this.date,
        this.dateGmt,
        this.content,
        this.title,
        this.excerpt,
        this.status,
        this.name,
        this.modified,
        this.modifiedGmt,
        this.humanDate,
        this.sinceDate,
        this.image});

  Episodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    author = json['author'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    content = json['content'];
    title = json['title'];
    excerpt = json['excerpt'];
    status = json['status'];
    name = json['name'];
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    humanDate = json['human_date'];
    sinceDate = json['since_date'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['link'] = this.link;
    data['author'] = this.author;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    data['content'] = this.content;
    data['title'] = this.title;
    data['excerpt'] = this.excerpt;
    data['status'] = this.status;
    data['name'] = this.name;
    data['modified'] = this.modified;
    data['modified_gmt'] = this.modifiedGmt;
    data['human_date'] = this.humanDate;
    data['since_date'] = this.sinceDate;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    return data;
  }
}
