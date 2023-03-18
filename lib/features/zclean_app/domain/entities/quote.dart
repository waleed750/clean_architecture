import 'package:equatable/equatable.dart';

class Quote  extends Equatable {
  Quote({
  required this.id,
  required this.content,
  required this.author,
  required this.tags,
  required this.authorSlug,
  required this.length,
  required this.dateAdded,
  required this.dateModified,
  });

  String id;
  String content;
  String author;
  List<String> tags;
  String authorSlug;
  int length;
  DateTime dateAdded;
  DateTime dateModified;

  @override
  // TODO: implement props
  List<Object?> get props => [
    id , content , authorSlug , author , tags , length , dateAdded , dateModified
  ];
}