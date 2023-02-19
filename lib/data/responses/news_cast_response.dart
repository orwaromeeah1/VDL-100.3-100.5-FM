class NewsCastResponse {
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
  String releaseDate;
  String audioTimeBlock715;
  String shortAudioTitleBlock715;
  String shortAudioFieldBlock715;
  String shortAudioDescriptionBlock715;
  String audioTitleBlock715;
  String audioFieldBlock715;
  String audioDescriptionBlock715;
  String audioTimeBlock815;
  String shortAudioTitleBlock815;
  String shortAudioFieldBlock815;
  String shortAudioDescriptionBlock815;
  String audioTitleBlock815;
  String audioFieldBlock815;
  String audioDescriptionBlock815;
  String audioTimeBlock1415;
  String shortAudioTitleBlock1415;
  String shortAudioFieldBlock1415;
  String shortAudioDescriptionBlock1415;
  String audioTitleBlock1415;
  String audioFieldBlock1415;
  String audioDescriptionBlock1415;
  String audioTimeBlock1715;
  String shortAudioTitleBlock1715;
  String shortAudioFieldBlock1715;
  String shortAudioDescriptionBlock1715;
  String audioTitleBlock1715;
  String audioFieldBlock1715;
  String audioDescriptionBlock1715;
  String audioTimeBlock1915;
  String shortAudioTitleBlock1915;
  String shortAudioFieldBlock1915;
  String shortAudioDescriptionBlock1915;
  String audioTitleBlock1915;
  String audioFieldBlock1915;
  String audioDescriptionBlock1915;
  String videoYoutubeKeyBlock715;
  String videoKwikMotionKeyBlock715;
  String videoYoutubeKeyBlock815;
  String videoKwikMotionKeyBlock815;
  String videoYoutubeKeyBlock1015;
  String videoKwikMotionKeyBlock1015;
  String videoYoutubeKeyBlock1415;
  String videoKwikMotionKeyBlock1415;
  String videoYoutubeKeyBlock1715;
  String videoKwikMotionKeyBlock1715;
  String videoYoutubeKeyBlock1915;
  String videoKwikMotionKeyBlock1915;
  String audioTimeBlock1015;
  String shortAudioTitleBlock1015;
  String shortAudioFieldBlock1015;
  String shortAudioDescriptionBlock1015;
  String audioTitleBlock1015;
  String audioFieldBlock1015;
  String audioDescriptionBlock1015;

//  Image image;
  String humanDate;
  String sinceDate;
  List<String> timeSlots;
  bool isOpened;

  NewsCastResponse(
      {this.isOpened,
      this.id,
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
      this.releaseDate,
      this.audioTimeBlock715,
      this.shortAudioTitleBlock715,
      this.shortAudioFieldBlock715,
      this.shortAudioDescriptionBlock715,
      this.audioTitleBlock715,
      this.audioFieldBlock715,
      this.audioDescriptionBlock715,
      this.audioTimeBlock815,
      this.shortAudioTitleBlock815,
      this.shortAudioFieldBlock815,
      this.shortAudioDescriptionBlock815,
      this.audioTitleBlock815,
      this.audioFieldBlock815,
      this.audioDescriptionBlock815,
      this.audioTimeBlock1415,
      this.shortAudioTitleBlock1415,
      this.shortAudioFieldBlock1415,
      this.shortAudioDescriptionBlock1415,
      this.audioTitleBlock1415,
      this.audioFieldBlock1415,
      this.audioDescriptionBlock1415,
      this.audioTimeBlock1715,
      this.shortAudioTitleBlock1715,
      this.shortAudioFieldBlock1715,
      this.shortAudioDescriptionBlock1715,
      this.audioTitleBlock1715,
      this.audioFieldBlock1715,
      this.audioDescriptionBlock1715,
      this.audioTimeBlock1915,
      this.shortAudioTitleBlock1915,
      this.shortAudioFieldBlock1915,
      this.shortAudioDescriptionBlock1915,
      this.audioTitleBlock1915,
      this.audioFieldBlock1915,
      this.audioDescriptionBlock1915,
      this.videoYoutubeKeyBlock715,
      this.videoKwikMotionKeyBlock715,
      this.videoYoutubeKeyBlock815,
      this.videoKwikMotionKeyBlock815,
      this.videoYoutubeKeyBlock1015,
      this.videoKwikMotionKeyBlock1015,
      this.videoYoutubeKeyBlock1415,
      this.videoKwikMotionKeyBlock1415,
      this.videoYoutubeKeyBlock1715,
      this.videoKwikMotionKeyBlock1715,
      this.videoYoutubeKeyBlock1915,
      this.videoKwikMotionKeyBlock1915,
      this.audioDescriptionBlock1015,
      this.audioFieldBlock1015,
      this.audioTimeBlock1015,
      this.audioTitleBlock1015,
      this.shortAudioDescriptionBlock1015,
      this.shortAudioFieldBlock1015,
      this.shortAudioTitleBlock1015,
//    this.image,
      this.humanDate,
      this.sinceDate,
      this.timeSlots});

  NewsCastResponse.fromJson(Map<String, dynamic> json) {
    isOpened = false;
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
    releaseDate = json['release_date'];
    audioTimeBlock715 = json['audio_time_block_7_15'];
    shortAudioTitleBlock715 = json['short_audio_title_block_7_15'];
    shortAudioFieldBlock715 = json['short_audio_field_block_7_15'];
    shortAudioDescriptionBlock715 = json['short_audio_description_block_7_15'];
    audioTitleBlock715 = json['audio_title_block_7_15'];
    audioFieldBlock715 = json['audio_field_block_7_15'];
    audioDescriptionBlock715 = json['audio_description_block_7_15'];
    audioTimeBlock815 = json['audio_time_block_8_15'];
    shortAudioTitleBlock815 = json['short_audio_title_block_8_15'];
    shortAudioFieldBlock815 = json['short_audio_field_block_8_15'];
    shortAudioDescriptionBlock815 = json['short_audio_description_block_8_15'];
    audioTitleBlock815 = json['audio_title_block_8_15'];
    audioFieldBlock815 = json['audio_field_block_8_15'];
    audioDescriptionBlock815 = json['audio_description_block_8_15'];
    audioTimeBlock1415 = json['audio_time_block_14_15'];
    shortAudioTitleBlock1415 = json['short_audio_title_block_14_15'];
    shortAudioFieldBlock1415 = json['short_audio_field_block_14_15'];
    shortAudioDescriptionBlock1415 =
        json['short_audio_description_block_14_15'];
    audioTitleBlock1415 = json['audio_title_block_14_15'];
    audioFieldBlock1415 = json['audio_field_block_14_15'];
    audioDescriptionBlock1415 = json['audio_description_block_14_15'];
    audioTimeBlock1715 = json['audio_time_block_17_15'];
    shortAudioTitleBlock1715 = json['short_audio_title_block_17_15'];
    shortAudioFieldBlock1715 = json['short_audio_field_block_17_15'];
    shortAudioDescriptionBlock1715 =
        json['short_audio_description_block_17_15'];
    audioTitleBlock1715 = json['audio_title_block_17_15'];
    audioFieldBlock1715 = json['audio_field_block_17_15'];
    audioDescriptionBlock1715 = json['audio_description_block_17_15'];
    audioTimeBlock1915 = json['audio_time_block_19_15'];
    shortAudioTitleBlock1915 = json['short_audio_title_block_19_15'];
    shortAudioFieldBlock1915 = json['short_audio_field_block_19_15'];
    shortAudioDescriptionBlock1915 =
        json['short_audio_description_block_19_15'];
    audioTitleBlock1915 = json['audio_title_block_19_15'];
    audioFieldBlock1915 = json['audio_field_block_19_15'];
    audioDescriptionBlock1915 = json['audio_description_block_19_15'];
    videoYoutubeKeyBlock715 = json["video_youtube_key_block_7_15"];
    videoKwikMotionKeyBlock715 = json["video_kwikMotion_key_block_7_15"];
    videoYoutubeKeyBlock815 = json["video_youtube_key_block_8_15"];
    videoKwikMotionKeyBlock815 = json["video_kwikMotion_key_block_8_15"];
    videoYoutubeKeyBlock1015 = json["video_youtube_key_block_10_15"];
    videoKwikMotionKeyBlock1015 = json["video_kwikMotion_key_block_10_15"];
    videoYoutubeKeyBlock1415 = json["video_youtube_key_block_14_15"];
    videoKwikMotionKeyBlock1415 = json["video_kwikMotion_key_block_14_15"];
    videoYoutubeKeyBlock1715 = json["video_youtube_key_block_17_15"];
    videoKwikMotionKeyBlock1715 = json["video_kwikMotion_key_block_17_15"];
    videoYoutubeKeyBlock1915 = json["video_youtube_key_block_19_15"];
    videoKwikMotionKeyBlock1915 = json["video_kwikMotion_key_block_19_15"];

//    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    humanDate = json['human_date'];
    sinceDate = json['since_date'];
    timeSlots = json['time_slots'].cast<String>();
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
    data['release_date'] = this.releaseDate;
    data['audio_time_block_7_15'] = this.audioTimeBlock715;
    data['short_audio_title_block_7_15'] = this.shortAudioTitleBlock715;
    data['short_audio_field_block_7_15'] = this.shortAudioFieldBlock715;
    data['short_audio_description_block_7_15'] =
        this.shortAudioDescriptionBlock715;
    data['audio_title_block_7_15'] = this.audioTitleBlock715;
    data['audio_field_block_7_15'] = this.audioFieldBlock715;
    data['audio_description_block_7_15'] = this.audioDescriptionBlock715;
    data['audio_time_block_8_15'] = this.audioTimeBlock815;
    data['short_audio_title_block_8_15'] = this.shortAudioTitleBlock815;
    data['short_audio_field_block_8_15'] = this.shortAudioFieldBlock815;
    data['short_audio_description_block_8_15'] =
        this.shortAudioDescriptionBlock815;
    data['audio_title_block_8_15'] = this.audioTitleBlock815;
    data['audio_field_block_8_15'] = this.audioFieldBlock815;
    data['audio_description_block_8_15'] = this.audioDescriptionBlock815;
    data['audio_time_block_14_15'] = this.audioTimeBlock1415;
    data['short_audio_title_block_14_15'] = this.shortAudioTitleBlock1415;
    data['short_audio_field_block_14_15'] = this.shortAudioFieldBlock1415;
    data['short_audio_description_block_14_15'] =
        this.shortAudioDescriptionBlock1415;
    data['audio_title_block_14_15'] = this.audioTitleBlock1415;
    data['audio_field_block_14_15'] = this.audioFieldBlock1415;
    data['audio_description_block_14_15'] = this.audioDescriptionBlock1415;
    data['audio_time_block_17_15'] = this.audioTimeBlock1715;
    data['short_audio_title_block_17_15'] = this.shortAudioTitleBlock1715;
    data['short_audio_field_block_17_15'] = this.shortAudioFieldBlock1715;
    data['short_audio_description_block_17_15'] =
        this.shortAudioDescriptionBlock1715;
    data['audio_title_block_17_15'] = this.audioTitleBlock1715;
    data['audio_field_block_17_15'] = this.audioFieldBlock1715;
    data['audio_description_block_17_15'] = this.audioDescriptionBlock1715;
    data['audio_time_block_19_15'] = this.audioTimeBlock1915;
    data['short_audio_title_block_19_15'] = this.shortAudioTitleBlock1915;
    data['short_audio_field_block_19_15'] = this.shortAudioFieldBlock1915;
    data['short_audio_description_block_19_15'] =
        this.shortAudioDescriptionBlock1915;
    data['audio_title_block_19_15'] = this.audioTitleBlock1915;
    data['audio_field_block_19_15'] = this.audioFieldBlock1915;
    data['audio_description_block_19_15'] = this.audioDescriptionBlock1915;
//    if (this.image != null) {
//      data['image'] = this.image.toJson();
//    }
    data['human_date'] = this.humanDate;
    data['since_date'] = this.sinceDate;
    data['time_slots'] = this.timeSlots;
    return data;
  }
}

//class Image {
//
//
//  Image();
//
//Image.fromJson(Map<String, dynamic> json) {
//}
//
//Map<String, dynamic> toJson() {
//  final Map<String, dynamic> data = new Map<String, dynamic>();
//  return data;
//}
//}
