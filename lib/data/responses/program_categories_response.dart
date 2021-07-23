class ProgramCategoriesResponse {
  int id;
  int count;
  String description;
  String link;
  String name;
  String slug;
  String taxonomy;
  int parent;
//  List<Null> meta;
  String programs;

  ProgramCategoriesResponse(
      {this.id,
        this.count,
        this.description,
        this.link,
        this.name,
        this.slug,
        this.taxonomy,
        this.parent,
//        this.meta,
        this.programs});

  ProgramCategoriesResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    description = json['description'];
    link = json['link'];
    name = json['name'];
    slug = json['slug'];
    taxonomy = json['taxonomy'];
    parent = json['parent'];
//    if (json['meta'] != null) {
//      meta = new List<Null>();
//      json['meta'].forEach((v) {
//        meta.add(new Null.fromJson(v));
//      });
//    }
    programs = json['programs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['count'] = this.count;
    data['description'] = this.description;
    data['link'] = this.link;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['taxonomy'] = this.taxonomy;
    data['parent'] = this.parent;
//    if (this.meta != null) {
//      data['meta'] = this.meta.map((v) => v.toJson()).toList();
//    }
    data['programs'] = this.programs;
    return data;
  }
}
