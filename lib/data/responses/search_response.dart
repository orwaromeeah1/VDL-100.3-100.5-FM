class SearchResponse {
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
//  Tags tags;
  String sliderDescriptionText;
  String audiowatFile;
  String audiowatEmbedIframe;
  Image image;
//  Categories categories;
//  Exclusive exclusive;
  String humanDate;
  String sinceDate;
  String source;
  String time;
  String audioTitle;
  String audio;
  String video;
//  Null vimeo;
  String youtube;

  SearchResponse({this.id, this.date, this.dateGmt, this.modified, this.modifiedGmt, this.slug, this.status, this.link, this.title, this.content, this.excerpt, this.author, this.menuOrder, this.format,
//    this.tags,
    this.sliderDescriptionText, this.audiowatFile, this.audiowatEmbedIframe, this.image,
//    this.categories, this.exclusive,
    this.humanDate, this.sinceDate, this.source, this.time, this.audioTitle, this.audio, this.video,
//    this.vimeo,
    this.youtube});

  SearchResponse.fromJson(Map<String, dynamic> json) {
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
//    tags = json['tags'] != null ? new Tags.fromJson(json['tags']) : null;
    sliderDescriptionText = json['slider_description_text'];
    audiowatFile = json['audiowat_file'];
    audiowatEmbedIframe = json['audiowat_embed_iframe'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
//    categories = json['categories'] != null ? new Categories.fromJson(json['categories']) : null;
//    exclusive = json['exclusive'] != null ? new Exclusive.fromJson(json['exclusive']) : null;
    humanDate = json['human_date'];
    sinceDate = json['since_date'];
    source = json['source'];
    time = json['time'];
    audioTitle = json['audio_title'];
    audio = json['audio'];
    video = json['video'];
//    vimeo = json['vimeo'];
    youtube = json['youtube'];
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
//    if (this.tags != null) {
//      data['tags'] = this.tags.toJson();
//    }
    data['slider_description_text'] = this.sliderDescriptionText;
    data['audiowat_file'] = this.audiowatFile;
    data['audiowat_embed_iframe'] = this.audiowatEmbedIframe;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
//    if (this.categories != null) {
//      data['categories'] = this.categories.toJson();
//    }
//    if (this.exclusive != null) {
//      data['exclusive'] = this.exclusive.toJson();
//    }
    data['human_date'] = this.humanDate;
    data['since_date'] = this.sinceDate;
    data['source'] = this.source;
    data['time'] = this.time;
    data['audio_title'] = this.audioTitle;
    data['audio'] = this.audio;
    data['video'] = this.video;
//    data['vimeo'] = this.vimeo;
    data['youtube'] = this.youtube;
    return data;
  }
}
//
//class Tags {
//  50 550;
//  50 552;
//  50 566;
//  50 5108;
//  50 5628;
//  50 53141;
//  50 57456;
//
//  Tags({this.550, this.552, this.566, this.5108, this.5628, this.53141, this.57456});
//
//  Tags.fromJson(Map<String, dynamic> json) {
//  550 = json['50'] != null ? new 50.fromJson(json['50']) : null;
//  552 = json['52'] != null ? new 50.fromJson(json['52']) : null;
//  566 = json['66'] != null ? new 50.fromJson(json['66']) : null;
//  5108 = json['108'] != null ? new 50.fromJson(json['108']) : null;
//  5628 = json['628'] != null ? new 50.fromJson(json['628']) : null;
//  53141 = json['3141'] != null ? new 50.fromJson(json['3141']) : null;
//  57456 = json['7456'] != null ? new 50.fromJson(json['7456']) : null;
//  }
//
//  Map<String, dynamic> toJson() {
//  final Map<String, dynamic> data = new Map<String, dynamic>();
//  if (this.550 != null) {
//  data['50'] = this.550.toJson();
//  }
//  if (this.552 != null) {
//  data['52'] = this.552.toJson();
//  }
//  if (this.566 != null) {
//  data['66'] = this.566.toJson();
//  }
//  if (this.5108 != null) {
//  data['108'] = this.5108.toJson();
//  }
//  if (this.5628 != null) {
//  data['628'] = this.5628.toJson();
//  }
//  if (this.53141 != null) {
//  data['3141'] = this.53141.toJson();
//  }
//  if (this.57456 != null) {
//  data['7456'] = this.57456.toJson();
//  }
//  return data;
//  }
//}
//
//class 50 {
//String name;
//String news;
//
//50({this.name, this.news});
//
//50.fromJson(Map<String, dynamic> json) {
//name = json['name'];
//news = json['news'];
//}

//Map<String, dynamic> toJson() {
//final Map<String, dynamic> data = new Map<String, dynamic>();
//data['name'] = this.name;
//data['news'] = this.news;
//return data;
//}
//}

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

//class Categories {
//50 562;
//
//Categories({this.562});
//
//Categories.fromJson(Map<String, dynamic> json) {
//562 = json['62'] != null ? new 50.fromJson(json['62']) : null;
//}
//
//Map<String, dynamic> toJson() {
//final Map<String, dynamic> data = new Map<String, dynamic>();
//if (this.562 != null) {
//data['62'] = this.562.toJson();
//}
//return data;
//}
//}
//
//class Exclusive {
//50 511;
//
//Exclusive({this.511});
//
//Exclusive.fromJson(Map<String, dynamic> json) {
//511 = json['11'] != null ? new 50.fromJson(json['11']) : null;
//}
//
//Map<String, dynamic> toJson() {
//final Map<String, dynamic> data = new Map<String, dynamic>();
//if (this.511 != null) {
//data['11'] = this.511.toJson();
//}
//return data;
//}
//}
//
//class Tags {
//50 550;
//50 552;
//50 566;
//50 5108;
//50 5628;
//50 53141;
//50 57456;
//
//Tags({this.550, this.552, this.566, this.5108, this.5628, this.53141, this.57456});
//
//Tags.fromJson(Map<String, dynamic> json) {
//550 = json['50'] != null ? new 50.fromJson(json['50']) : null;
//552 = json['52'] != null ? new 50.fromJson(json['52']) : null;
//566 = json['66'] != null ? new 50.fromJson(json['66']) : null;
//5108 = json['108'] != null ? new 50.fromJson(json['108']) : null;
//5628 = json['628'] != null ? new 50.fromJson(json['628']) : null;
//53141 = json['3141'] != null ? new 50.fromJson(json['3141']) : null;
//57456 = json['7456'] != null ? new 50.fromJson(json['7456']) : null;
//}
//
//Map<String, dynamic> toJson() {
//final Map<String, dynamic> data = new Map<String, dynamic>();
//if (this.550 != null) {
//data['50'] = this.550.toJson();
//}
//if (this.552 != null) {
//data['52'] = this.552.toJson();
//}
//if (this.566 != null) {
//data['66'] = this.566.toJson();
//}
//if (this.5108 != null) {
//data['108'] = this.5108.toJson();
//}
//if (this.5628 != null) {
//data['628'] = this.5628.toJson();
//}
//if (this.53141 != null) {
//data['3141'] = this.53141.toJson();
//}
//if (this.57456 != null) {
//data['7456'] = this.57456.toJson();
//}
//return data;
//}
//}

//class Categories {
//50 562;
//
//Categories({this.562});
//
//Categories.fromJson(Map<String, dynamic> json) {
//562 = json['62'] != null ? new 50.fromJson(json['62']) : null;
//}
//
//Map<String, dynamic> toJson() {
//final Map<String, dynamic> data = new Map<String, dynamic>();
//if (this.562 != null) {
//data['62'] = this.562.toJson();
//}
//return data;
//}
//}

//class Exclusive {
//50 511;
//
//Exclusive({this.511});
//
//Exclusive.fromJson(Map<String, dynamic> json) {
//511 = json['11'] != null ? new 50.fromJson(json['11']) : null;
//}
//
//Map<String, dynamic> toJson() {
//final Map<String, dynamic> data = new Map<String, dynamic>();
//if (this.511 != null) {
//data['11'] = this.511.toJson();
//}
//return data;
//}
//}
