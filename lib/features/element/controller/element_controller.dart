import 'package:flutter/foundation.dart';
import 'package:horoscopos/data/repositories_implementation/element_repository_impl.dart';
import 'package:horoscopos/data/models/elements_model.dart';

import '../../../data/models/failure_model.dart';
import '../../../data/models/sings_model.dart';
import '../../../utils/either/either.dart';

class ElementController extends ChangeNotifier {
  final ElementRepositoryImpl elementRepositoryImpl;

  ElementController({
    required this.elementRepositoryImpl,
  });

  late bool _isLoading = true;
  late bool _onErrorGetElement = false;
  Element? _element;
  List<Element>? _elements;
  late FailuresModel _failuresModel;

  bool get isLoading => _isLoading;

  bool get onErrorGetElement => _onErrorGetElement;

  Element? get element => _element;

  List<Element>? get elements => _elements;

  FailuresModel get failureModel => _failuresModel;

  Future<Either<FailuresModel, Element>> getElement({
    required Sing sing,
  }) async {
    final resultElements = await elementRepositoryImpl.getElement(
      sing: sing,
    );
    return resultElements.when(
      (failure) {
        onLoading(false);
        onError(
          failuresModel: failure,
        );
        return Either.left(
          failure,
        );
      },
      (element) {
        onLoading(false);
        setElement(element);
        return Either.right(
          element,
        );
      },
    );
  }

  Future<Either<FailuresModel, List<Element>>> getElements() async {
    final resultElements = await elementRepositoryImpl.getElements();
    return resultElements.when(
      (failure) {
        onLoading(false);
        onError(
          failuresModel: failure,
        );
        return Either.left(
          failure,
        );
      },
      (elements) {
        onLoading(false);
        setElements(elements);
        return Either.right(
          elements,
        );
      },
    );
  }

  setElement(Element element) {
    _onErrorGetElement = false;
    _element = element;
    notifyListeners();
  }

  setElements(List<Element> elements) {
    _onErrorGetElement = false;
    _elements = elements;
    notifyListeners();
  }

  onError({required FailuresModel failuresModel}) {
    _failuresModel = failuresModel;
    _onErrorGetElement = true;
    notifyListeners();
  }

  onLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
