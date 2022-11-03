import 'dart:convert';

SearchPhotos searchPhotosFromJson(String str) =>
    SearchPhotos.fromJson(json.decode(str));

String searchPhotosToJson(SearchPhotos data) => json.encode(data.toJson());

class SearchPhotos {
  SearchPhotos({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  int total;
  int totalPages;
  List<Result> results;

  factory SearchPhotos.fromJson(Map<String, dynamic> json) => SearchPhotos(
        total: json["total"],
        totalPages: json["total_pages"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "total_pages": totalPages,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.createdAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.likes,
    required this.likedByUser,
    required this.description,
    required this.user,
    required this.currentUserCollections,
    required this.urls,
    required this.links,
  });

  String id;
  DateTime createdAt;
  int width;
  int height;
  String color;
  String blurHash;
  int likes;
  bool likedByUser;
  String description;
  User user;
  List<dynamic> currentUserCollections;
  Urls urls;
  ResultLinks links;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        description: json["description"],
        user: User.fromJson(json["user"]),
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        urls: Urls.fromJson(json["urls"]),
        links: ResultLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "likes": likes,
        "liked_by_user": likedByUser,
        "description": description,
        "user": user.toJson(),
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "urls": urls.toJson(),
        "links": links.toJson(),
      };
}

class ResultLinks {
  ResultLinks({
    required this.self,
    required this.html,
    required this.download,
  });

  String self;
  String html;
  String download;

  factory ResultLinks.fromJson(Map<String, dynamic> json) => ResultLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
      };
}

class Urls {
  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.instagramUsername,
    required this.twitterUsername,
    required this.portfolioUrl,
    required this.profileImage,
    required this.links,
  });

  String id;
  String username;
  String name;
  String firstName;
  String lastName;
  String instagramUsername;
  String twitterUsername;
  String portfolioUrl;
  ProfileImage profileImage;
  UserLinks links;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        instagramUsername: json["instagram_username"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        links: UserLinks.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "instagram_username": instagramUsername,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "profile_image": profileImage.toJson(),
        "links": links.toJson(),
      };
}

class UserLinks {
  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
  });

  String self;
  String html;
  String photos;
  String likes;

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
      };
}

class ProfileImage {
  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  String small;
  String medium;
  String large;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}
