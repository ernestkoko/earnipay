import 'package:earnipay/app/data/model/model.dart';

class Photo {
  String? id;
  String? name;
  String? description;
  ImageUrl? image;
  User? user;

  Photo({
    this.id,
    this.name,
    this.description,
    this.image,
    this.user

  });

  Photo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = ImageUrl.fromJson(json['urls']) ;
    user = User.fromJson(json['user']);
    description = json["description"] != null && json["description"]!.toString() .length > json["alt_description"].toString().length ? json["description"]: json["alt_description"];
  }

}

class ImageUrl {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  ImageUrl({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  ImageUrl.fromJson(Map<String, dynamic> json) {
    raw = json['raw'] as String? ??'';
    full = json['full'] as String? ??'';
    regular = json['regular'] as String? ??'';
    small = json['small'] as String? ??'';
    thumb = json['thumb'] as String?;
    smallS3 = json['small_s3'] as String? ??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['raw'] = raw;
    json['full'] = full;
    json['regular'] = regular;
    json['small'] = small;
    json['thumb'] = thumb;
    json['small_s3'] = smallS3;
    return json;
  }
}

class Sponsorship {
  User? user;

  Sponsorship({
    this.user,
  });

  Sponsorship.fromJson(Map<String, dynamic> json) {
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['user'] = user?.toJson() ;
    return json;
  }
}

class User {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? firstName;
  dynamic lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;

  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String? ??'';
    updatedAt = json['updated_at'] as String? ??'';
    username = json['username'] as String? ??'';
    name = json['name'] as String?;
    firstName = json['first_name'] as String? ??'';
    lastName = json['last_name'] ??'';
    twitterUsername = json['twitter_username'] as String? ??'';
    portfolioUrl = json['portfolio_url'] as String? ??'';
    bio = json['bio'] as String? ??'';
    location = json['location'] as String? ??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['updated_at'] = updatedAt;
    json['username'] = username;
    json['name'] = name;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['twitter_username'] = twitterUsername;
    json['portfolio_url'] = portfolioUrl;
    json['bio'] = bio;
    json['location'] = location;
    return json;
  }
}