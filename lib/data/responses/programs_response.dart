

class ProgramsResponse {
  int? id;
  int? date;
  int? dateGmt;
  int? modified;
  int? modifiedGmt;
  String? slug;
  String? status;
  String? link;
  String? title;
  String? content;
  String? excerpt;
  int? author;
  int? menuOrder;
  String? format;
  String? programInfoDescription;
  List<TimeProgramm>? timeProgramm;
  String? programTextTime;
  Image? image;
  String? humanDate;
  String? sinceDate;
  Categories? categories;
//  Featured featured;

  ProgramsResponse({this.id, this.date, this.dateGmt, this.modified, this.modifiedGmt, this.slug, this.status, this.link, this.title, this.content, this.excerpt, this.author, this.menuOrder, this.format, this.programInfoDescription, this.timeProgramm, this.programTextTime, this.image, this.humanDate, this.sinceDate, this.categories});

  ProgramsResponse.fromJson(Map<String, dynamic> json) {
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
//    if (json['time_programm'] != null) {
//      // ignore: deprecated_member_use
//      timeProgramm = new List<TimeProgramm>();
//      json['time_programm'].forEach((v) { timeProgramm.add(new TimeProgramm.fromJson(v)); });
//    }
    programTextTime = json['program_text_time'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    humanDate = json['human_date'];
    sinceDate = json['since_date'];
    categories = json['categories'] != null ? new Categories.fromJson(json['categories']) : null;
//    featured = json['featured'] != null ? new Featured.fromJson(json['featured']) : null;
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
    data['time_programm'] = this.timeProgramm?.map((v) => v.toJson()).toList();
      data['program_text_time'] = this.programTextTime;
    data['image'] = this.image?.toJson();
      data['human_date'] = this.humanDate;
    data['since_date'] = this.sinceDate;
//    if (this.categories != null) {
//      data['categories'] = this.categories.toJson();
//    }
//    if (this.featured != null) {
//      data['featured'] = this.featured.toJson();
//    }
    return data;
  }
}

class TimeProgramm {
  String? timeFrom;
  String? timeTo;
  String? daysOfTheWeek;

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
  String? original;
  String? large;
  String? medium;
  String? thumbnail;

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

class Categories {
  Category? category;

  Categories({this.category});

  Categories.fromJson(Map<String, dynamic> json) {
//    category = json['categories'] != null ? new 121.fromJson(json['121']) : null;
    json.keys.forEach((key){
      category = new Category(name: json[key]['name'],programs: json[key]['programs']);
    });

  }

}

class Category {
String? name;
String? programs;

Category({this.name, this.programs});

Category.fromJson(Map<String, dynamic> json) {
name = json['name'];
programs = json['programs'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['name'] = this.name;
data['programs'] = this.programs;
return data;
}
}

//class Featured {
//
//
//Featured({});
//
//Featured.fromJson(Map<String, dynamic> json) {
//}
//
//Map<String, dynamic> toJson() {
//final Map<String, dynamic> data = new Map<String, dynamic>();
//return data;
//}
//}
