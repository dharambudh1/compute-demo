class Movies {
  Movies({
    this.movie,
    this.leadStudio,
    this.rottenTomatoes,
    this.story,
    this.genre,
    this.year,
  });

  Movies.fromJson(Map<String, dynamic> json) {
    movie = json["Movie"];
    leadStudio = json["LeadStudio"];
    rottenTomatoes = json["RottenTomatoes"];
    story = json["Story"];
    genre = json["Genre"];
    year = json["Year"];
  }

  String? movie;
  String? leadStudio;
  num? rottenTomatoes;
  String? story;
  String? genre;
  num? year;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["Movie"] = movie;
    data["LeadStudio"] = leadStudio;
    data["RottenTomatoes"] = rottenTomatoes;
    data["Story"] = story;
    data["Genre"] = genre;
    data["Year"] = year;

    return data;
  }
}
