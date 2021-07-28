// To parse this JSON data, do
//
//     final audioRespone = audioResponeFromJson(jsonString);

import 'dart:convert';

AudioResponseModel audioResponseFromJson(String str) =>
    AudioResponseModel.fromJson(json.decode(str));

String audioResponseToJson(AudioResponseModel data) =>
    json.encode(data.toJson());

class AudioResponseModel {
  AudioResponseModel({
    this.status,
    this.message,
    this.file,
    this.data,
  });

  String status;
  String message;
  FileClass file;
  Data data;

  factory AudioResponseModel.fromJson(Map<String, dynamic> json) =>
      AudioResponseModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "file": file == null ? null : file.toJson(),
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.uploadDate,
    this.uploadtime,
    this.title,
    this.key,
    this.modificationDate,
    this.processingStatus,
    this.size,
    this.uploadSpeed,
    this.status,
    this.allResolutions,
    this.aspectRatio,
    this.mediaType,
    this.duration,
    this.durationInSeconds,
    this.thumbnail,
    this.moreThumbnails,
    this.promos,
    this.season,
    this.episode,
    this.subscriptionType,
    this.genre,
    this.actors,
    this.yearofproduction,
    this.dateofrelease,
    this.producer,
    this.description,
    this.keywords,
    this.tags,
    this.geoblocking,
    this.embedUrl,
    this.folder,
    this.fullfolderpath,
    this.vtts,
    this.ischapter,
    this.videoparentkey,
    this.chapters,
    this.source,
  });

  int id;
  String uploadDate;
  String uploadtime;
  String title;
  String key;
  String modificationDate;
  String processingStatus;
  String size;
  String uploadSpeed;
  String status;
  List<dynamic> allResolutions;
  String aspectRatio;
  String mediaType;
  String duration;
  int durationInSeconds;
  String thumbnail;
  List<dynamic> moreThumbnails;
  List<dynamic> promos;
  int season;
  int episode;
  String subscriptionType;
  String genre;
  String actors;
  String yearofproduction;
  String dateofrelease;
  String producer;
  String description;
  String keywords;
  String tags;
  List<dynamic> geoblocking;
  String embedUrl;
  List<Folder> folder;
  String fullfolderpath;
  List<dynamic> vtts;
  String ischapter;
  String videoparentkey;
  List<dynamic> chapters;
  List<Source> source;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"] == null ? null : json["Id"],
        uploadDate: json["UploadDate"] == null ? null : json["UploadDate"],
        uploadtime: json["Uploadtime"] == null ? null : json["Uploadtime"],
        title: json["Title"] == null ? null : json["Title"],
        key: json["Key"] == null ? null : json["Key"],
        modificationDate:
            json["ModificationDate"] == null ? null : json["ModificationDate"],
        processingStatus:
            json["ProcessingStatus"] == null ? null : json["ProcessingStatus"],
        size: json["Size"] == null ? null : json["Size"],
        uploadSpeed: json["UploadSpeed"] == null ? null : json["UploadSpeed"],
        status: json["Status"] == null ? null : json["Status"],
        allResolutions: json["AllResolutions"] == null
            ? null
            : List<dynamic>.from(json["AllResolutions"].map((x) => x)),
        aspectRatio: json["AspectRatio"] == null ? null : json["AspectRatio"],
        mediaType: json["MediaType"] == null ? null : json["MediaType"],
        duration: json["Duration"] == null ? null : json["Duration"],
        durationInSeconds: json["DurationInSeconds"] == null
            ? null
            : json["DurationInSeconds"],
        thumbnail: json["Thumbnail"] == null ? null : json["Thumbnail"],
        moreThumbnails: json["moreThumbnails"] == null
            ? null
            : List<dynamic>.from(json["moreThumbnails"].map((x) => x)),
        promos: json["Promos"] == null
            ? null
            : List<dynamic>.from(json["Promos"].map((x) => x)),
        season: json["Season"] == null ? null : json["Season"],
        episode: json["Episode"] == null ? null : json["Episode"],
        subscriptionType:
            json["SubscriptionType"] == null ? null : json["SubscriptionType"],
        genre: json["Genre"] == null ? null : json["Genre"],
        actors: json["Actors"] == null ? null : json["Actors"],
        yearofproduction:
            json["Yearofproduction"] == null ? null : json["Yearofproduction"],
        dateofrelease:
            json["Dateofrelease"] == null ? null : json["Dateofrelease"],
        producer: json["Producer"] == null ? null : json["Producer"],
        description: json["Description"] == null ? null : json["Description"],
        keywords: json["Keywords"] == null ? null : json["Keywords"],
        tags: json["Tags"] == null ? null : json["Tags"],
        geoblocking: json["Geoblocking"] == null
            ? null
            : List<dynamic>.from(json["Geoblocking"].map((x) => x)),
        embedUrl: json["EmbedURL"] == null ? null : json["EmbedURL"],
        folder: json["folder"] == null
            ? null
            : List<Folder>.from(json["folder"].map((x) => Folder.fromJson(x))),
        fullfolderpath:
            json["fullfolderpath"] == null ? null : json["fullfolderpath"],
        vtts: json["vtts"] == null
            ? null
            : List<dynamic>.from(json["vtts"].map((x) => x)),
        ischapter: json["ischapter"] == null ? null : json["ischapter"],
        videoparentkey:
            json["videoparentkey"] == null ? null : json["videoparentkey"],
        chapters: json["Chapters"] == null
            ? null
            : List<dynamic>.from(json["Chapters"].map((x) => x)),
        source: json["Source"] == null
            ? null
            : List<Source>.from(json["Source"].map((x) => Source.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id == null ? null : id,
        "UploadDate": uploadDate == null ? null : uploadDate,
        "Uploadtime": uploadtime == null ? null : uploadtime,
        "Title": title == null ? null : title,
        "Key": key == null ? null : key,
        "ModificationDate": modificationDate == null ? null : modificationDate,
        "ProcessingStatus": processingStatus == null ? null : processingStatus,
        "Size": size == null ? null : size,
        "UploadSpeed": uploadSpeed == null ? null : uploadSpeed,
        "Status": status == null ? null : status,
        "AllResolutions": allResolutions == null
            ? null
            : List<dynamic>.from(allResolutions.map((x) => x)),
        "AspectRatio": aspectRatio == null ? null : aspectRatio,
        "MediaType": mediaType == null ? null : mediaType,
        "Duration": duration == null ? null : duration,
        "DurationInSeconds":
            durationInSeconds == null ? null : durationInSeconds,
        "Thumbnail": thumbnail == null ? null : thumbnail,
        "moreThumbnails": moreThumbnails == null
            ? null
            : List<dynamic>.from(moreThumbnails.map((x) => x)),
        "Promos":
            promos == null ? null : List<dynamic>.from(promos.map((x) => x)),
        "Season": season == null ? null : season,
        "Episode": episode == null ? null : episode,
        "SubscriptionType": subscriptionType == null ? null : subscriptionType,
        "Genre": genre == null ? null : genre,
        "Actors": actors == null ? null : actors,
        "Yearofproduction": yearofproduction == null ? null : yearofproduction,
        "Dateofrelease": dateofrelease == null ? null : dateofrelease,
        "Producer": producer == null ? null : producer,
        "Description": description == null ? null : description,
        "Keywords": keywords == null ? null : keywords,
        "Tags": tags == null ? null : tags,
        "Geoblocking": geoblocking == null
            ? null
            : List<dynamic>.from(geoblocking.map((x) => x)),
        "EmbedURL": embedUrl == null ? null : embedUrl,
        "folder": folder == null
            ? null
            : List<dynamic>.from(folder.map((x) => x.toJson())),
        "fullfolderpath": fullfolderpath == null ? null : fullfolderpath,
        "vtts": vtts == null ? null : List<dynamic>.from(vtts.map((x) => x)),
        "ischapter": ischapter == null ? null : ischapter,
        "videoparentkey": videoparentkey == null ? null : videoparentkey,
        "Chapters": chapters == null
            ? null
            : List<dynamic>.from(chapters.map((x) => x)),
        "Source": source == null
            ? null
            : List<dynamic>.from(source.map((x) => x.toJson())),
      };
}

class Folder {
  Folder({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}

class Source {
  Source({
    this.hls,
    this.smooth,
    this.mpegDashLink,
    this.advertisement,
  });

  List<Hl> hls;
  List<Hl> smooth;
  List<Hl> mpegDashLink;
  List<dynamic> advertisement;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        hls: json["HLS"] == null
            ? null
            : List<Hl>.from(json["HLS"].map((x) => Hl.fromJson(x))),
        smooth: json["smooth"] == null
            ? null
            : List<Hl>.from(json["smooth"].map((x) => Hl.fromJson(x))),
        mpegDashLink: json["mpeg-dashLink"] == null
            ? null
            : List<Hl>.from(json["mpeg-dashLink"].map((x) => Hl.fromJson(x))),
        advertisement: json["advertisement"] == null
            ? null
            : List<dynamic>.from(json["advertisement"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "HLS":
            hls == null ? null : List<dynamic>.from(hls.map((x) => x.toJson())),
        "smooth": smooth == null
            ? null
            : List<dynamic>.from(smooth.map((x) => x.toJson())),
        "mpeg-dashLink": mpegDashLink == null
            ? null
            : List<dynamic>.from(mpegDashLink.map((x) => x.toJson())),
        "advertisement": advertisement == null
            ? null
            : List<dynamic>.from(advertisement.map((x) => x)),
      };
}

class Hl {
  Hl({
    this.name,
    this.link,
  });

  String name;
  String link;

  factory Hl.fromJson(Map<String, dynamic> json) => Hl(
        name: json["Name"] == null ? null : json["Name"],
        link: json["Link"] == null ? null : json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name == null ? null : name,
        "Link": link == null ? null : link,
      };
}

class FileClass {
  FileClass({
    this.type,
    this.title,
    this.size,
    this.embed,
    this.status,
    this.processingStatus,
    this.url,
    this.duration,
  });

  String type;
  String title;
  String size;
  String embed;
  String status;
  String processingStatus;
  String url;
  String duration;

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        type: json["type"] == null ? null : json["type"],
        title: json["title"] == null ? null : json["title"],
        size: json["size"] == null ? null : json["size"],
        embed: json["embed"] == null ? null : json["embed"],
        status: json["status"] == null ? null : json["status"],
        processingStatus: json["processing_status"] == null
            ? null
            : json["processing_status"],
        url: json["url"] == null ? null : json["url"],
        duration: json["duration"] == null ? null : json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "title": title == null ? null : title,
        "size": size == null ? null : size,
        "embed": embed == null ? null : embed,
        "status": status == null ? null : status,
        "processing_status": processingStatus == null ? null : processingStatus,
        "url": url == null ? null : url,
        "duration": duration == null ? null : duration,
      };
}
