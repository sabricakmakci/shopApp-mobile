import 'package:flutter/material.dart';
import 'package:shop_app_mobile/core/ui/image_title_desc_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OngoingList extends StatefulWidget {
  const OngoingList({super.key});

  @override
  State<OngoingList> createState() => _OngoingListState();
}

class _OngoingListState extends State<OngoingList> {
  @override
  Widget build(BuildContext context) {
    return emptyOngoingList();
  }

  Widget emptyOngoingList() {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageTitleDescWidget(
            title: AppLocalizations.of(context)!.noOngoingOrder,
            desc: AppLocalizations.of(context)!.noOngoingOrderDesc,
            image: "box",
          ),
        ],
      ),
    );
  }
}
