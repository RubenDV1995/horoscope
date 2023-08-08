import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/grid_view/CustomGridView.dart';
import '../../../common/subtitle/space/custom_space_subtitle.dart';
import '../../../constants/constants.dart';
import '../../../domian/repositories/sings_repository.dart';
import '../../failure/controller/failure_controller.dart';
import '../../failure/page/failure_page.dart';
import '../controller/sings_controller.dart';
import '../widgets/item/sing_item.dart';
import '../widgets/skeletons/sings_list_skeleton.dart';

class SingsPage extends StatefulWidget {
  const SingsPage({Key? key}) : super(key: key);

  @override
  State<SingsPage> createState() => _SingsPageState();
}

class _SingsPageState extends State<SingsPage> {
  ///Repository
  late SingsRepository _singsRepository;

  ///Controller
  late SingsController _singsController;
  late FailureController _failureController;

  @override
  void initState() {
    super.initState();
    _setRepositoryAndController();
    _getListSings();
  }

  void _setRepositoryAndController() {
    _singsRepository = Provider.of<SingsRepository>(
      context,
      listen: false,
    );
    _singsController = Provider.of<SingsController>(
      context,
      listen: false,
    );
    _failureController = Provider.of<FailureController>(
      context,
      listen: false,
    );
  }

  Future<void> _getListSings() async {
    final resultSings = await _singsRepository.getSings();
    _singsController.onLoading(true);
    resultSings.when(
      (failure) {
        _singsController.onError();
        _failureController.onError(failure);
      },
      (sounds) {
        _failureController.notError();
        _singsController.setSings(sounds);
        //_getCurrentSound();
      },
    );
    _singsController.onLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final singController = Provider.of<SingsController>(context);
        final failureController = Provider.of<FailureController>(context);
        if (singController.isLoading == true) {
          return const SingsListSkeleton();
        }
        if (failureController.isError == true &&
            singController.onErrorGetSings == true) {
          return FailurePage(
            failure: failureController.error,
            onPress: _getListSings,
          );
        }
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSpaceSubtitle(
                title: lblInstructionSings,
              ),
              CustomGridView(
                itemCount: _singsController.sings.length,
                itemBuilder: (context, index) {
                  return SingItem(
                    sing: _singsController.sings[index],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
