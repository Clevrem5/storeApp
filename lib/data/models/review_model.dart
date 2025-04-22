class ReviewModel {
  final int id;
  final String comment;
  final DateTime created;
  final String userFullName;

  ReviewModel({
    required this.id,
    required this.comment,
    required this.created,
    required this.userFullName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      comment: json['comment'],
      created: DateTime.parse(json['created']),
      userFullName: json['userFullName'],
    );
  }
}

class ReviewCreateModel {
  final String productId;
  final String rating;
  final String comment;

  ReviewCreateModel({
    required this.productId,
    required this.rating,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId':productId,
      'rating':rating,
      'comment':comment,
    };
  }
}
