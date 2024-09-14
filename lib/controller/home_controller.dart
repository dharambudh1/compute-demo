import "dart:convert";
import "dart:developer";
import "dart:isolate";

import "package:compute_demo/model/movies_model.dart";
import "package:flutter/foundation.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";

class HomeController extends GetxController {
  final RxBool rxShowLoading = false.obs;
  final RxList<Movies> rxMoviesList = <Movies>[].obs;

  Future<String> loadString() async {
    return rootBundle.loadString("assets/json/large.json", cache: false);
  }

  Future<void> withoutUsingCompute() async {
    rxShowLoading(true);
    rxMoviesList.clear();

    final String string = await loadString();
    final List<Movies> value = parseMoviesFromJson(string);

    rxMoviesList.assignAll(value);
    rxShowLoading(false);
    return Future<void>.value();
  }

  Future<void> withUsingCompute() async {
    rxShowLoading(true);
    rxMoviesList.clear();

    final String string = await loadString();
    final List<Movies> value = await compute(
      parseMoviesFromJson,
      string,
      // debugLabel: "compute",
    );

    rxMoviesList.assignAll(value);
    rxShowLoading(false);
    return Future<void>.value();
  }
}

@pragma("vm:entry-point")
List<Movies> parseMoviesFromJson(String string) {
  log("parseMoviesFromJson() called in isolate: ${Isolate.current.debugName}");

  final List<dynamic> temp = json.decode(string);
  final List<Movies> value = <Movies>[];

  for (final dynamic e in temp) {
    value.add(Movies.fromJson(e));
  }

  return value;
}
