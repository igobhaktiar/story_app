class StoryModel {
  StoryModel({
    String? createdAt,
    String? writer,
    String? title,
    String? story,
    num? like,
    List<Comments>? comments,
    String? images,
    String? id,
    String? userId,
  }) {
    _createdAt = createdAt;
    _writer = writer;
    _title = title;
    _story = story;
    _like = like;
    _comments = comments;
    _images = images;
    _id = id;
    _userId = userId;
  }

  StoryModel.fromJson(dynamic json) {
    _createdAt = json['createdAt'];
    _writer = json['writer'];
    _title = json['title'];
    _story = json['story'];
    _like = json['like'];
    if (json['comments'] != null) {
      _comments = [];
      json['comments'].forEach((v) {
        _comments?.add(Comments.fromJson(v));
      });
    }
    _images = json['images'];
    _id = json['id'];
    _userId = json['userId'];
  }

  String? _createdAt;
  String? _writer;
  String? _title;
  String? _story;
  num? _like;
  List<Comments>? _comments;
  String? _images;
  String? _id;
  String? _userId;

  StoryModel copyWith({
    String? createdAt,
    String? writer,
    String? title,
    String? story,
    num? like,
    List<Comments>? comments,
    String? images,
    String? id,
    String? userId,
  }) =>
      StoryModel(
        createdAt: createdAt ?? _createdAt,
        writer: writer ?? _writer,
        title: title ?? _title,
        story: story ?? _story,
        like: like ?? _like,
        comments: comments ?? _comments,
        images: images ?? _images,
        id: id ?? _id,
        userId: userId ?? _userId,
      );

  String? get createdAt => _createdAt;

  String? get writer => _writer;

  String? get title => _title;

  String? get story => _story;

  num? get like => _like;

  List<Comments>? get comments => _comments;

  String? get images => _images;

  String? get id => _id;

  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = _createdAt;
    map['writer'] = _writer;
    map['title'] = _title;
    map['story'] = _story;
    map['like'] = _like;
    if (_comments != null) {
      map['comments'] = _comments?.map((v) => v.toJson()).toList();
    }
    map['images'] = _images;
    map['id'] = _id;
    map['userId'] = _userId;
    return map;
  }
}

class Comments {
  Comments({
    String? name,
    String? commentReader,
  }) {
    _name = name;
    _commentReader = commentReader;
  }

  Comments.fromJson(dynamic json) {
    _name = json['name'];
    _commentReader = json['comment_reader'];
  }

  String? _name;
  String? _commentReader;

  Comments copyWith({
    String? name,
    String? commentReader,
  }) =>
      Comments(
        name: name ?? _name,
        commentReader: commentReader ?? _commentReader,
      );

  String? get name => _name;

  String? get commentReader => _commentReader;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['comment_reader'] = _commentReader;
    return map;
  }
}
