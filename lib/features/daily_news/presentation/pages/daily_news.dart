import 'package:clena_architecture_test/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clena_architecture_test/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daily News",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
        builder: (_, state) {
      if (state is RemoteArticleLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }

      if (state is RemoteArticleError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }

      if (state is RemoteArticleDone) {
        return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('$index'),
              );
            });
      }
      return const SizedBox();
    });
  }
}
