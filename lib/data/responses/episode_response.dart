class EpisodeResponse {
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
  List<int> chooseProgram;
  String episodeDescription;
  String time;
  String audio;
  String video;
  Image image;
  String humanDate;
  String sinceDate;

  EpisodeResponse(
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
        this.chooseProgram,
        this.episodeDescription,
        this.time,
        this.audio,
        this.video,
        this.image,
        this.humanDate,
        this.sinceDate});

  EpisodeResponse.fromJson(Map<String, dynamic> json) {
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
    chooseProgram = json['choose_program'].cast<int>();
    episodeDescription = json['episode_description'];
    time = json['time'];
    audio = json['audio'];
    video = json['video'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    humanDate = json['human_date'];
    sinceDate = json['since_date'];
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
    data['choose_program'] = this.chooseProgram;
    data['episode_description'] = this.episodeDescription;
    data['time'] = this.time;
    data['audio'] = this.audio;
    data['video'] = this.video;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['human_date'] = this.humanDate;
    data['since_date'] = this.sinceDate;
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
