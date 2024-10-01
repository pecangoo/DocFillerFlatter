import 'package:filler_doc/app/presentation/constans/style_colors.dart';
import 'package:filler_doc/utils/apputils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/entities/template.dart';
import '../../../../constans/textStyles.dart';
import '../../../form_list/ui_utils/red_icon.dart';
import '../../../utils/delete_agreement_dialog.dart';
import '../../providers/template_screen_provider.dart';

class TemplateTile extends StatelessWidget {
  final Template template;
  final int index;

  const TemplateTile({required this.template, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<TemplateScreenProvider>(context, listen: false)
            .changeActiveTile(template.uuid);
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ColoredBox(
          color: Provider.of<TemplateScreenProvider>(context)
                      .currentActiveTemplateUUID ==
                  template.uuid
              ? colorActiveItem
              : Colors.transparent,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //   mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text((index + 1).toString()),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          //  Text("Название: ", style: textStyleNameLabel,),
                          Text(
                            "${template.nameTemplate}",
                            style: textStyleName,
                          ),
                        ],
                      ),
                      Column(
                        //    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //   Text("Дата создания:: ", style: textStyleNameLabel,),
                          Text(fromTimeStampStrToDateTime(template.timestamp)),
                        ],
                      )
                      // Text("Форма: ${templateю}"),
                    ]),
              ),
              Expanded(
                  flex: 1,
                  child: RedIcon(
                      action: () async {
                        var res =
                            await deleteAgreementDialog(context, "шаблон");
                        if (res == 1) {
                          Provider.of<TemplateScreenProvider>(context,
                                  listen: false)
                              .deleteTemplateByUUID(template.uuid);
                        }
                      },
                      icon: Icons.cancel_outlined,
                      hint: "Удалить шаблон")),
            ],
          ),
        ),
      ),
    );
  }
}
