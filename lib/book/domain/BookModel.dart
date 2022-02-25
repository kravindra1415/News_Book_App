class BookModel {
  String? kind;
  int? totalItems;
  List<Items>? items;

  BookModel({this.kind, this.totalItems, this.items});

  BookModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['totalItems'] = totalItems;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;

  Items({this.kind, this.id, this.etag, this.selfLink, this.volumeInfo});

  Items.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null
        ? VolumeInfo.fromJson(json['volumeInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kind'] = kind;
    data['id'] = id;
    data['etag'] = etag;
    data['selfLink'] = selfLink;
    if (volumeInfo != null) {
      data['volumeInfo'] = volumeInfo!.toJson();
    }
    return data;
  }
}

class VolumeInfo {
  String? title;
  String? subtitle;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  String? printType;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  int? averageRating;
  int? ratingsCount;

  VolumeInfo(
      {this.title,
      this.subtitle,
      this.publisher,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.printType,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink,
      this.averageRating,
      this.ratingsCount});

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];

    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    pageCount = json['pageCount'];
    printType = json['printType'];
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
    averageRating = json['averageRating'];
    ratingsCount = json['ratingsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;

    data['publisher'] = publisher;
    data['publishedDate'] = publishedDate;
    data['description'] = description;
    data['pageCount'] = pageCount;
    data['printType'] = printType;

    data['maturityRating'] = maturityRating;
    data['allowAnonLogging'] = allowAnonLogging;
    data['contentVersion'] = contentVersion;
    data['language'] = language;
    data['previewLink'] = previewLink;
    data['infoLink'] = infoLink;
    data['canonicalVolumeLink'] = canonicalVolumeLink;
    data['averageRating'] = averageRating;
    data['ratingsCount'] = ratingsCount;
    return data;
  }
}
