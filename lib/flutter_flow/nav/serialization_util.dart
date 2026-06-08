import 'dart:convert';

import 'package:flutter/material.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '../../flutter_flow/place.dart';
import '../../flutter_flow/uploaded_file.dart';

/// SERIALIZATION HELPERS

String dateTimeToString(DateTime dateTime) =>
    '${dateTime.isUtc ? 'u' : 'l'}${dateTime.millisecondsSinceEpoch}';

String dateTimeRangeToString(DateTimeRange dateTimeRange) {
  final start = dateTimeRange.start;
  final end = dateTimeRange.end;
  final startStr = '${start.isUtc ? 'u' : 'l'}${start.millisecondsSinceEpoch}';
  final endStr = '${end.isUtc ? 'u' : 'l'}${end.millisecondsSinceEpoch}';
  return '$startStr|$endStr';
}

String placeToString(FFPlace place) => jsonEncode({
      'latLng': place.latLng.serialize(),
      'name': place.name,
      'address': place.address,
      'city': place.city,
      'state': place.state,
      'country': place.country,
      'zipCode': place.zipCode,
    });

String uploadedFileToString(FFUploadedFile uploadedFile) =>
    uploadedFile.serialize();

String? serializeParam(
  dynamic param,
  ParamType paramType, {
  bool isList = false,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final serializedValues = (param as Iterable)
          .map((p) => serializeParam(p, paramType, isList: false))
          .where((p) => p != null)
          .map((p) => p!)
          .toList();
      return json.encode(serializedValues);
    }
    String? data;
    switch (paramType) {
      case ParamType.int:
        data = param.toString();
      case ParamType.double:
        data = param.toString();
      case ParamType.String:
        data = param;
      case ParamType.bool:
        data = param ? 'true' : 'false';
      case ParamType.DateTime:
        data = dateTimeToString(param as DateTime);
      case ParamType.DateTimeRange:
        data = dateTimeRangeToString(param as DateTimeRange);
      case ParamType.LatLng:
        data = (param as LatLng).serialize();
      case ParamType.Color:
        data = (param as Color).toCssString();
      case ParamType.FFPlace:
        data = placeToString(param as FFPlace);
      case ParamType.FFUploadedFile:
        data = uploadedFileToString(param as FFUploadedFile);
      case ParamType.JSON:
        data = json.encode(param);

      case ParamType.DataStruct:
        data = param is BaseStruct ? param.serialize() : null;

      case ParamType.SupabaseRow:
        return json.encode((param as SupabaseDataRow).data);

      default:
        data = null;
    }
    return data;
  } catch (e) {
    print('Error serializing parameter: $e');
    return null;
  }
}

/// END SERIALIZATION HELPERS

/// DESERIALIZATION HELPERS

DateTime? dateTimeFromString(String? dateTimeStr) {
  if (dateTimeStr == null || dateTimeStr.isEmpty) {
    return null;
  }
  final hasPrefix = dateTimeStr.startsWith('u') || dateTimeStr.startsWith('l');
  final milliseconds = int.tryParse(
    hasPrefix ? dateTimeStr.substring(1) : dateTimeStr,
  );
  return milliseconds != null
      ? DateTime.fromMillisecondsSinceEpoch(
          milliseconds,
          isUtc: hasPrefix ? dateTimeStr.startsWith('u') : false,
        )
      : null;
}

DateTimeRange? dateTimeRangeFromString(String dateTimeRangeStr) {
  final pieces = dateTimeRangeStr.split('|');
  if (pieces.length != 2) {
    return null;
  }
  DateTime? parseDateTime(String value) {
    final hasPrefix = value.startsWith('u') || value.startsWith('l');
    final milliseconds = int.tryParse(hasPrefix ? value.substring(1) : value);
    return milliseconds != null
        ? DateTime.fromMillisecondsSinceEpoch(
            milliseconds,
            isUtc: hasPrefix ? value.startsWith('u') : false,
          )
        : null;
  }

  final start = parseDateTime(pieces.first);
  final end = parseDateTime(pieces.last);
  if (start == null || end == null) {
    return null;
  }
  return DateTimeRange(
    start: start,
    end: end,
  );
}

LatLng? latLngFromString(String? latLngStr) {
  final pieces = latLngStr?.split(',');
  if (pieces == null || pieces.length != 2) {
    return null;
  }
  return LatLng(
    double.parse(pieces.first.trim()),
    double.parse(pieces.last.trim()),
  );
}

FFPlace placeFromString(String placeStr) {
  final serializedData = jsonDecode(placeStr) as Map<String, dynamic>;
  final data = {
    'latLng': serializedData.containsKey('latLng')
        ? latLngFromString(serializedData['latLng'] as String)
        : const LatLng(0.0, 0.0),
    'name': serializedData['name'] ?? '',
    'address': serializedData['address'] ?? '',
    'city': serializedData['city'] ?? '',
    'state': serializedData['state'] ?? '',
    'country': serializedData['country'] ?? '',
    'zipCode': serializedData['zipCode'] ?? '',
  };
  return FFPlace(
    latLng: data['latLng'] as LatLng,
    name: data['name'] as String,
    address: data['address'] as String,
    city: data['city'] as String,
    state: data['state'] as String,
    country: data['country'] as String,
    zipCode: data['zipCode'] as String,
  );
}

FFUploadedFile uploadedFileFromString(String uploadedFileStr) =>
    FFUploadedFile.deserialize(uploadedFileStr);

enum ParamType {
  int,
  double,
  String,
  bool,
  DateTime,
  DateTimeRange,
  LatLng,
  Color,
  FFPlace,
  FFUploadedFile,
  JSON,

  DataStruct,
  SupabaseRow,
}

dynamic deserializeParam<T>(
  String? param,
  ParamType paramType,
  bool isList, {
  StructBuilder<T>? structBuilder,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final paramValues = json.decode(param);
      if (paramValues is! Iterable || paramValues.isEmpty) {
        return null;
      }
      return paramValues
          .where((p) => p is String)
          .map((p) => p as String)
          .map((p) => deserializeParam<T>(
                p,
                paramType,
                false,
                structBuilder: structBuilder,
              ))
          .where((p) => p != null)
          .map((p) => p! as T)
          .toList();
    }
    switch (paramType) {
      case ParamType.int:
        return int.tryParse(param);
      case ParamType.double:
        return double.tryParse(param);
      case ParamType.String:
        return param;
      case ParamType.bool:
        return param == 'true';
      case ParamType.DateTime:
        return dateTimeFromString(param);
      case ParamType.DateTimeRange:
        return dateTimeRangeFromString(param);
      case ParamType.LatLng:
        return latLngFromString(param);
      case ParamType.Color:
        return fromCssColor(param);
      case ParamType.FFPlace:
        return placeFromString(param);
      case ParamType.FFUploadedFile:
        return uploadedFileFromString(param);
      case ParamType.JSON:
        return json.decode(param);

      case ParamType.SupabaseRow:
        final data = json.decode(param) as Map<String, dynamic>;
        switch (T) {
          case BackupMarvelEssenciaisIssuesRow:
            return BackupMarvelEssenciaisIssuesRow(data);
          case BackupMarvelEssenciaisListItemsRow:
            return BackupMarvelEssenciaisListItemsRow(data);
          case BackupMarvelEssenciaisStoryInIssueRow:
            return BackupMarvelEssenciaisStoryInIssueRow(data);
          case BackupMarvelEssenciaisTitleClustersRow:
            return BackupMarvelEssenciaisTitleClustersRow(data);
          case BackupMarvelEssenciaisTitlesRow:
            return BackupMarvelEssenciaisTitlesRow(data);
          case BackupMarvelEssenciaisUserStatusRow:
            return BackupMarvelEssenciaisUserStatusRow(data);
          case BackupMarvelEssenciaisVariantsRow:
            return BackupMarvelEssenciaisVariantsRow(data);
          case AppCreatorStoriesRow:
            return AppCreatorStoriesRow(data);
          case AppDiscoverFeedRow:
            return AppDiscoverFeedRow(data);
          case AppFeaturedListThumbsRow:
            return AppFeaturedListThumbsRow(data);
          case AppFeaturedListsRow:
            return AppFeaturedListsRow(data);
          case AppIssueDetailRow:
            return AppIssueDetailRow(data);
          case AppIssueStoriesRow:
            return AppIssueStoriesRow(data);
          case AppIssueWithCoverRow:
            return AppIssueWithCoverRow(data);
          case AppIssueWithUserStatusRow:
            return AppIssueWithUserStatusRow(data);
          case AppLabeledListsRow:
            return AppLabeledListsRow(data);
          case AppLibraryCountsRow:
            return AppLibraryCountsRow(data);
          case AppLibraryOwnedRow:
            return AppLibraryOwnedRow(data);
          case AppLibraryReadRow:
            return AppLibraryReadRow(data);
          case AppLibraryStatusReadingRow:
            return AppLibraryStatusReadingRow(data);
          case AppLibraryTitlesRow:
            return AppLibraryTitlesRow(data);
          case AppLibraryUnreadRow:
            return AppLibraryUnreadRow(data);
          case AppLibraryWantToReadRow:
            return AppLibraryWantToReadRow(data);
          case AppLibraryWantedRow:
            return AppLibraryWantedRow(data);
          case AppListDetailRow:
            return AppListDetailRow(data);
          case AppListItemWithCoverRow:
            return AppListItemWithCoverRow(data);
          case AppListItemsRow:
            return AppListItemsRow(data);
          case AppPublicListsRow:
            return AppPublicListsRow(data);
          case AppReadingSuggestionsRow:
            return AppReadingSuggestionsRow(data);
          case AppReadingSuggestionsCountRow:
            return AppReadingSuggestionsCountRow(data);
          case AppRecentReleasesRow:
            return AppRecentReleasesRow(data);
          case AppReleasesFullRow:
            return AppReleasesFullRow(data);
          case AppReleasesPublishersRow:
            return AppReleasesPublishersRow(data);
          case AppStoryCreditsRow:
            return AppStoryCreditsRow(data);
          case AppTitleCardRow:
            return AppTitleCardRow(data);
          case AppTitleDetailRow:
            return AppTitleDetailRow(data);
          case AppTitleIssueCountsRow:
            return AppTitleIssueCountsRow(data);
          case AppUserCustomListsRow:
            return AppUserCustomListsRow(data);
          case ClustersRow:
            return ClustersRow(data);
          case CreatorsRow:
            return CreatorsRow(data);
          case EditLogsRow:
            return EditLogsRow(data);
          case EmptyTitlesRow:
            return EmptyTitlesRow(data);
          case GenresRow:
            return GenresRow(data);
          case IssueVariantsRow:
            return IssueVariantsRow(data);
          case IssuesRow:
            return IssuesRow(data);
          case IssuesUnparsedRow:
            return IssuesUnparsedRow(data);
          case IssuesWithoutCoverRow:
            return IssuesWithoutCoverRow(data);
          case LicensorsRow:
            return LicensorsRow(data);
          case LicensorsDismissedRow:
            return LicensorsDismissedRow(data);
          case ListFollowersRow:
            return ListFollowersRow(data);
          case ListItemsRow:
            return ListItemsRow(data);
          case ListLabelAssignmentsRow:
            return ListLabelAssignmentsRow(data);
          case ListLabelsRow:
            return ListLabelsRow(data);
          case ListsRow:
            return ListsRow(data);
          case MergeCandidatesRow:
            return MergeCandidatesRow(data);
          case MultiIssueMismatchesRow:
            return MultiIssueMismatchesRow(data);
          case OrphanIssuesRow:
            return OrphanIssuesRow(data);
          case OrphanVariantsRow:
            return OrphanVariantsRow(data);
          case PublicProfilesRow:
            return PublicProfilesRow(data);
          case PublishersRow:
            return PublishersRow(data);
          case RecentReleasesCacheRow:
            return RecentReleasesCacheRow(data);
          case RolesRow:
            return RolesRow(data);
          case ScrapeQueueRow:
            return ScrapeQueueRow(data);
          case ScrapeRunsRow:
            return ScrapeRunsRow(data);
          case SingleIssueMismatchesRow:
            return SingleIssueMismatchesRow(data);
          case StoriesRow:
            return StoriesRow(data);
          case StoryCreatorsRow:
            return StoryCreatorsRow(data);
          case StoryInIssueRow:
            return StoryInIssueRow(data);
          case TitleClustersRow:
            return TitleClustersRow(data);
          case TitleLicensorsRow:
            return TitleLicensorsRow(data);
          case TitleRedirectsRow:
            return TitleRedirectsRow(data);
          case TitleStatusesRow:
            return TitleStatusesRow(data);
          case TitlesRow:
            return TitlesRow(data);
          case TitlesCatalogRow:
            return TitlesCatalogRow(data);
          case TitlesUnverifiedLicensorsRow:
            return TitlesUnverifiedLicensorsRow(data);
          case TitlesVRow:
            return TitlesVRow(data);
          case TypesRow:
            return TypesRow(data);
          case UniversesRow:
            return UniversesRow(data);
          case UserIssueStatusRow:
            return UserIssueStatusRow(data);
          case UserTitleStatusRow:
            return UserTitleStatusRow(data);
          case UsersRow:
            return UsersRow(data);
          case VLatestScrapeRow:
            return VLatestScrapeRow(data);
          default:
            return null;
        }

      case ParamType.DataStruct:
        final data = json.decode(param) as Map<String, dynamic>? ?? {};
        return structBuilder != null ? structBuilder(data) : null;

      default:
        return null;
    }
  } catch (e) {
    print('Error deserializing parameter: $e');
    return null;
  }
}
