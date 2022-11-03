import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unsplash/constants.dart';
import 'package:unsplash/entity/models.dart';
import 'package:unsplash/presenter/providers.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() async {
    super.initState();
    final futureData = Provider.of<ResultsProvider>(context, listen: false);
    await futureData.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ResultsProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: bgLightColor,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: "https://picsum.photos/170",
              placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) =>
                  const Icon(CupertinoIcons.helm, size: 18),
            ),
          ),
        ),
        middle: CupertinoSearchTextField(
          onSubmitted: (value) {
            data.query = value;
            data.fetchData();
          },
          style: tsH2Blue,
          placeholderStyle: tsH2Blue,
        ),
      ),
      child: SafeArea(
        child: Center(
          child: data.isLoading
              ? const CupertinoActivityIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CupertinoButton(
                            child: const Icon(CupertinoIcons.back),
                            onPressed: () {
                              if (data.page > 1) {
                                data.page--;
                                data.fetchData();
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              data.page.toString(),
                              style: tsH2Blue,
                            ),
                          ),
                          CupertinoButton(
                            child: const Icon(CupertinoIcons.forward),
                            onPressed: () {
                              if (data.page < data.busqueda.totalPages) {
                                data.page++;
                                data.fetchData();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: data.busqueda.results.length,
                      itemBuilder: (context, index) {
                        if (data.busqueda.results.isNotEmpty) {
                          return ResultCard(
                            result: data.busqueda.results[index],
                          );
                        } else {
                          return const CupertinoActivityIndicator(
                            color: secondaryColor,
                          );
                        }
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class ResultCard extends StatefulWidget {
  final Result result;
  const ResultCard({Key? key, required this.result}) : super(key: key);

  @override
  _ResultCardState createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: 80,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: secondaryColor.withOpacity(0.8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: CachedNetworkImage(
                      imageUrl: widget.result.user.profileImage.small,
                      placeholder: (context, url) =>
                          const CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(CupertinoIcons.helm),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.result.description,
                      style: tsH2Black,
                    ),
                  ),
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.result.user.username,
                      style: tsH2Blue,
                    ),
                  ),
                  Container(
                    //width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.result.user.name,
                      style: tsH1Black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\$ ${widget.result.likes.toString()} likes",
                  style: tsH3Blue,
                ),
              ),
              Container(
                //width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${widget.result.blurHash}-${widget.result.user.instagramUsername}",
                  style: tsH3Black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
