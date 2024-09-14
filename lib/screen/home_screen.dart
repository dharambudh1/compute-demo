import "package:compute_demo/controller/home_controller.dart";
import "package:compute_demo/model/movies_model.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Compute Demo")),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            topWidget(context),
            const SizedBox(height: 16),
            bottomWidget(context),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget topWidget(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          return controller.rxShowLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.rxMoviesList.isEmpty
                  ? const Center(
                      child: Text(
                        "Press the buttons below to load",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.rxMoviesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Movies movies = controller.rxMoviesList[index];
                        return ListTile(
                          dense: true,
                          title: Text(
                            movies.movie ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            movies.leadStudio ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {},
                        );
                      },
                    );
        },
      ),
    );
  }

  Widget bottomWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: controller.withoutUsingCompute,
            child: Text(
              "Load Without Compute",
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: controller.withUsingCompute,
            child: Text(
              "Load Using Compute",
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
