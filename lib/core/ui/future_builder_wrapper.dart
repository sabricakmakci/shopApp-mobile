import 'package:flutter/material.dart';

typedef WidgetBuilder<T> = Widget Function(BuildContext context, T data);
typedef ErrorBuilder<T> = Widget Function(BuildContext context);

class FutureBuilderWrapper<T> extends StatelessWidget {
  final Future<T>? data;
  final Function? onRefresh;
  final WidgetBuilder<T> builder;
  final ErrorBuilder<T>? errorBuilder;

  const FutureBuilderWrapper({
    Key? key,
    required this.data,
    this.onRefresh,
    required this.builder,
    this.errorBuilder,
  }) : super(key: key);

  void _onRefresh() {
    this.onRefresh?.call();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: this.data,
        builder: (BuildContext context, AsyncSnapshot<T?> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Liste alinirken hata olustu"),
                  TextButton(
                      onPressed: () {
                        this._onRefresh();
                      },
                      child: const Text("Yenile"))
                ],
              ),
            );
          } else if (snapshot.hasData) {
            return this.builder(context, snapshot.data as T);
          }
          return errorBuilder?.call(context) ??
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Veri alinamdi"),
                    TextButton(
                        onPressed: () {
                          this._onRefresh();
                        },
                        child: const Text("Yenile"))
                  ],
                ),
              );
        });
  }
}
