import 'package:earnipay/app/data/model/model.dart';
import 'package:earnipay/app/modules/home/bloc/home_bloc.dart';
import 'package:earnipay/app/routes/app_routes.dart';
import 'package:earnipay/app/widgets/image_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin{
  final controller = ScrollController();

  final List<Photo> _photos = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (ctx, st) {
            if (st is HomePhotoLoadingState) {
              _showSnackBar(context, message: "Loading...");
            } else if (st is HomePhotosReadyState && st.photos.isEmpty) {
              _showSnackBar(context, message: "No more photos...");
            } else if (st is HomePhotosReadyState) {
              _photos.addAll(st.photos);
            } else if (st is HomePhotoErrorState) {
              _showSnackBar(context, message: st.message);
              context.read<HomeBloc>().isFetching = false;
            }
            return;
          },
          builder: (context, state) {
            return CustomScrollView(
              controller: controller
                ..addListener(() {
                  if (controller.offset ==
                          controller.position.maxScrollExtent &&
                      !context.read<HomeBloc>().isFetching) {
                    context.read<HomeBloc>()
                      ..isFetching = true
                      ..add(LoadMorePhotosEvent());
                  }
                }),
              slivers: <Widget>[
                const SliverAppBar(
                  floating: false,
                  pinned: true,
                  expandedHeight: 100.00,
                  title: Text('Photos'),
                ),
                SliverPadding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _photos.isNotEmpty ? 2 : 1,
                      mainAxisExtent: 200.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (state is HomePhotoErrorState && _photos.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ERROR: ${state.message}"),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<HomeBloc>()
                                        .add(LoadMorePhotosEvent());
                                  },
                                  child: const Text('Try again'),
                                )
                              ],
                            ),
                          );
                        }
                        if (state is HomeInitState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is HomePhotoLoadingState && _photos.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          );
                        }

                        if (state is HomePhotosReadyState) {
                          context.read<HomeBloc>().isFetching = false;
                        }
                        return KeepAlive(
                          keepAlive: true,
                          child: IndexedSemantics(
                            index: index,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  child:
                                  EarniNetworkImage(
                                    photo: _photos[index],
                                    url: "${_photos[index].image?.regular}",
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 6),
                                    decoration: BoxDecoration(
                                        //color: Colors.purple,
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                    child: Text(
                                      '${_photos[index].user?.location}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: _photos.isNotEmpty ? _photos.length : 1,
                      addSemanticIndexes: false,
                      addAutomaticKeepAlives: false,
                      addRepaintBoundaries: false,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, {String? message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            message ?? "Showing snack bar..",
            style: const TextStyle(color: Colors.white),
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
