import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _searchHistory =
          prefs.getStringList('ff_searchHistory') ?? _searchHistory;
    });
    _safeInit(() {
      _MyListsGridView =
          prefs.getBool('ff_MyListsGridView') ?? _MyListsGridView;
    });
    _safeInit(() {
      _listSortCriterion =
          prefs.getString('ff_listSortCriterion') ?? _listSortCriterion;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _needsLibraryRefresh = false;
  bool get needsLibraryRefresh => _needsLibraryRefresh;
  set needsLibraryRefresh(bool value) {
    _needsLibraryRefresh = value;
  }

  bool _isAdminUser = false;
  bool get isAdminUser => _isAdminUser;
  set isAdminUser(bool value) {
    _isAdminUser = value;
  }

  bool _isGridView = true;
  bool get isGridView => _isGridView;
  set isGridView(bool value) {
    _isGridView = value;
  }

  List<String> _searchHistory = [];
  List<String> get searchHistory => _searchHistory;
  set searchHistory(List<String> value) {
    _searchHistory = value;
    prefs.setStringList('ff_searchHistory', value);
  }

  void addToSearchHistory(String value) {
    searchHistory.add(value);
    prefs.setStringList('ff_searchHistory', _searchHistory);
  }

  void removeFromSearchHistory(String value) {
    searchHistory.remove(value);
    prefs.setStringList('ff_searchHistory', _searchHistory);
  }

  void removeAtIndexFromSearchHistory(int index) {
    searchHistory.removeAt(index);
    prefs.setStringList('ff_searchHistory', _searchHistory);
  }

  void updateSearchHistoryAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchHistory[index] = updateFn(_searchHistory[index]);
    prefs.setStringList('ff_searchHistory', _searchHistory);
  }

  void insertAtIndexInSearchHistory(int index, String value) {
    searchHistory.insert(index, value);
    prefs.setStringList('ff_searchHistory', _searchHistory);
  }

  List<SearchResultItemStruct> _searchResults = [];
  List<SearchResultItemStruct> get searchResults => _searchResults;
  set searchResults(List<SearchResultItemStruct> value) {
    _searchResults = value;
  }

  void addToSearchResults(SearchResultItemStruct value) {
    searchResults.add(value);
  }

  void removeFromSearchResults(SearchResultItemStruct value) {
    searchResults.remove(value);
  }

  void removeAtIndexFromSearchResults(int index) {
    searchResults.removeAt(index);
  }

  void updateSearchResultsAtIndex(
    int index,
    SearchResultItemStruct Function(SearchResultItemStruct) updateFn,
  ) {
    searchResults[index] = updateFn(_searchResults[index]);
  }

  void insertAtIndexInSearchResults(int index, SearchResultItemStruct value) {
    searchResults.insert(index, value);
  }

  bool _searchIsLoading = false;
  bool get searchIsLoading => _searchIsLoading;
  set searchIsLoading(bool value) {
    _searchIsLoading = value;
  }

  int _searchOffset = 0;
  int get searchOffset => _searchOffset;
  set searchOffset(int value) {
    _searchOffset = value;
  }

  List<AutocompleteItemStruct> _autocompleteResults = [];
  List<AutocompleteItemStruct> get autocompleteResults => _autocompleteResults;
  set autocompleteResults(List<AutocompleteItemStruct> value) {
    _autocompleteResults = value;
  }

  void addToAutocompleteResults(AutocompleteItemStruct value) {
    autocompleteResults.add(value);
  }

  void removeFromAutocompleteResults(AutocompleteItemStruct value) {
    autocompleteResults.remove(value);
  }

  void removeAtIndexFromAutocompleteResults(int index) {
    autocompleteResults.removeAt(index);
  }

  void updateAutocompleteResultsAtIndex(
    int index,
    AutocompleteItemStruct Function(AutocompleteItemStruct) updateFn,
  ) {
    autocompleteResults[index] = updateFn(_autocompleteResults[index]);
  }

  void insertAtIndexInAutocompleteResults(
      int index, AutocompleteItemStruct value) {
    autocompleteResults.insert(index, value);
  }

  bool _autocompleteVisible = false;
  bool get autocompleteVisible => _autocompleteVisible;
  set autocompleteVisible(bool value) {
    _autocompleteVisible = value;
  }

  bool _isSelectionMode = false;
  bool get isSelectionMode => _isSelectionMode;
  set isSelectionMode(bool value) {
    _isSelectionMode = value;
  }

  List<String> _selectedIds = [];
  List<String> get selectedIds => _selectedIds;
  set selectedIds(List<String> value) {
    _selectedIds = value;
  }

  void addToSelectedIds(String value) {
    selectedIds.add(value);
  }

  void removeFromSelectedIds(String value) {
    selectedIds.remove(value);
  }

  void removeAtIndexFromSelectedIds(int index) {
    selectedIds.removeAt(index);
  }

  void updateSelectedIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedIds[index] = updateFn(_selectedIds[index]);
  }

  void insertAtIndexInSelectedIds(int index, String value) {
    selectedIds.insert(index, value);
  }

  List<LibraryTitleItemStruct> _libraryTitles = [];
  List<LibraryTitleItemStruct> get libraryTitles => _libraryTitles;
  set libraryTitles(List<LibraryTitleItemStruct> value) {
    _libraryTitles = value;
  }

  void addToLibraryTitles(LibraryTitleItemStruct value) {
    libraryTitles.add(value);
  }

  void removeFromLibraryTitles(LibraryTitleItemStruct value) {
    libraryTitles.remove(value);
  }

  void removeAtIndexFromLibraryTitles(int index) {
    libraryTitles.removeAt(index);
  }

  void updateLibraryTitlesAtIndex(
    int index,
    LibraryTitleItemStruct Function(LibraryTitleItemStruct) updateFn,
  ) {
    libraryTitles[index] = updateFn(_libraryTitles[index]);
  }

  void insertAtIndexInLibraryTitles(int index, LibraryTitleItemStruct value) {
    libraryTitles.insert(index, value);
  }

  List<String> _libraryActiveFilters = [];
  List<String> get libraryActiveFilters => _libraryActiveFilters;
  set libraryActiveFilters(List<String> value) {
    _libraryActiveFilters = value;
  }

  void addToLibraryActiveFilters(String value) {
    libraryActiveFilters.add(value);
  }

  void removeFromLibraryActiveFilters(String value) {
    libraryActiveFilters.remove(value);
  }

  void removeAtIndexFromLibraryActiveFilters(int index) {
    libraryActiveFilters.removeAt(index);
  }

  void updateLibraryActiveFiltersAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    libraryActiveFilters[index] = updateFn(_libraryActiveFilters[index]);
  }

  void insertAtIndexInLibraryActiveFilters(int index, String value) {
    libraryActiveFilters.insert(index, value);
  }

  int _libraryOffset = 0;
  int get libraryOffset => _libraryOffset;
  set libraryOffset(int value) {
    _libraryOffset = value;
  }

  bool _libraryHasMore = false;
  bool get libraryHasMore => _libraryHasMore;
  set libraryHasMore(bool value) {
    _libraryHasMore = value;
  }

  bool _MyListsGridView = true;
  bool get MyListsGridView => _MyListsGridView;
  set MyListsGridView(bool value) {
    _MyListsGridView = value;
    prefs.setBool('ff_MyListsGridView', value);
  }

  bool _hasReadingIssues = false;
  bool get hasReadingIssues => _hasReadingIssues;
  set hasReadingIssues(bool value) {
    _hasReadingIssues = value;
  }

  bool _adultContentEnabled = false;
  bool get adultContentEnabled => _adultContentEnabled;
  set adultContentEnabled(bool value) {
    _adultContentEnabled = value;
  }

  String _currentUserBirthDateString = '';
  String get currentUserBirthDateString => _currentUserBirthDateString;
  set currentUserBirthDateString(String value) {
    _currentUserBirthDateString = value;
  }

  String _libraryActiveChip = 'owned';
  String get libraryActiveChip => _libraryActiveChip;
  set libraryActiveChip(String value) {
    _libraryActiveChip = value;
  }

  List<LibraryTitleItemStruct> _filteredLibraryTitles = [];
  List<LibraryTitleItemStruct> get filteredLibraryTitles =>
      _filteredLibraryTitles;
  set filteredLibraryTitles(List<LibraryTitleItemStruct> value) {
    _filteredLibraryTitles = value;
  }

  void addToFilteredLibraryTitles(LibraryTitleItemStruct value) {
    filteredLibraryTitles.add(value);
  }

  void removeFromFilteredLibraryTitles(LibraryTitleItemStruct value) {
    filteredLibraryTitles.remove(value);
  }

  void removeAtIndexFromFilteredLibraryTitles(int index) {
    filteredLibraryTitles.removeAt(index);
  }

  void updateFilteredLibraryTitlesAtIndex(
    int index,
    LibraryTitleItemStruct Function(LibraryTitleItemStruct) updateFn,
  ) {
    filteredLibraryTitles[index] = updateFn(_filteredLibraryTitles[index]);
  }

  void insertAtIndexInFilteredLibraryTitles(
      int index, LibraryTitleItemStruct value) {
    filteredLibraryTitles.insert(index, value);
  }

  String _newlyCreatedListId = '';
  String get newlyCreatedListId => _newlyCreatedListId;
  set newlyCreatedListId(String value) {
    _newlyCreatedListId = value;
  }

  bool _searchHasMore = true;
  bool get searchHasMore => _searchHasMore;
  set searchHasMore(bool value) {
    _searchHasMore = value;
  }

  List<dynamic> _discoverBrands = [];
  List<dynamic> get discoverBrands => _discoverBrands;
  set discoverBrands(List<dynamic> value) {
    _discoverBrands = value;
  }

  void addToDiscoverBrands(dynamic value) {
    discoverBrands.add(value);
  }

  void removeFromDiscoverBrands(dynamic value) {
    discoverBrands.remove(value);
  }

  void removeAtIndexFromDiscoverBrands(int index) {
    discoverBrands.removeAt(index);
  }

  void updateDiscoverBrandsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    discoverBrands[index] = updateFn(_discoverBrands[index]);
  }

  void insertAtIndexInDiscoverBrands(int index, dynamic value) {
    discoverBrands.insert(index, value);
  }

  List<dynamic> _allBrands = [];
  List<dynamic> get allBrands => _allBrands;
  set allBrands(List<dynamic> value) {
    _allBrands = value;
  }

  void addToAllBrands(dynamic value) {
    allBrands.add(value);
  }

  void removeFromAllBrands(dynamic value) {
    allBrands.remove(value);
  }

  void removeAtIndexFromAllBrands(int index) {
    allBrands.removeAt(index);
  }

  void updateAllBrandsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    allBrands[index] = updateFn(_allBrands[index]);
  }

  void insertAtIndexInAllBrands(int index, dynamic value) {
    allBrands.insert(index, value);
  }

  int _allBrandsOffset = 0;
  int get allBrandsOffset => _allBrandsOffset;
  set allBrandsOffset(int value) {
    _allBrandsOffset = value;
  }

  bool _allBrandsHasMore = false;
  bool get allBrandsHasMore => _allBrandsHasMore;
  set allBrandsHasMore(bool value) {
    _allBrandsHasMore = value;
  }

  bool _profileIsLoading = false;
  bool get profileIsLoading => _profileIsLoading;
  set profileIsLoading(bool value) {
    _profileIsLoading = value;
  }

  int _profileOffset = 0;
  int get profileOffset => _profileOffset;
  set profileOffset(int value) {
    _profileOffset = value;
  }

  bool _profileHasMore = false;
  bool get profileHasMore => _profileHasMore;
  set profileHasMore(bool value) {
    _profileHasMore = value;
  }

  List<ProfileItemStruct> _profileItems = [];
  List<ProfileItemStruct> get profileItems => _profileItems;
  set profileItems(List<ProfileItemStruct> value) {
    _profileItems = value;
  }

  void addToProfileItems(ProfileItemStruct value) {
    profileItems.add(value);
  }

  void removeFromProfileItems(ProfileItemStruct value) {
    profileItems.remove(value);
  }

  void removeAtIndexFromProfileItems(int index) {
    profileItems.removeAt(index);
  }

  void updateProfileItemsAtIndex(
    int index,
    ProfileItemStruct Function(ProfileItemStruct) updateFn,
  ) {
    profileItems[index] = updateFn(_profileItems[index]);
  }

  void insertAtIndexInProfileItems(int index, ProfileItemStruct value) {
    profileItems.insert(index, value);
  }

  /// Search query for LibraryPage V4.
  ///
  /// Persists across tab switches.
  String _librarySearchQuery = '';
  String get librarySearchQuery => _librarySearchQuery;
  set librarySearchQuery(String value) {
    _librarySearchQuery = value;
  }

  /// Monotonic counter for debouncedSearch to discard stale fetches.
  int _searchSequence = 0;
  int get searchSequence => _searchSequence;
  set searchSequence(int value) {
    _searchSequence = value;
  }

  List<ListEditItemStruct> _listEditBuffer = [];
  List<ListEditItemStruct> get listEditBuffer => _listEditBuffer;
  set listEditBuffer(List<ListEditItemStruct> value) {
    _listEditBuffer = value;
  }

  void addToListEditBuffer(ListEditItemStruct value) {
    listEditBuffer.add(value);
  }

  void removeFromListEditBuffer(ListEditItemStruct value) {
    listEditBuffer.remove(value);
  }

  void removeAtIndexFromListEditBuffer(int index) {
    listEditBuffer.removeAt(index);
  }

  void updateListEditBufferAtIndex(
    int index,
    ListEditItemStruct Function(ListEditItemStruct) updateFn,
  ) {
    listEditBuffer[index] = updateFn(_listEditBuffer[index]);
  }

  void insertAtIndexInListEditBuffer(int index, ListEditItemStruct value) {
    listEditBuffer.insert(index, value);
  }

  List<UserListItemStruct> _userListsBuffer = [];
  List<UserListItemStruct> get userListsBuffer => _userListsBuffer;
  set userListsBuffer(List<UserListItemStruct> value) {
    _userListsBuffer = value;
  }

  void addToUserListsBuffer(UserListItemStruct value) {
    userListsBuffer.add(value);
  }

  void removeFromUserListsBuffer(UserListItemStruct value) {
    userListsBuffer.remove(value);
  }

  void removeAtIndexFromUserListsBuffer(int index) {
    userListsBuffer.removeAt(index);
  }

  void updateUserListsBufferAtIndex(
    int index,
    UserListItemStruct Function(UserListItemStruct) updateFn,
  ) {
    userListsBuffer[index] = updateFn(_userListsBuffer[index]);
  }

  void insertAtIndexInUserListsBuffer(int index, UserListItemStruct value) {
    userListsBuffer.insert(index, value);
  }

  String _listSortCriterion = 'recents';
  String get listSortCriterion => _listSortCriterion;
  set listSortCriterion(String value) {
    _listSortCriterion = value;
    prefs.setString('ff_listSortCriterion', value);
  }

  final _libraryOwnedManager = FutureRequestManager<List<AppLibraryOwnedRow>>();
  Future<List<AppLibraryOwnedRow>> libraryOwned({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppLibraryOwnedRow>> Function() requestFn,
  }) =>
      _libraryOwnedManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLibraryOwnedCache() => _libraryOwnedManager.clear();
  void clearLibraryOwnedCacheKey(String? uniqueKey) =>
      _libraryOwnedManager.clearRequest(uniqueKey);

  final _itemCountManager = FutureRequestManager<List<AppLibraryCountsRow>>();
  Future<List<AppLibraryCountsRow>> itemCount({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppLibraryCountsRow>> Function() requestFn,
  }) =>
      _itemCountManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearItemCountCache() => _itemCountManager.clear();
  void clearItemCountCacheKey(String? uniqueKey) =>
      _itemCountManager.clearRequest(uniqueKey);

  final _releasesPublishersManager =
      FutureRequestManager<List<AppReleasesPublishersRow>>();
  Future<List<AppReleasesPublishersRow>> releasesPublishers({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppReleasesPublishersRow>> Function() requestFn,
  }) =>
      _releasesPublishersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearReleasesPublishersCache() => _releasesPublishersManager.clear();
  void clearReleasesPublishersCacheKey(String? uniqueKey) =>
      _releasesPublishersManager.clearRequest(uniqueKey);

  final _cacheStatusReadManager =
      FutureRequestManager<List<AppLibraryReadRow>>();
  Future<List<AppLibraryReadRow>> cacheStatusRead({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppLibraryReadRow>> Function() requestFn,
  }) =>
      _cacheStatusReadManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCacheStatusReadCache() => _cacheStatusReadManager.clear();
  void clearCacheStatusReadCacheKey(String? uniqueKey) =>
      _cacheStatusReadManager.clearRequest(uniqueKey);

  final _cacheStatusOwnedManager =
      FutureRequestManager<List<AppLibraryOwnedRow>>();
  Future<List<AppLibraryOwnedRow>> cacheStatusOwned({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppLibraryOwnedRow>> Function() requestFn,
  }) =>
      _cacheStatusOwnedManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCacheStatusOwnedCache() => _cacheStatusOwnedManager.clear();
  void clearCacheStatusOwnedCacheKey(String? uniqueKey) =>
      _cacheStatusOwnedManager.clearRequest(uniqueKey);

  final _suggestionsCacheManager =
      FutureRequestManager<List<AppReadingSuggestionsRow>>();
  Future<List<AppReadingSuggestionsRow>> suggestionsCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppReadingSuggestionsRow>> Function() requestFn,
  }) =>
      _suggestionsCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSuggestionsCacheCache() => _suggestionsCacheManager.clear();
  void clearSuggestionsCacheCacheKey(String? uniqueKey) =>
      _suggestionsCacheManager.clearRequest(uniqueKey);

  final _unreadCountManager =
      FutureRequestManager<List<AppReadingSuggestionsCountRow>>();
  Future<List<AppReadingSuggestionsCountRow>> unreadCount({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppReadingSuggestionsCountRow>> Function() requestFn,
  }) =>
      _unreadCountManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUnreadCountCache() => _unreadCountManager.clear();
  void clearUnreadCountCacheKey(String? uniqueKey) =>
      _unreadCountManager.clearRequest(uniqueKey);

  final _cacheStatusUnreadManager =
      FutureRequestManager<List<AppLibraryUnreadRow>>();
  Future<List<AppLibraryUnreadRow>> cacheStatusUnread({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppLibraryUnreadRow>> Function() requestFn,
  }) =>
      _cacheStatusUnreadManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCacheStatusUnreadCache() => _cacheStatusUnreadManager.clear();
  void clearCacheStatusUnreadCacheKey(String? uniqueKey) =>
      _cacheStatusUnreadManager.clearRequest(uniqueKey);

  final _releasesPublishersUpcomingManager =
      FutureRequestManager<List<AppReleasesPublishersUpcomingRow>>();
  Future<List<AppReleasesPublishersUpcomingRow>> releasesPublishersUpcoming({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppReleasesPublishersUpcomingRow>> Function()
        requestFn,
  }) =>
      _releasesPublishersUpcomingManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearReleasesPublishersUpcomingCache() =>
      _releasesPublishersUpcomingManager.clear();
  void clearReleasesPublishersUpcomingCacheKey(String? uniqueKey) =>
      _releasesPublishersUpcomingManager.clearRequest(uniqueKey);

  final _cacheWantedReadManager =
      FutureRequestManager<List<AppLibraryWantedRow>>();
  Future<List<AppLibraryWantedRow>> cacheWantedRead({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppLibraryWantedRow>> Function() requestFn,
  }) =>
      _cacheWantedReadManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCacheWantedReadCache() => _cacheWantedReadManager.clear();
  void clearCacheWantedReadCacheKey(String? uniqueKey) =>
      _cacheWantedReadManager.clearRequest(uniqueKey);

  final _recentReleasesCache2Manager =
      FutureRequestManager<List<RecentReleasesCacheRow>>();
  Future<List<RecentReleasesCacheRow>> recentReleasesCache2({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<RecentReleasesCacheRow>> Function() requestFn,
  }) =>
      _recentReleasesCache2Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRecentReleasesCache2Cache() => _recentReleasesCache2Manager.clear();
  void clearRecentReleasesCache2CacheKey(String? uniqueKey) =>
      _recentReleasesCache2Manager.clearRequest(uniqueKey);

  final _readingIssuesCacheManager =
      FutureRequestManager<List<AppIssueWithUserStatusRow>>();
  Future<List<AppIssueWithUserStatusRow>> readingIssuesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppIssueWithUserStatusRow>> Function() requestFn,
  }) =>
      _readingIssuesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearReadingIssuesCacheCache() => _readingIssuesCacheManager.clear();
  void clearReadingIssuesCacheCacheKey(String? uniqueKey) =>
      _readingIssuesCacheManager.clearRequest(uniqueKey);

  final _listsGenreCacheManager =
      FutureRequestManager<List<AppDiscoverFeedRow>>();
  Future<List<AppDiscoverFeedRow>> listsGenreCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppDiscoverFeedRow>> Function() requestFn,
  }) =>
      _listsGenreCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearListsGenreCacheCache() => _listsGenreCacheManager.clear();
  void clearListsGenreCacheCacheKey(String? uniqueKey) =>
      _listsGenreCacheManager.clearRequest(uniqueKey);

  final _listAuthorsCacheManager =
      FutureRequestManager<List<AppDiscoverFeedRow>>();
  Future<List<AppDiscoverFeedRow>> listAuthorsCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppDiscoverFeedRow>> Function() requestFn,
  }) =>
      _listAuthorsCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearListAuthorsCacheCache() => _listAuthorsCacheManager.clear();
  void clearListAuthorsCacheCacheKey(String? uniqueKey) =>
      _listAuthorsCacheManager.clearRequest(uniqueKey);

  final _listHeroesCacheManager =
      FutureRequestManager<List<AppDiscoverFeedRow>>();
  Future<List<AppDiscoverFeedRow>> listHeroesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppDiscoverFeedRow>> Function() requestFn,
  }) =>
      _listHeroesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearListHeroesCacheCache() => _listHeroesCacheManager.clear();
  void clearListHeroesCacheCacheKey(String? uniqueKey) =>
      _listHeroesCacheManager.clearRequest(uniqueKey);

  final _listIntroCacheManager =
      FutureRequestManager<List<AppDiscoverFeedRow>>();
  Future<List<AppDiscoverFeedRow>> listIntroCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppDiscoverFeedRow>> Function() requestFn,
  }) =>
      _listIntroCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearListIntroCacheCache() => _listIntroCacheManager.clear();
  void clearListIntroCacheCacheKey(String? uniqueKey) =>
      _listIntroCacheManager.clearRequest(uniqueKey);

  final _cacheStatusReadingV2Manager =
      FutureRequestManager<List<AppLibraryStatusReadingRow>>();
  Future<List<AppLibraryStatusReadingRow>> cacheStatusReadingV2({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppLibraryStatusReadingRow>> Function() requestFn,
  }) =>
      _cacheStatusReadingV2Manager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCacheStatusReadingV2Cache() => _cacheStatusReadingV2Manager.clear();
  void clearCacheStatusReadingV2CacheKey(String? uniqueKey) =>
      _cacheStatusReadingV2Manager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
