import 'package:flutter/material.dart';
import 'package:horoscopos/constants/sizes.dart';
import 'package:provider/provider.dart';

import '../../../common/grid_view/custom_grid_view.dart';
import '../../../common/subtitle/space/custom_space_subtitle.dart';
import '../../../constants/constants.dart';
import '../../../data/models/failure_model.dart';
import '../../../data/models/sings_model.dart';
import '../../../utils/either/either.dart';
import '../../failure/page/failure_page.dart';
import '../controller/sings_controller.dart';
import '../widgets/item/sing_item.dart';
import '../widgets/skeletons/sings_list_skeleton.dart';

class SingsPage extends StatelessWidget {
  const SingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final singController = Provider.of<SingsController>(
          context,
          listen: false,
        );
        return FutureBuilder<Either<FailuresModel, List<Sing>>>(
          future: singController.getSings(),
          builder: (BuildContext context,
              AsyncSnapshot<Either<FailuresModel, List<Sing>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SingsListSkeleton();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return snapshot.data!.when(
                (failure) => FailurePage(
                  failure: failure,
                  onPress: ()=> singController.getSings(),
                ),
                (success) => SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomSpaceSubtitle(
                        title: lblInstructionSings,
                        size: spacingM_16,
                      ),
                      CustomGridView(
                        itemCount: singController.sings.length,
                        aspecRatio: (4 / 4.5),
                        itemBuilder: (context, index) {
                          return SingItem(
                            sing: singController.sings[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
