import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rrrflectly/core/models/item_model.dart';
import 'package:rrrflectly/ui/screens/home/home_viewmodel_impl.dart';
import 'package:rrrflectly/ui/utils/colors.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:rrrflectly/ui/utils/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeViewModelImpl _viewModel;
  late Future<dartz.Either<String, List<Item>>> _future;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _viewModel = Provider.of<HomeViewModelImpl>(context);
    _future = _viewModel.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _viewModel.getBackgroundColor(),
      body: SafeArea(
        child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: _viewModel.getBackgroundColor(),
                leading: const BackButton(color: AppColors.white),
                floating: true,
                snap: false,
                pinned: false,
                flexibleSpace: Hero(
                  tag: 'emoji',
                  child: Lottie.asset('assets/animations/emoji-anim.json',
                      width: 50, height: 50),
                ),
              ),
              SliverToBoxAdapter(
                child: FutureBuilder<dartz.Either<String, List<Item>>>(
                  future: _future,
                  builder: (BuildContext buildContext,
                      AsyncSnapshot<dartz.Either<String, List<Item>>>
                          snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.fold((failure) {
                        return errorContent(context, failure);
                      }, (result) {
                        return itemsContent(context, result);
                      });
                    } else {
                      return CircularProgressIndicator(
                          color: _viewModel.getBackgroundColor());
                    }
                  },
                ),
              )
            ]),
      ),
    );
  }

  Widget errorContent(BuildContext context, String failure) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            failure,
            style: TextStyles.title2,
          ),
          backgroundColor: AppColors.error,
        ),
      );
    });

    return GestureDetector(
      onTap: () {
        setState(() {
          _future = _viewModel.getItems();
        });
      },
      child: const Icon(
        Icons.refresh,
        color: AppColors.white,
      ),
    );
  }

  Widget itemsContent(BuildContext context, List<Item> items) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(Insets.sm),
          padding: const EdgeInsets.all(Insets.sm),
          width: constraints.maxWidth,
          height: 75,
          decoration: const BoxDecoration(
              color: AppColors.white, borderRadius: Corners.medBorder),
          child: Center(
            child: Text(items[index].title.toString()),
          ),
        ),
      );
    });
  }
}
