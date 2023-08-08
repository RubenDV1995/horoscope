import '../../constants/constants.dart';
import '../../constants/paths.dart';

enum FailuresEnum {
  unknown,
  parseError,
  notFoundElements,
  unauthorized,
  network,
  brightness,

  ///Sounds
  notSoundFound,
  notSoundsFound,

  ///Voices
  notVoiceFound,
  notVoicesFound,

  ///Suggestions
  notSuggestionFound,
  notSuggestionsFound,

  ///Modes
  notModeFound,
  notModesFound,

  ///Firebase
  cancelDownload,

  ///AppConfigs
  notConfigFound,
  notConfigsFound,

  ///AppConfigs
  urlParseError,
  urlLaunchError,

  ///AppConfigs
  notSingFound,
  notSingsFound
}

Map<String, Object> mapFailures = {
  "failures": [
    {
      "id": "unknown",
      "title": lblUnknownTitle,
      "subtitle": lblUnknownDescription,
      "action": "none",
      "urlImage": unknown,
    },
    {
      "id": "parseError",
      "title": lblParseErrorTitle,
      "subtitle": lblParseErrorDescription,
      "action": "none",
      "urlImage": parseError,
    },
    {
      "id": "notFoundElements",
      "title": lblNotFoundElementsTitle,
      "subtitle": lblNotFoundElementsDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "unauthorized",
      "title": lblUnauthorizedTitle,
      "subtitle": lblUnauthorizedDescription,
      "action": "none",
      "urlImage": unauthorized,
    },
    {
      "id": "network",
      "title": lblNetworkTitle,
      "subtitle": lblNetworkDescription,
      "action": "none",
      "urlImage": network,
    },
    {
      "id": "notSoundFound",
      "title": lblNotSoundFoundTitle,
      "subtitle": lblNotSoundFoundDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notSoundsFound",
      "title": lblNotSoundsFoundTitle,
      "subtitle": lblNotSoundsFoundDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notVoiceFound",
      "title": lblNotVoiceFoundTitle,
      "subtitle": lblNotVoiceFoundDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notVoicesFound",
      "title": lblNotVoicesFoundTitle,
      "subtitle": lblNotVoicesFoundDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notSuggestionFound",
      "title": lblNotSuggestionFoundTitle,
      "subtitle": lblNotSuggestionFoundDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notSuggestionsFound",
      "title": lblNotSuggestionsFoundTitle,
      "subtitle": lblNotSuggestionsFoundDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notModeFound",
      "title": lblNotModeFoundTitle,
      "subtitle": lblNotModeFoundDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notModesFound",
      "title": lblNotModesFoundTitle,
      "subtitle": lblNotModesFoundDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "cancelDownload",
      "title": lblCancelDownloadTitle,
      "subtitle": lblCancelDownloadDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "brightness",
      "title": lblBrightnessErrorTitle,
      "subtitle": lblBrightnessErrorDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notConfigFound",
      "title": lblAppConfigErrorTitle,
      "subtitle": lblAppConfigErrorDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notConfigsFound",
      "title": lblAppConfigsErrorTitle,
      "subtitle": lblAppConfigsErrorDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "urlParseError",
      "title": lblUrlParseErrorTitle,
      "subtitle": lblUrlParseErrorDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "urlLaunchError",
      "title": lblUrlLaunchErrorTitle,
      "subtitle": lblUrlLaunchErrorDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notSingFound",
      "title": lblNotSingFoundTitle,
      "subtitle": lblNotSingFoundDescription,
      "action": "none",
      "urlImage": notFoundElements,
    },
    {
      "id": "notSingsFound",
      "title": lblNotSingsFoundTitle,
      "subtitle": lblNotSingsFoundDescription,
      "action": "none",
      "urlImage": notFoundElements,
    }
  ]
};
