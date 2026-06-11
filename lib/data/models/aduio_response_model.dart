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

  String? status;
  String? message;
  FileClass? file;
  Data? data;

  factory AudioResponseModel.fromJson(Map<String, dynamic> json) =>
      AudioResponseModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "file": file?.toJson(),
        "data": data?.toJson(),
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

  int? id;
  String? uploadDate;
  String? uploadtime;
  String? title;
  String? key;
  String? modificationDate;
  String? processingStatus;
  String? size;
  String? uploadSpeed;
  String? status;
  List<dynamic>? allResolutions;
  String? aspectRatio;
  String? mediaType;
  String? duration;
  int? durationInSeconds;
  String? thumbnail;
  List<dynamic>? moreThumbnails;
  List<dynamic>? promos;
  int? season;
  int? episode;
  String? subscriptionType;
  String? genre;
  String? actors;
  String? yearofproduction;
  String? dateofrelease;
  String? producer;
  String? description;
  String? keywords;
  String? tags;
  List<dynamic>? geoblocking;
  String? embedUrl;
  List<Folder>? folder;
  String? fullfolderpath;
  List<dynamic>? vtts;
  String? ischapter;
  String? videoparentkey;
  List<dynamic>? chapters;
  List<Source>? source;

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
        "Id": id,
        "UploadDate": uploadDate,
        "Uploadtime": uploadtime,
        "Title": title,
        "Key": key,
        "ModificationDate": modificationDate,
        "ProcessingStatus": processingStatus,
        "Size": size,
        "UploadSpeed": uploadSpeed,
        "Status": status,
        "AllResolutions": allResolutions != null ? List<dynamic>.from(allResolutions!.map((x) => x)) : null,
        "AspectRatio": aspectRatio,
        "MediaType": mediaType,
        "Duration": duration,
        "DurationInSeconds":
            durationInSeconds,
        "Thumbnail": thumbnail,
        "moreThumbnails": moreThumbnails != null ? List<dynamic>.from(moreThumbnails!.map((x) => x)) : null,
        "Promos": promos != null ? List<dynamic>.from(promos!.map((x) => x)) : null,
        "Season": season,
        "Episode": episode,
        "SubscriptionType": subscriptionType,
        "Genre": genre,
        "Actors": actors,
        "Yearofproduction": yearofproduction,
        "Dateofrelease": dateofrelease,
        "Producer": producer,
        "Description": description,
        "Keywords": keywords,
        "Tags": tags,
        "Geoblocking": geoblocking != null ? List<dynamic>.from(geoblocking!.map((x) => x)) : null,
        "EmbedURL": embedUrl,
        "folder": folder != null ? List<dynamic>.from(folder!.map((x) => x.toJson())) : null,
        "fullfolderpath": fullfolderpath,
        "vtts": vtts != null ? List<dynamic>.from(vtts!.map((x) => x)) : null,
        "ischapter": ischapter,
        "videoparentkey": videoparentkey,
        "Chapters": chapters != null ? List<dynamic>.from(chapters!.map((x) => x)) : null,
        "Source": source != null ? List<dynamic>.from(source!.map((x) => x.toJson())) : null,
      };
}

class Folder {
  Folder({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Folder.fromJson(Map<String, dynamic> json) => Folder(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Source {
  Source({
    this.hls,
    this.smooth,
    this.mpegDashLink,
    this.advertisement,
  });

  List<Hl>? hls;
  List<Hl>? smooth;
  List<Hl>? mpegDashLink;
  List<dynamic>? advertisement;

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
        "HLS": hls != null ? List<dynamic>.from(hls!.map((x) => x.toJson())) : null,
        "smooth": smooth != null ? List<dynamic>.from(smooth!.map((x) => x.toJson())) : null,
        "mpeg-dashLink": mpegDashLink != null ? List<dynamic>.from(mpegDashLink!.map((x) => x.toJson())) : null,
        "advertisement": advertisement != null ? List<dynamic>.from(advertisement!.map((x) => x)) : null,
      };
}

class Hl {
  Hl({
    this.name,
    this.link,
  });

  String? name;
  String? link;

  factory Hl.fromJson(Map<String, dynamic> json) => Hl(
        name: json["Name"] == null ? null : json["Name"],
        link: json["Link"] == null ? null : json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Link": link,
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

  String? type;
  String? title;
  String? size;
  String? embed;
  String? status;
  String? processingStatus;
  String? url;
  String? duration;

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
        "type": type,
        "title": title,
        "size": size,
        "embed": embed,
        "status": status,
        "processing_status": processingStatus,
        "url": url,
        "duration": duration,
      };
}
