@startuml



set namespaceSeparator ::

class "jumpets_app::ui::profile_page::profile_body.dart::ProfileBody" {
  +dynamic user
  +Widget build()
  -Widget _adsBody()
  -Widget _reviewsBody()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::profile_page::profile_body.dart::ProfileBody"

class "jumpets_app::ui::profile_page::profile_body.dart::_SearchSection" {
  +dynamic row
  +dynamic title
  +dynamic isLoading
  +dynamic boxHeight
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::profile_page::profile_body.dart::_SearchSection"

class "jumpets_app::ui::profile_page::profile_page.dart::ProfilePage" {
  +User user
  +_ProfilePageState createState()
}

"jumpets_app::ui::profile_page::profile_page.dart::ProfilePage" o-- "jumpets_app::models::users::user.dart::User"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::profile_page::profile_page.dart::ProfilePage"

class "jumpets_app::ui::profile_page::profile_page.dart::_ProfilePageState" {
  +User user
  +dynamic hasWeb
  +void initState()
  +Widget build()
  -Widget _build()
}

"jumpets_app::ui::profile_page::profile_page.dart::_ProfilePageState" o-- "jumpets_app::models::users::user.dart::User"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::profile_page::profile_page.dart::_ProfilePageState"

class "jumpets_app::ui::helper.dart::Helper" {
  {static} +void showFilterBottomSheet()
  {static} +void showCameraOptions()
  {static} +void showLoginBottomSheet()
  {static} +void showSocialMediaBottomSheet()
  {static} +Color getUserColorByType()
  {static} +dynamic getGenderColor()
  {static} +dynamic getAnimalTypeFromCategory()
  {static} +dynamic getFiltersStringFromEvent()
}

class "jumpets_app::ui::home_page::page_view.dart::HomePageView" {
  +PageController pageController
  +ScrollController scrollController
  +Widget build()
}

"jumpets_app::ui::home_page::page_view.dart::HomePageView" o-- "flutter::src::widgets::page_view.dart::PageController"
"jumpets_app::ui::home_page::page_view.dart::HomePageView" o-- "flutter::src::widgets::scroll_controller.dart::ScrollController"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::home_page::page_view.dart::HomePageView"

class "jumpets_app::ui::home_page::home_page.dart::HomePage" {
  +_HomePageState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::home_page::home_page.dart::HomePage"

class "jumpets_app::ui::home_page::home_page.dart::_HomePageState" {
  -PageController _pageController
  -ScrollController _scrollController
  -double _scrollThreshold
  -int _pageIndex
  -Widget _getAppBarHeader
  +void initState()
  -void _onScroll()
  +void dispose()
  +Widget build()
  -Widget _title()
}

"jumpets_app::ui::home_page::home_page.dart::_HomePageState" o-- "flutter::src::widgets::page_view.dart::PageController"
"jumpets_app::ui::home_page::home_page.dart::_HomePageState" o-- "flutter::src::widgets::scroll_controller.dart::ScrollController"
"jumpets_app::ui::home_page::home_page.dart::_HomePageState" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::home_page::home_page.dart::_HomePageState"

class "jumpets_app::ui::home_page::pages::main_page.dart::MainPage" {
  +ScrollController scrollController
  +_MainPageState createState()
}

"jumpets_app::ui::home_page::pages::main_page.dart::MainPage" o-- "flutter::src::widgets::scroll_controller.dart::ScrollController"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::home_page::pages::main_page.dart::MainPage"

class "jumpets_app::ui::home_page::pages::main_page.dart::_MainPageState" {
  -Completer<void> _refreshCompleter
  +void initState()
  +Widget build()
  -Widget _title()
  -Widget _wrapperOfContent()
  -Widget _contentOfCategory()
}

"jumpets_app::ui::home_page::pages::main_page.dart::_MainPageState" o-- "dart::async::Completer<void>"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::home_page::pages::main_page.dart::_MainPageState"

class "jumpets_app::ui::home_page::pages::rooms_page.dart::RoomsPage" {
  +_RoomsPageState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::home_page::pages::rooms_page.dart::RoomsPage"

class "jumpets_app::ui::home_page::pages::rooms_page.dart::_RoomsPageState" {
  +RoomsBloc roomsBloc
  +void initState()
  +Widget build()
  +dynamic otherUser()
}

"jumpets_app::ui::home_page::pages::rooms_page.dart::_RoomsPageState" o-- "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsBloc"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::home_page::pages::rooms_page.dart::_RoomsPageState"

class "jumpets_app::ui::home_page::pages::favourites_page.dart::FavouritesPage" {
  +_FavouritesPageState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::home_page::pages::favourites_page.dart::FavouritesPage"

class "jumpets_app::ui::home_page::pages::favourites_page.dart::_FavouritesPageState" {
  +FavouritesBloc favBloc
  +void initState()
  +Widget build()
}

"jumpets_app::ui::home_page::pages::favourites_page.dart::_FavouritesPageState" o-- "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesBloc"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::home_page::pages::favourites_page.dart::_FavouritesPageState"

class "jumpets_app::ui::filters_page::filters_page.dart::FiltersPage" {
  +ScrollController scrollController
  +Category category
  +dynamic text
  +dynamic deliveryInfo
  +ActivityLevel activityLevel
  +DogSize size
  +dynamic male
  +_FiltersPageState createState()
}

"jumpets_app::ui::filters_page::filters_page.dart::FiltersPage" o-- "flutter::src::widgets::scroll_controller.dart::ScrollController"
"jumpets_app::ui::filters_page::filters_page.dart::FiltersPage" o-- "jumpets_app::models::enums::categories.dart::Category"
"jumpets_app::ui::filters_page::filters_page.dart::FiltersPage" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::ui::filters_page::filters_page.dart::FiltersPage" o-- "jumpets_app::models::enums::dog_size.dart::DogSize"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::filters_page::filters_page.dart::FiltersPage"

class "jumpets_app::ui::filters_page::filters_page.dart::_FiltersPageState" {
  +FiltersModel model
  -TextEditingController _textController
  +FocusNode focusNode
  +void initState()
  +void dispose()
  +Widget build()
  -Widget _header()
  -Widget _categoryRow()
  -Widget _sexRow()
  -Widget _sizeRow()
  -Widget _deliveryInfoRow()
  -Widget _activityLevelRow()
}

"jumpets_app::ui::filters_page::filters_page.dart::_FiltersPageState" o-- "jumpets_app::ui::filters_page::filters_page.dart::FiltersModel"
"jumpets_app::ui::filters_page::filters_page.dart::_FiltersPageState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"jumpets_app::ui::filters_page::filters_page.dart::_FiltersPageState" o-- "flutter::src::widgets::focus_manager.dart::FocusNode"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::filters_page::filters_page.dart::_FiltersPageState"

class "jumpets_app::ui::filters_page::filters_page.dart::FiltersModel" {
  +dynamic text
  +dynamic male
  +DogSize size
  +Category category
  +ActivityLevel activityLevel
  +dynamic deliveryStatuses
}

"jumpets_app::ui::filters_page::filters_page.dart::FiltersModel" o-- "jumpets_app::models::enums::dog_size.dart::DogSize"
"jumpets_app::ui::filters_page::filters_page.dart::FiltersModel" o-- "jumpets_app::models::enums::categories.dart::Category"
"jumpets_app::ui::filters_page::filters_page.dart::FiltersModel" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"

class "jumpets_app::ui::welcome::welcome.dart::WelcomePage" {
  +_WelcomePageState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::welcome::welcome.dart::WelcomePage"

class "jumpets_app::ui::welcome::welcome.dart::_WelcomePageState" {
  -ScrollController _scrollController
  +bool lastStatus
  +double height
  +double width
  +bool isShrink
  -dynamic _scrollListener()
  +void initState()
  +void dispose()
  +Widget build()
}

"jumpets_app::ui::welcome::welcome.dart::_WelcomePageState" o-- "flutter::src::widgets::scroll_controller.dart::ScrollController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::welcome::welcome.dart::_WelcomePageState"

class "jumpets_app::ui::app_theme.dart::AppTheme" {
  {static} +Color kPrimaryColor
  {static} +Color kSecondaryBackgroundColor
  {static} +Color kPrimaryColorDark
  {static} +Color kSecondaryBackgroundColorDark
  {static} +Color kerrorColor
  {static} +Color kAccentColor
  {static} +Color kAccentColorLight
  {static} +Color kSecondaryColor
  {static} +Color kThirdColor
  {static} +Color kFourthColor
  {static} +Color kFifthColor
  {static} +Color kSixthColor
  {static} +ThemeData getTheme()
  {static} -DialogTheme _getDialogTheme()
  {static} -ButtonThemeData _getButtonTheme()
  {static} -AppBarTheme _getAppBarTheme()
  {static} -IconThemeData _getIconTheme()
  {static} -TextTheme _getPrimaryTextTheme()
  {static} -SnackBarThemeData _getSnackBarTheme()
  {static} -TextTheme _getTextTheme()
}

"jumpets_app::ui::app_theme.dart::AppTheme" o-- "dart::ui::Color"

class "jumpets_app::ui::components::maps::google_map_shelters.dart::MapAddress" {
  +dynamic address
  +_MapAddressState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::maps::google_map_shelters.dart::MapAddress"

class "jumpets_app::ui::components::maps::google_map_shelters.dart::_MapAddressState" {
  -GoogleMapController _mapController
  -dynamic _mapStyle
  -dynamic _darkMapStyle
  +dynamic currentLocation
  +BitmapDescriptor pinLocationIcon
  +void initState()
  -dynamic _setMarker()
  +Future getBytesFromAsset()
  +void didUpdateWidget()
  +Widget build()
  -void _onThemeChanged()
  -void _onMapCreated()
  -dynamic _updateAddress()
  +Future getBytesFromCanvas()
}

"jumpets_app::ui::components::maps::google_map_shelters.dart::_MapAddressState" o-- "google_maps_flutter::google_maps_flutter.dart::GoogleMapController"
"jumpets_app::ui::components::maps::google_map_shelters.dart::_MapAddressState" o-- "google_maps_flutter_platform_interface::src::types::bitmap.dart::BitmapDescriptor"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::maps::google_map_shelters.dart::_MapAddressState"

class "jumpets_app::ui::components::searchbar::searchbar.dart::SearchBar" {
  +Function onClear
  +dynamic Function(dynamic) onChange
  +_SearchBarState createState()
}

"jumpets_app::ui::components::searchbar::searchbar.dart::SearchBar" o-- "jumpets_app::ui::components::searchbar::searchbar.dart::dynamic Function(dynamic)"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::searchbar::searchbar.dart::SearchBar"

class "jumpets_app::ui::components::searchbar::searchbar.dart::_SearchBarState" {
  -TextEditingController _textController
  +void initState()
  +Widget build()
  +dynamic text()
}

"jumpets_app::ui::components::searchbar::searchbar.dart::_SearchBarState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::searchbar::searchbar.dart::_SearchBarState"

class "jumpets_app::ui::components::tags.dart::Tag" {
  +dynamic tag
  +bool tapable
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::tags.dart::Tag"

class "jumpets_app::ui::components::tags.dart::InputTag" {
  +dynamic Function(dynamic) onTap
  +IconData icon
  +dynamic hintText
  +_InputTagState createState()
}

"jumpets_app::ui::components::tags.dart::InputTag" o-- "jumpets_app::ui::components::tags.dart::dynamic Function(dynamic)"
"jumpets_app::ui::components::tags.dart::InputTag" o-- "flutter::src::widgets::icon_data.dart::IconData"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::tags.dart::InputTag"

class "jumpets_app::ui::components::tags.dart::_InputTagState" {
  +dynamic value
  +TextEditingController controller
  +Widget build()
}

"jumpets_app::ui::components::tags.dart::_InputTagState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::tags.dart::_InputTagState"

class "jumpets_app::ui::components::gradient_text.dart::GradientText" {
  +double fontSize
  +dynamic text
  +Gradient gradient
  +Widget build()
}

"jumpets_app::ui::components::gradient_text.dart::GradientText" o-- "flutter::src::painting::gradient.dart::Gradient"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::gradient_text.dart::GradientText"

class "jumpets_app::ui::components::forms::valuation_forms.dart::ValueInput" {
  +dynamic initialValue
  +_ValueInputState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::forms::valuation_forms.dart::ValueInput"

class "jumpets_app::ui::components::forms::valuation_forms.dart::_ValueInputState" {
  +double initialValue
  +void initState()
  +Widget build()
}

"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::forms::valuation_forms.dart::_ValueInputState"

class "jumpets_app::ui::components::forms::valuation_forms.dart::ValuationInput" {
  +dynamic name
  +dynamic comment
  +_ValuationInputState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::forms::valuation_forms.dart::ValuationInput"

class "jumpets_app::ui::components::forms::valuation_forms.dart::_ValuationInputState" {
  -TextEditingController _controller
  +void initState()
  +Widget build()
}

"jumpets_app::ui::components::forms::valuation_forms.dart::_ValuationInputState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::forms::valuation_forms.dart::_ValuationInputState"

class "jumpets_app::ui::components::forms::valuation_forms.dart::ValuationButton" {
  +dynamic userIdValuated
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::forms::valuation_forms.dart::ValuationButton"

class "jumpets_app::ui::components::forms::valuation_forms.dart::OwnValuation" {
  +dynamic userToValuate
  +dynamic userAuth
  +dynamic valuation
  +_OwnValuationState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::forms::valuation_forms.dart::OwnValuation"

class "jumpets_app::ui::components::forms::valuation_forms.dart::_OwnValuationState" {
  +dynamic editMode
  +dynamic userAuth
  +dynamic valuation
  +dynamic user
  +Widget build()
  +void toggleEdit()
  -Widget _onEdit()
}

"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::forms::valuation_forms.dart::_OwnValuationState"

class "jumpets_app::ui::components::forms::profile_forms.dart::ProfileImagePicker" {
  +double radius
  +_ProfileImagePickerState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::ProfileImagePicker"

class "jumpets_app::ui::components::forms::profile_forms.dart::_ProfileImagePickerState" {
  -File _image
  +ImagePicker picker
  +Future getImage()
  +Widget build()
}

"jumpets_app::ui::components::forms::profile_forms.dart::_ProfileImagePickerState" o-- "dart::io::File"
"jumpets_app::ui::components::forms::profile_forms.dart::_ProfileImagePickerState" o-- "image_picker::image_picker.dart::ImagePicker"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::_ProfileImagePickerState"

class "jumpets_app::ui::components::forms::profile_forms.dart::ProfilePhoneInput" {
  +int phone
  +_ProfilePhoneInputState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::ProfilePhoneInput"

class "jumpets_app::ui::components::forms::profile_forms.dart::_ProfilePhoneInputState" {
  -TextEditingController _textEditingController
  +void initState()
  +Widget build()
}

"jumpets_app::ui::components::forms::profile_forms.dart::_ProfilePhoneInputState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::_ProfilePhoneInputState"

class "jumpets_app::ui::components::forms::profile_forms.dart::ProfileWebInput" {
  +dynamic web
  +_ProfileWebInputState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::ProfileWebInput"

class "jumpets_app::ui::components::forms::profile_forms.dart::_ProfileWebInputState" {
  -TextEditingController _textEditingController
  +void initState()
  +Widget build()
}

"jumpets_app::ui::components::forms::profile_forms.dart::_ProfileWebInputState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::_ProfileWebInputState"

class "jumpets_app::ui::components::forms::profile_forms.dart::ProfileAddressInput" {
  +dynamic address
  +_ProfileAddressInputState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::ProfileAddressInput"

class "jumpets_app::ui::components::forms::profile_forms.dart::_ProfileAddressInputState" {
  -TextEditingController _textEditingController
  +void initState()
  +Widget build()
}

"jumpets_app::ui::components::forms::profile_forms.dart::_ProfileAddressInputState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::_ProfileAddressInputState"

class "jumpets_app::ui::components::forms::profile_forms.dart::ProfileNameInput" {
  +dynamic name
  +_ProfileNameInputState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::ProfileNameInput"

class "jumpets_app::ui::components::forms::profile_forms.dart::_ProfileNameInputState" {
  -TextEditingController _textEditingController
  +void initState()
  +Widget build()
}

"jumpets_app::ui::components::forms::profile_forms.dart::_ProfileNameInputState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::_ProfileNameInputState"

class "jumpets_app::ui::components::forms::profile_forms.dart::ProfileEmailInput" {
  +dynamic email
  +_ProfileEmailInputState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::ProfileEmailInput"

class "jumpets_app::ui::components::forms::profile_forms.dart::_ProfileEmailInputState" {
  -TextEditingController _textEditingController
  +void initState()
  +Widget build()
}

"jumpets_app::ui::components::forms::profile_forms.dart::_ProfileEmailInputState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::_ProfileEmailInputState"

class "jumpets_app::ui::components::forms::profile_forms.dart::ProfilePasswordInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::ProfilePasswordInput"

class "jumpets_app::ui::components::forms::profile_forms.dart::ProfileEditButton" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::forms::profile_forms.dart::ProfileEditButton"

class "jumpets_app::ui::components::forms::login_form_components.dart::LoginEmailInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::forms::login_form_components.dart::LoginEmailInput"

class "jumpets_app::ui::components::forms::login_form_components.dart::LoginPasswordInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::forms::login_form_components.dart::LoginPasswordInput"

class "jumpets_app::ui::components::forms::login_form_components.dart::LoginButton" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::forms::login_form_components.dart::LoginButton"

class "jumpets_app::ui::components::forms::login_form_components.dart::RegisterNameInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::forms::login_form_components.dart::RegisterNameInput"

class "jumpets_app::ui::components::forms::login_form_components.dart::RegisterEmailInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::forms::login_form_components.dart::RegisterEmailInput"

class "jumpets_app::ui::components::forms::login_form_components.dart::RegisterPasswordInput" {
  +bool isConfirmed
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::forms::login_form_components.dart::RegisterPasswordInput"

class "jumpets_app::ui::components::forms::login_form_components.dart::RegisterStep2Button" {
  +void Function() onTap
  +Widget build()
}

"jumpets_app::ui::components::forms::login_form_components.dart::RegisterStep2Button" o-- "dart::ui::void Function()"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::forms::login_form_components.dart::RegisterStep2Button"

class "jumpets_app::ui::components::forms::login_form_components.dart::RegisterButton" {
  +dynamic title
  +UserType type
  +Widget build()
}

"jumpets_app::ui::components::forms::login_form_components.dart::RegisterButton" o-- "jumpets_app::models::enums::user_types.dart::UserType"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::forms::login_form_components.dart::RegisterButton"

class "jumpets_app::ui::components::buttons::category_button.dart::CategoryButton" {
  +dynamic category
  +bool isCollapsed
  +bool isSelected
  +double size
  +double borderRadius
  +dynamic Function(dynamic) onTap
  +Function onTriggered
  +Widget build()
}

"jumpets_app::ui::components::buttons::category_button.dart::CategoryButton" o-- "jumpets_app::ui::components::buttons::category_button.dart::dynamic Function(dynamic)"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::buttons::category_button.dart::CategoryButton"

class "jumpets_app::ui::components::buttons::category_button.dart::RoundedSquareButton" {
  +double size
  +double borderRadius
  +Widget child
  +Function onTap
  +Function onTriggered
  +bool isSelected
  +bool isBlocked
  +Widget build()
}

"jumpets_app::ui::components::buttons::category_button.dart::RoundedSquareButton" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::buttons::category_button.dart::RoundedSquareButton"

class "jumpets_app::ui::components::buttons::theme_button.dart::ThemeButton" {
  +bool isLight
  +bool isSelected
  +bool ignorePointer
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::buttons::theme_button.dart::ThemeButton"

class "jumpets_app::ui::components::buttons::raised_button.dart::MyRaisedButton" {
  +Function onPressed
  +dynamic text
  +Color color
  +Color textColor
  +bool filled
  +bool blocked
  +bool borders
  +Widget child
  +dynamic tag
  +Widget build()
}

"jumpets_app::ui::components::buttons::raised_button.dart::MyRaisedButton" o-- "dart::ui::Color"
"jumpets_app::ui::components::buttons::raised_button.dart::MyRaisedButton" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::buttons::raised_button.dart::MyRaisedButton"

class "jumpets_app::ui::components::buttons::text_radio_button.dart::TextRadioButton" {
  +dynamic text
  +bool isSelected
  +void Function() onTap
  +EdgeInsets margin
  +Widget build()
  +List gradient()
}

"jumpets_app::ui::components::buttons::text_radio_button.dart::TextRadioButton" o-- "dart::ui::void Function()"
"jumpets_app::ui::components::buttons::text_radio_button.dart::TextRadioButton" o-- "flutter::src::painting::edge_insets.dart::EdgeInsets"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::buttons::text_radio_button.dart::TextRadioButton"

class "jumpets_app::ui::components::buttons::animated_icon_button.dart::AnimatedIconButton" {
  +void Function() onTap
  +Widget child
  +double size
  +double elevation
  +List<Color> colors
  +List<Color> disabledColors
  +_AnimatedIconStateButton createState()
}

"jumpets_app::ui::components::buttons::animated_icon_button.dart::AnimatedIconButton" o-- "dart::ui::void Function()"
"jumpets_app::ui::components::buttons::animated_icon_button.dart::AnimatedIconButton" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::implicit_animations.dart::ImplicitlyAnimatedWidget" <|-- "jumpets_app::ui::components::buttons::animated_icon_button.dart::AnimatedIconButton"

class "jumpets_app::ui::components::buttons::animated_icon_button.dart::_AnimatedIconStateButton" {
  -GradientTween _gradientTween
  +double factor
  +List<Color> colors
  +double size
  +double elevation
  +Widget child
  +Function onTap
  +double targetHeight
  +Widget build()
  +List targetColors()
  +void forEachTween()
}

"jumpets_app::ui::components::buttons::animated_icon_button.dart::_AnimatedIconStateButton" o-- "jumpets_app::ui::components::buttons::animated_icon_button.dart::GradientTween"
"jumpets_app::ui::components::buttons::animated_icon_button.dart::_AnimatedIconStateButton" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::implicit_animations.dart::AnimatedWidgetBaseState<T>" <|-- "jumpets_app::ui::components::buttons::animated_icon_button.dart::_AnimatedIconStateButton"

class "jumpets_app::ui::components::buttons::animated_icon_button.dart::AnimatedIcon" {
  +Widget child
  +double offset
  +_AnimatedIconState createState()
}

"jumpets_app::ui::components::buttons::animated_icon_button.dart::AnimatedIcon" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::implicit_animations.dart::ImplicitlyAnimatedWidget" <|-- "jumpets_app::ui::components::buttons::animated_icon_button.dart::AnimatedIcon"

class "jumpets_app::ui::components::buttons::animated_icon_button.dart::_AnimatedIconState" {
  -FlyTween _flyTween
  +Widget build()
  +void forEachTween()
}

"jumpets_app::ui::components::buttons::animated_icon_button.dart::_AnimatedIconState" o-- "jumpets_app::ui::components::buttons::animated_icon_button.dart::FlyTween"
"flutter::src::widgets::implicit_animations.dart::AnimatedWidgetBaseState<T>" <|-- "jumpets_app::ui::components::buttons::animated_icon_button.dart::_AnimatedIconState"

class "jumpets_app::ui::components::buttons::animated_icon_button.dart::GradientTween" {
  +List lerp()
}

"flutter::src::animation::tween.dart::Tween<T>" <|-- "jumpets_app::ui::components::buttons::animated_icon_button.dart::GradientTween"

class "jumpets_app::ui::components::buttons::animated_icon_button.dart::FlyTween" {
  +double lerp()
}

"flutter::src::animation::tween.dart::Tween<T>" <|-- "jumpets_app::ui::components::buttons::animated_icon_button.dart::FlyTween"

class "jumpets_app::ui::components::buttons::sex_radio_button.dart::SexRadioButton" {
  +bool male
  +bool isSelected
  +void Function() onTap
  +EdgeInsets margin
  +Widget build()
  +Color color()
}

"jumpets_app::ui::components::buttons::sex_radio_button.dart::SexRadioButton" o-- "dart::ui::void Function()"
"jumpets_app::ui::components::buttons::sex_radio_button.dart::SexRadioButton" o-- "flutter::src::painting::edge_insets.dart::EdgeInsets"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::buttons::sex_radio_button.dart::SexRadioButton"

class "jumpets_app::ui::components::buttons::gradient_icon_button.dart::GradientIconButton" {
  +void Function() onTap
  +Widget child
  +double size
  +double elevation
  +List<Color> colors
  -List<Color> _colors
  +Widget build()
}

"jumpets_app::ui::components::buttons::gradient_icon_button.dart::GradientIconButton" o-- "dart::ui::void Function()"
"jumpets_app::ui::components::buttons::gradient_icon_button.dart::GradientIconButton" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::buttons::gradient_icon_button.dart::GradientIconButton"

class "jumpets_app::ui::components::buttons::icon_button.dart::MyIconButton" {
  +void Function() onTap
  +Widget child
  +Color color
  +double size
  +Widget build()
}

"jumpets_app::ui::components::buttons::icon_button.dart::MyIconButton" o-- "dart::ui::void Function()"
"jumpets_app::ui::components::buttons::icon_button.dart::MyIconButton" o-- "flutter::src::widgets::framework.dart::Widget"
"jumpets_app::ui::components::buttons::icon_button.dart::MyIconButton" o-- "dart::ui::Color"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::buttons::icon_button.dart::MyIconButton"

class "jumpets_app::ui::components::buttons::flat_button.dart::MyFlatButton" {
  +Widget child
  +void Function() onTap
  +Widget build()
}

"jumpets_app::ui::components::buttons::flat_button.dart::MyFlatButton" o-- "flutter::src::widgets::framework.dart::Widget"
"jumpets_app::ui::components::buttons::flat_button.dart::MyFlatButton" o-- "dart::ui::void Function()"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::buttons::flat_button.dart::MyFlatButton"

class "jumpets_app::ui::components::sex_icon.dart::SexIcon" {
  +bool male
  +double size
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::sex_icon.dart::SexIcon"

class "jumpets_app::ui::components::user_chip.dart::UserChip" {
  +dynamic user
  +dynamic small
  +dynamic tag
  +dynamic paddingValue
  +dynamic withBorder
  +Widget build()
  -dynamic _content()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::user_chip.dart::UserChip"

class "jumpets_app::ui::components::info_square.dart::InfoSquare" {
  +dynamic title
  +dynamic value
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::info_square.dart::InfoSquare"

class "jumpets_app::ui::components::auth::auth_sheet.dart::AuthSheet" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::auth::auth_sheet.dart::AuthSheet"

class "jumpets_app::ui::components::auth::auth_sheet.dart::AuthBody" {
  +bool notScrollable
  +ScrollController controller
  +_AuthBodyState createState()
}

"jumpets_app::ui::components::auth::auth_sheet.dart::AuthBody" o-- "flutter::src::widgets::scroll_controller.dart::ScrollController"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::auth::auth_sheet.dart::AuthBody"

class "jumpets_app::ui::components::auth::auth_sheet.dart::_AuthBodyState" {
  +List<Widget> steps
  +int index
  +void initState()
  +Widget build()
}

"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::auth::auth_sheet.dart::_AuthBodyState"

class "jumpets_app::ui::components::auth::auth_sheet.dart::Step1Body" {
  +bool notScrollable
  +void Function() onNext
  +ScrollController controller
  +Widget build()
}

"jumpets_app::ui::components::auth::auth_sheet.dart::Step1Body" o-- "dart::ui::void Function()"
"jumpets_app::ui::components::auth::auth_sheet.dart::Step1Body" o-- "flutter::src::widgets::scroll_controller.dart::ScrollController"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::auth::auth_sheet.dart::Step1Body"

class "jumpets_app::ui::components::auth::auth_sheet.dart::Step2Body" {
  +bool notScrollable
  +void Function() onBack
  +void Function() onNext
  +ScrollController controller
  +Widget build()
}

"jumpets_app::ui::components::auth::auth_sheet.dart::Step2Body" o-- "dart::ui::void Function()"
"jumpets_app::ui::components::auth::auth_sheet.dart::Step2Body" o-- "flutter::src::widgets::scroll_controller.dart::ScrollController"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::auth::auth_sheet.dart::Step2Body"

class "jumpets_app::ui::components::auth::auth_sheet.dart::Step3Body" {
  +bool notScrollable
  +ScrollController controller
  +void Function() onBack
  +Widget build()
}

"jumpets_app::ui::components::auth::auth_sheet.dart::Step3Body" o-- "flutter::src::widgets::scroll_controller.dart::ScrollController"
"jumpets_app::ui::components::auth::auth_sheet.dart::Step3Body" o-- "dart::ui::void Function()"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::auth::auth_sheet.dart::Step3Body"

class "jumpets_app::ui::components::auth::auth_sheet.dart::_Header" {
  +dynamic title
  +dynamic imagePath
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::auth::auth_sheet.dart::_Header"

class "jumpets_app::ui::components::jumpets_icons_icons.dart::JumpetsIcons" {
  {static} -String _kFontFam
  {static} -dynamic _kFontPkg
  {static} +IconData articulos
  {static} +IconData aves
  {static} +IconData camara
  {static} +IconData conejos
  {static} +IconData filtra
  {static} +IconData flecha
  {static} +IconData gatos
  {static} +IconData jumpets_logo
  {static} +IconData lapiz
  {static} +IconData otros
  {static} +IconData peces
  {static} +IconData perros
  {static} +IconData profesional
  {static} +IconData protectoras
  {static} +IconData reptiles
  {static} +IconData roedores
  {static} +IconData servicios
  {static} +IconData veterinarios
  {static} +IconData nariz_jumpets
}

"jumpets_app::ui::components::jumpets_icons_icons.dart::JumpetsIcons" o-- "flutter::src::widgets::icon_data.dart::IconData"

class "jumpets_app::ui::components::cards::animated_minishelter_card.dart::AnimatedShelterCard" {
  +dynamic edgePadding
  +dynamic offset
  +Protectora shelter
  +dynamic isSelected
  +AnimatedShelterCardState createState()
}

"jumpets_app::ui::components::cards::animated_minishelter_card.dart::AnimatedShelterCard" o-- "jumpets_app::models::users::protectora.dart::Protectora"
"flutter::src::widgets::implicit_animations.dart::ImplicitlyAnimatedWidget" <|-- "jumpets_app::ui::components::cards::animated_minishelter_card.dart::AnimatedShelterCard"

class "jumpets_app::ui::components::cards::animated_minishelter_card.dart::AnimatedShelterCardState" {
  -DoubleTween _doubleTween
  +dynamic edgePadding
  +dynamic offset
  +Protectora shelter
  +dynamic isSelected
  +dynamic targetElevation
  +Widget build()
  -Widget _getDetail()
  +void forEachTween()
}

"jumpets_app::ui::components::cards::animated_minishelter_card.dart::AnimatedShelterCardState" o-- "jumpets_app::ui::components::cards::animated_minishelter_card.dart::DoubleTween"
"jumpets_app::ui::components::cards::animated_minishelter_card.dart::AnimatedShelterCardState" o-- "jumpets_app::models::users::protectora.dart::Protectora"
"flutter::src::widgets::implicit_animations.dart::AnimatedWidgetBaseState<T>" <|-- "jumpets_app::ui::components::cards::animated_minishelter_card.dart::AnimatedShelterCardState"

class "jumpets_app::ui::components::cards::animated_minishelter_card.dart::DoubleTween" {
  +dynamic lerp()
}

"flutter::src::animation::tween.dart::Tween<T>" <|-- "jumpets_app::ui::components::cards::animated_minishelter_card.dart::DoubleTween"

class "jumpets_app::ui::components::cards::shelter_card.dart::ShelterCard" {
  +Protectora shelter
  +dynamic isSelected
  +dynamic offset
  +Widget build()
}

"jumpets_app::ui::components::cards::shelter_card.dart::ShelterCard" o-- "jumpets_app::models::users::protectora.dart::Protectora"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::cards::shelter_card.dart::ShelterCard"

class "jumpets_app::ui::components::cards::other_card.dart::OtherCard" {
  +Ad ad
  +dynamic small
  +dynamic height
  +dynamic width
  +dynamic isService
  +dynamic isProduct
  +dynamic description
  +dynamic title
  +dynamic price
  +Widget build()
}

"jumpets_app::ui::components::cards::other_card.dart::OtherCard" o-- "jumpets_app::models::ads::ad.dart::Ad"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::cards::other_card.dart::OtherCard"

class "jumpets_app::ui::components::cards::valuation.dart::ValuationCard" {
  +dynamic valuation
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::cards::valuation.dart::ValuationCard"

class "jumpets_app::ui::components::cards::animal_card.dart::AnimalCard" {
  +AnimalAd animalAd
  +dynamic small
  +dynamic height
  +dynamic width
  +Widget build()
}

"jumpets_app::ui::components::cards::animal_card.dart::AnimalCard" o-- "jumpets_app::models::ads::animal_ad.dart::AnimalAd"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::cards::animal_card.dart::AnimalCard"

class "jumpets_app::ui::components::cards::info_card.dart::InfoCard" {
  +dynamic title
  +dynamic message
  +bool big
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::cards::info_card.dart::InfoCard"

class "jumpets_app::ui::components::shelters_grid.dart::SheltersGrid" {
  +dynamic usePlaceholders
  +dynamic shelters
  +_SheltersGridState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::shelters_grid.dart::SheltersGrid"

class "jumpets_app::ui::components::shelters_grid.dart::_SheltersGridState" {
  -int _index
  +dynamic pageOffset
  -PageController _pageController
  +void initState()
  +Widget build()
}

"jumpets_app::ui::components::shelters_grid.dart::_SheltersGridState" o-- "flutter::src::widgets::page_view.dart::PageController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::shelters_grid.dart::_SheltersGridState"

class "jumpets_app::ui::components::placeholders::chat_placeholders.dart::ChatTilePlaceholder" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::placeholders::chat_placeholders.dart::ChatTilePlaceholder"

class "jumpets_app::ui::components::placeholders::custom_content_placeholder.dart::ContentPlaceholder" {
  +Widget child
  +double width
  +double height
  +double borderRadius
  +BuildContext context
  +EdgeInsets spacing
  +bool isAnimationEnabled
  {static} +Widget block()
  +Widget build()
}

"jumpets_app::ui::components::placeholders::custom_content_placeholder.dart::ContentPlaceholder" o-- "flutter::src::widgets::framework.dart::Widget"
"jumpets_app::ui::components::placeholders::custom_content_placeholder.dart::ContentPlaceholder" o-- "flutter::src::widgets::framework.dart::BuildContext"
"jumpets_app::ui::components::placeholders::custom_content_placeholder.dart::ContentPlaceholder" o-- "flutter::src::painting::edge_insets.dart::EdgeInsets"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::placeholders::custom_content_placeholder.dart::ContentPlaceholder"

class "jumpets_app::ui::components::placeholders::custom_content_placeholder.dart::_Styles" {
  {static} +double defaultSpacingSingle
  {static} +EdgeInsets defaultSpacing
  {static} +double defaultBorderRadius
  {static} +double defaultHeight
  {static} +Color defaultBlockColor
  {static} +Color defaultPlaceholderColor
  {static} +Color defaultPlaceholderHighlight
  {static} +Color defaultBlockColorDark
  {static} +Color defaultPlaceholderColorDark
  {static} +Color defaultPlaceholderHighlightDark
}

"jumpets_app::ui::components::placeholders::custom_content_placeholder.dart::_Styles" o-- "flutter::src::painting::edge_insets.dart::EdgeInsets"
"jumpets_app::ui::components::placeholders::custom_content_placeholder.dart::_Styles" o-- "dart::ui::Color"

class "jumpets_app::ui::components::image_carousel.dart::ImageCarousel" {
  +int selectedIndex
  +List imagesUrls
  +dynamic Function(int) onChanged
  +_ImageCarouselState createState()
}

"jumpets_app::ui::components::image_carousel.dart::ImageCarousel" o-- "jumpets_app::ui::components::image_carousel.dart::dynamic Function(int)"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::image_carousel.dart::ImageCarousel"

class "jumpets_app::ui::components::image_carousel.dart::_ImageCarouselState" {
  -PageController _pageController
  +List imagesUrls
  +int selectedIndex
  +void didUpdateWidget()
  +void initState()
  +void dispose()
  +Widget build()
}

"jumpets_app::ui::components::image_carousel.dart::_ImageCarouselState" o-- "flutter::src::widgets::page_view.dart::PageController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::image_carousel.dart::_ImageCarouselState"

class "jumpets_app::ui::components::in_app_notifications::base_notification.dart::BaseNotification" {
  +dynamic title
  +dynamic text
  +dynamic emoji
  +bool success
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::in_app_notifications::base_notification.dart::BaseNotification"

class "jumpets_app::ui::components::background_illustrations::spaces.dart::BaseSpace" {
  +dynamic assetName
  +dynamic titleUntranslated
  +dynamic subtitleUntranslated
  +bool greyScale
  +double widthFactor
  +Function retry
  +_BaseSpaceState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::background_illustrations::spaces.dart::BaseSpace"

class "jumpets_app::ui::components::background_illustrations::spaces.dart::_BaseSpaceState" {
  +Widget asset
  +void didChangeDependencies()
  +Widget build()
}

"jumpets_app::ui::components::background_illustrations::spaces.dart::_BaseSpaceState" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::background_illustrations::spaces.dart::_BaseSpaceState"

class "jumpets_app::ui::components::background_illustrations::spaces.dart::EmptySpace" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::background_illustrations::spaces.dart::EmptySpace"

class "jumpets_app::ui::components::background_illustrations::spaces.dart::NotFoundSpace" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::background_illustrations::spaces.dart::NotFoundSpace"

class "jumpets_app::ui::components::background_illustrations::spaces.dart::ErrorSpace" {
  +Function retry
  +dynamic msg
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::background_illustrations::spaces.dart::ErrorSpace"

class "jumpets_app::ui::components::profile_icon.dart::CircularProfileThumb" {
  +dynamic user
  +dynamic radius
  +dynamic borderWidth
  +void Function() onTap
  +dynamic elevation
  +Widget build()
}

"jumpets_app::ui::components::profile_icon.dart::CircularProfileThumb" o-- "dart::ui::void Function()"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::profile_icon.dart::CircularProfileThumb"

class "jumpets_app::ui::components::profile_icon.dart::RoundedRectProfileThumb" {
  +dynamic user
  +dynamic width
  +dynamic height
  +dynamic borderWidth
  +dynamic borderRadius
  +void Function() onTap
  +Widget build()
}

"jumpets_app::ui::components::profile_icon.dart::RoundedRectProfileThumb" o-- "dart::ui::void Function()"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::profile_icon.dart::RoundedRectProfileThumb"

class "jumpets_app::ui::components::tab_indicator.dart::CircleTabIndicator" {
  -BoxPainter _painter
  +BoxPainter createBoxPainter()
}

"jumpets_app::ui::components::tab_indicator.dart::CircleTabIndicator" o-- "flutter::src::painting::decoration.dart::BoxPainter"
"flutter::src::painting::decoration.dart::Decoration" <|-- "jumpets_app::ui::components::tab_indicator.dart::CircleTabIndicator"

class "jumpets_app::ui::components::tab_indicator.dart::_CirclePainter" {
  -Paint _paint
  +double radius
  +void paint()
}

"jumpets_app::ui::components::tab_indicator.dart::_CirclePainter" o-- "dart::ui::Paint"
"flutter::src::painting::decoration.dart::BoxPainter" <|-- "jumpets_app::ui::components::tab_indicator.dart::_CirclePainter"

class "jumpets_app::ui::components::server_status_tile.dart::ServerStatusTile" {
  +bool dense
  +_ServerStatusTileState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::server_status_tile.dart::ServerStatusTile"

class "jumpets_app::ui::components::server_status_tile.dart::_ServerStatusTileState" {
  +bool status
  +void initState()
  +Widget build()
  +void checkStatus()
}

"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::server_status_tile.dart::_ServerStatusTileState"

class "jumpets_app::ui::components::draggable_indicator.dart::DraggableIndicator" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::draggable_indicator.dart::DraggableIndicator"

class "jumpets_app::ui::components::photo_icon.dart::PhotoIcon" {
  +dynamic url
  +EdgeInsets margin
  +double borderWidth
  +Widget build()
}

"jumpets_app::ui::components::photo_icon.dart::PhotoIcon" o-- "flutter::src::painting::edge_insets.dart::EdgeInsets"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::photo_icon.dart::PhotoIcon"

class "jumpets_app::ui::components::animated_gradient_icon.dart::MaterialGradient" {
  +Widget child
  +ShapeBorder shape
  +double elevation
  +bool isColored
  +List<Color> onColors
  +List<Color> offColors
  +List<Color> targetColors
  +_MaterialGradientState createState()
}

"jumpets_app::ui::components::animated_gradient_icon.dart::MaterialGradient" o-- "flutter::src::widgets::framework.dart::Widget"
"jumpets_app::ui::components::animated_gradient_icon.dart::MaterialGradient" o-- "flutter::src::painting::borders.dart::ShapeBorder"
"flutter::src::widgets::implicit_animations.dart::ImplicitlyAnimatedWidget" <|-- "jumpets_app::ui::components::animated_gradient_icon.dart::MaterialGradient"

class "jumpets_app::ui::components::animated_gradient_icon.dart::_MaterialGradientState" {
  -GradientTween _gradientTween
  +Widget build()
  +void forEachTween()
}

"jumpets_app::ui::components::animated_gradient_icon.dart::_MaterialGradientState" o-- "jumpets_app::ui::components::animated_gradient_icon.dart::GradientTween"
"flutter::src::widgets::implicit_animations.dart::AnimatedWidgetBaseState<T>" <|-- "jumpets_app::ui::components::animated_gradient_icon.dart::_MaterialGradientState"

class "jumpets_app::ui::components::animated_gradient_icon.dart::AnimatedGradientIcon" {
  +IconData icon
  +double size
  +bool isSelected
  +List<Color> offColors
  +List<Color> onColors
  +List<Color> targetColors
  +_AnimatedGradientIconState createState()
}

"jumpets_app::ui::components::animated_gradient_icon.dart::AnimatedGradientIcon" o-- "flutter::src::widgets::icon_data.dart::IconData"
"flutter::src::widgets::implicit_animations.dart::ImplicitlyAnimatedWidget" <|-- "jumpets_app::ui::components::animated_gradient_icon.dart::AnimatedGradientIcon"

class "jumpets_app::ui::components::animated_gradient_icon.dart::_AnimatedGradientIconState" {
  -GradientTween _gradientTween
  -BigBangTween _doubleTween
  -BigBangTween _backgroundSizeTween
  +Widget build()
  +void forEachTween()
}

"jumpets_app::ui::components::animated_gradient_icon.dart::_AnimatedGradientIconState" o-- "jumpets_app::ui::components::animated_gradient_icon.dart::GradientTween"
"jumpets_app::ui::components::animated_gradient_icon.dart::_AnimatedGradientIconState" o-- "jumpets_app::ui::components::animated_gradient_icon.dart::BigBangTween"
"flutter::src::widgets::implicit_animations.dart::AnimatedWidgetBaseState<T>" <|-- "jumpets_app::ui::components::animated_gradient_icon.dart::_AnimatedGradientIconState"

class "jumpets_app::ui::components::animated_gradient_icon.dart::GradientTween" {
  +List lerp()
}

"flutter::src::animation::tween.dart::Tween<T>" <|-- "jumpets_app::ui::components::animated_gradient_icon.dart::GradientTween"

class "jumpets_app::ui::components::animated_gradient_icon.dart::BigBangTween" {
  +double lerp()
}

"flutter::src::animation::tween.dart::Tween<T>" <|-- "jumpets_app::ui::components::animated_gradient_icon.dart::BigBangTween"

class "jumpets_app::ui::components::vertical_grid::vertical_grid.dart::VerticalGrid" {
  +List<Ad> ads
  +Widget widgetInjection
  +bool usePlaceholders
  +bool insertPlaceholderAtLast
  +Widget build()
}

"jumpets_app::ui::components::vertical_grid::vertical_grid.dart::VerticalGrid" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::vertical_grid::vertical_grid.dart::VerticalGrid"

class "jumpets_app::ui::components::graphql_provider.dart::MyGraphQLProvider" {
  +Widget child
  +Widget build()
}

"jumpets_app::ui::components::graphql_provider.dart::MyGraphQLProvider" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::graphql_provider.dart::MyGraphQLProvider"

class "jumpets_app::ui::components::listeners::notifier.dart::Notifier" {
  +Widget child
  +Widget build()
  -void _infoListener()
  -void _errorListener()
}

"jumpets_app::ui::components::listeners::notifier.dart::Notifier" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::listeners::notifier.dart::Notifier"

class "jumpets_app::ui::components::listeners::notifier.dart::MyAlertDialog" {
  +Widget icon
  +dynamic msg
  +List<Widget> actions
  +ValueNotifier<bool> notifierStartup
  +Widget build()
}

"jumpets_app::ui::components::listeners::notifier.dart::MyAlertDialog" o-- "flutter::src::widgets::framework.dart::Widget"
"jumpets_app::ui::components::listeners::notifier.dart::MyAlertDialog" o-- "flutter::src::foundation::change_notifier.dart::ValueNotifier<bool>"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::listeners::notifier.dart::MyAlertDialog"

class "jumpets_app::ui::components::listeners::notifier.dart::MyNotification" {
  +dynamic msg
  +Widget trailing
  +Widget leading
  +Color color
  +Function onTap
  +Widget build()
}

"jumpets_app::ui::components::listeners::notifier.dart::MyNotification" o-- "flutter::src::widgets::framework.dart::Widget"
"jumpets_app::ui::components::listeners::notifier.dart::MyNotification" o-- "dart::ui::Color"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::listeners::notifier.dart::MyNotification"

class "jumpets_app::ui::components::listeners::auth_listener.dart::AuthListener" {
  +Widget child
  +Widget build()
}

"jumpets_app::ui::components::listeners::auth_listener.dart::AuthListener" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::listeners::auth_listener.dart::AuthListener"

class "jumpets_app::ui::components::social_media_sheet.dart::SocialMediaSheet" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::social_media_sheet.dart::SocialMediaSheet"

class "jumpets_app::ui::components::social_media_sheet.dart::_SocialMediaTile" {
  +Color color
  +dynamic title
  +dynamic subtitle
  +dynamic url
  +IconData icon
  +Widget build()
}

"jumpets_app::ui::components::social_media_sheet.dart::_SocialMediaTile" o-- "dart::ui::Color"
"jumpets_app::ui::components::social_media_sheet.dart::_SocialMediaTile" o-- "flutter::src::widgets::icon_data.dart::IconData"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::social_media_sheet.dart::_SocialMediaTile"

class "jumpets_app::ui::components::chat_bubbles.dart::BubbleMessage" {
  +dynamic text
  +dynamic time
  +dynamic delivered
  +dynamic isMine
  +_BubbleMessageState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::components::chat_bubbles.dart::BubbleMessage"

class "jumpets_app::ui::components::chat_bubbles.dart::_BubbleMessageState" {
  +AnimationController animationController
  +dynamic time
  +dynamic text
  +dynamic isMine
  +dynamic delivered
  +void initState()
  +Widget build()
  +void dispose()
}

"jumpets_app::ui::components::chat_bubbles.dart::_BubbleMessageState" o-- "flutter::src::animation::animation_controller.dart::AnimationController"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::components::chat_bubbles.dart::_BubbleMessageState"
"flutter::src::widgets::ticker_provider.dart::SingleTickerProviderStateMixin<T>" <|-- "jumpets_app::ui::components::chat_bubbles.dart::_BubbleMessageState"

class "jumpets_app::ui::components::bottombar::bottombar2.dart::FloatingBottomBar" {
  +double elevation
  +double mainIconSize
  +int pageSelected
  +dynamic Function(int) onTap
  +Function onDoubleMainTap
  +Widget build()
}

"jumpets_app::ui::components::bottombar::bottombar2.dart::FloatingBottomBar" o-- "jumpets_app::ui::components::bottombar::bottombar2.dart::dynamic Function(int)"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::bottombar::bottombar2.dart::FloatingBottomBar"

class "jumpets_app::ui::components::bottombar::bottombar.dart::FloatingBottomBar" {
  +double elevation
  +double mainIconSize
  +int pageSelected
  +dynamic Function(int) onTap
  +Function onDoubleMainTap
  +Widget build()
}

"jumpets_app::ui::components::bottombar::bottombar.dart::FloatingBottomBar" o-- "jumpets_app::ui::components::bottombar::bottombar.dart::dynamic Function(int)"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::bottombar::bottombar.dart::FloatingBottomBar"

class "jumpets_app::ui::components::bottombar::bottombar.dart::BottomBar" {
  +double elevation
  +double mainIconSize
  +int pageSelected
  +dynamic Function(int) onTap
  +Function onDoubleMainTap
  +Widget build()
}

"jumpets_app::ui::components::bottombar::bottombar.dart::BottomBar" o-- "jumpets_app::ui::components::bottombar::bottombar.dart::dynamic Function(int)"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::components::bottombar::bottombar.dart::BottomBar"

class "jumpets_app::ui::components::animated::page_indicator.dart::PageIndicator" {
  +int selectedIndex
  +int length
  +Color unselectedColor
  +Color selectedColor
  +_PageIndicatorState createState()
}

"jumpets_app::ui::components::animated::page_indicator.dart::PageIndicator" o-- "dart::ui::Color"
"flutter::src::widgets::implicit_animations.dart::ImplicitlyAnimatedWidget" <|-- "jumpets_app::ui::components::animated::page_indicator.dart::PageIndicator"

class "jumpets_app::ui::components::animated::page_indicator.dart::_PageIndicatorState" {
  -List<DoubleTween> _doubleTweens
  -List<ColorTween> _colorTweens
  +double size
  +int selectedSizeFactor
  +void initState()
  +Widget build()
  +void forEachTween()
}

"flutter::src::widgets::implicit_animations.dart::AnimatedWidgetBaseState<T>" <|-- "jumpets_app::ui::components::animated::page_indicator.dart::_PageIndicatorState"

class "jumpets_app::ui::edit_profile_page::edit_profile_page.dart::EditProfilePage" {
  +User user
  +Widget build()
}

"jumpets_app::ui::edit_profile_page::edit_profile_page.dart::EditProfilePage" o-- "jumpets_app::models::users::user.dart::User"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::edit_profile_page::edit_profile_page.dart::EditProfilePage"

class "jumpets_app::ui::settings_page::settings_page.dart::SettingsPage" {
  +dynamic denseTiles
  +Widget build()
  -Widget _accountTiles()
  -Widget _header()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::settings_page::settings_page.dart::SettingsPage"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdTitleInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdTitleInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdNameInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdNameInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdDescriptionInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdDescriptionInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdMustKnowInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdMustKnowInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdBreedInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdBreedInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdPriceInput" {
  +dynamic isPriceHour
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdPriceInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdAdoptionTaxInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdAdoptionTaxInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdWeightInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdWeightInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdBirthDate" {
  -Future _selectDate()
  +Widget build()
  +dynamic text()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdBirthDate"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdSexInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdSexInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdDogSizeInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdDogSizeInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdActivityLevelInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdActivityLevelInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdDeliveryInfoInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdDeliveryInfoInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdPersonalityInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdPersonalityInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdTagsInput" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdTagsInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::AdPhotosInput" {
  +ImagePicker picker
  +Future getImage()
  +Widget build()
  -Widget _getWidgetImageFromIndex()
}

"jumpets_app::ui::upload_ad_page::forms.dart::AdPhotosInput" o-- "image_picker::image_picker.dart::ImagePicker"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::AdPhotosInput"

class "jumpets_app::ui::upload_ad_page::forms.dart::UploadButton" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::forms.dart::UploadButton"

class "jumpets_app::ui::upload_ad_page::upload_ad_page.dart::UploadAdPage" {
  +_UploadAdPageState createState()
}

"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::upload_ad_page::upload_ad_page.dart::UploadAdPage"

class "jumpets_app::ui::upload_ad_page::upload_ad_page.dart::_UploadAdPageState" {
  +UploadAdBloc uploadAdBloc
  +void initState()
  +Widget build()
  -dynamic _inputs()
  -dynamic _animalInputs()
  -dynamic _serviceInputs()
  -dynamic _productInputs()
}

"jumpets_app::ui::upload_ad_page::upload_ad_page.dart::_UploadAdPageState" o-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdBloc"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::upload_ad_page::upload_ad_page.dart::_UploadAdPageState"

class "jumpets_app::ui::upload_ad_page::upload_ad_page.dart::SelectableCategories" {
  +Widget build()
}

"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::upload_ad_page::upload_ad_page.dart::SelectableCategories"

class "jumpets_app::ui::ad_page::ad_page.dart::AdPage" {
  +Ad ad
  +dynamic edgePadding
  +ValueNotifier<int> notifierChangeImage
  +dynamic isService
  +dynamic isProduct
  +dynamic isAnimal
  +dynamic description
  +dynamic title
  +dynamic price
  +dynamic tags
  +Widget build()
  -Widget _othersHeader()
  -Widget _animalHeader()
  -Widget _about()
  -Widget _morePhotosLayout()
  -Widget _bottomBar()
}

"jumpets_app::ui::ad_page::ad_page.dart::AdPage" o-- "jumpets_app::models::ads::ad.dart::Ad"
"jumpets_app::ui::ad_page::ad_page.dart::AdPage" o-- "flutter::src::foundation::change_notifier.dart::ValueNotifier<int>"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::ui::ad_page::ad_page.dart::AdPage"

class "jumpets_app::ui::ad_page::ad_page.dart::_InfoSquares" {
  +AnimalAd ad
  +__InfoSquaresState createState()
}

"jumpets_app::ui::ad_page::ad_page.dart::_InfoSquares" o-- "jumpets_app::models::ads::animal_ad.dart::AnimalAd"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::ad_page::ad_page.dart::_InfoSquares"

class "jumpets_app::ui::ad_page::ad_page.dart::__InfoSquaresState" {
  -ScrollController _scrollController
  +AnimalAd ad
  +void initState()
  +Widget build()
  +void dispose()
  -Widget _infoSquares()
}

"jumpets_app::ui::ad_page::ad_page.dart::__InfoSquaresState" o-- "flutter::src::widgets::scroll_controller.dart::ScrollController"
"jumpets_app::ui::ad_page::ad_page.dart::__InfoSquaresState" o-- "jumpets_app::models::ads::animal_ad.dart::AnimalAd"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::ad_page::ad_page.dart::__InfoSquaresState"

class "jumpets_app::ui::chat_page::chat_page.dart::ChatPage" {
  +Room room
  +_ChatPageState createState()
}

"jumpets_app::ui::chat_page::chat_page.dart::ChatPage" o-- "jumpets_app::models::chats::room.dart::Room"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::chat_page::chat_page.dart::ChatPage"

class "jumpets_app::ui::chat_page::chat_page.dart::_ChatPageState" {
  -dynamic _messages
  -Widget _buildContent
  +void initState()
  +Widget build()
  +void updateMessages()
  +void addMessage()
  +dynamic otherUser()
}

"jumpets_app::ui::chat_page::chat_page.dart::_ChatPageState" o-- "flutter::src::widgets::framework.dart::Widget"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::chat_page::chat_page.dart::_ChatPageState"

class "jumpets_app::ui::chat_page::chat_page.dart::MessageBar" {
  +dynamic otherUserId
  +dynamic Function(dynamic) onSubmitted
  +_MessageBarState createState()
}

"jumpets_app::ui::chat_page::chat_page.dart::MessageBar" o-- "jumpets_app::ui::chat_page::chat_page.dart::dynamic Function(dynamic)"
"flutter::src::widgets::framework.dart::StatefulWidget" <|-- "jumpets_app::ui::chat_page::chat_page.dart::MessageBar"

class "jumpets_app::ui::chat_page::chat_page.dart::_MessageBarState" {
  +TextEditingController textEditingController
  -FocusNode _focusNode
  +dynamic isMessageValid
  +void initState()
  +Widget build()
  +void onSubmit()
  +void dispose()
}

"jumpets_app::ui::chat_page::chat_page.dart::_MessageBarState" o-- "flutter::src::widgets::editable_text.dart::TextEditingController"
"jumpets_app::ui::chat_page::chat_page.dart::_MessageBarState" o-- "flutter::src::widgets::focus_manager.dart::FocusNode"
"flutter::src::widgets::framework.dart::State<T>" <|-- "jumpets_app::ui::chat_page::chat_page.dart::_MessageBarState"

class "jumpets_app::app_localizations.dart::AppLocalizations" {
  +Locale locale
  -Map _localizedStrings
  {static} +LocalizationsDelegate<AppLocalizations> delegate
  {static} +AppLocalizations of()
  +Future load()
  +dynamic translate()
}

"jumpets_app::app_localizations.dart::AppLocalizations" o-- "dart::ui::Locale"
"jumpets_app::app_localizations.dart::AppLocalizations" o-- "flutter::src::widgets::localizations.dart::LocalizationsDelegate<AppLocalizations>"

class "jumpets_app::app_localizations.dart::_AppLocalizationsDelegate" {
  +bool isSupported()
  +Future load()
  +bool shouldReload()
}

"flutter::src::widgets::localizations.dart::LocalizationsDelegate<T>" <|-- "jumpets_app::app_localizations.dart::_AppLocalizationsDelegate"

newpage 

abstract class "jumpets_app::models::ads::product_ad.dart::ProductAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String title
  +double price
  +String description
  {static} +Serializer<ProductAd> serializer
  +dynamic toJson()
  {static} +ProductAd fromJson()
}

"jumpets_app::models::ads::product_ad.dart::ProductAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::product_ad.dart::ProductAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::product_ad.dart::ProductAd" o-- "built_value::serializer.dart::Serializer<ProductAd>"
"jumpets_app::models::ads::ad.dart::Ad" <|-- "jumpets_app::models::ads::product_ad.dart::ProductAd"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::ads::product_ad.dart::ProductAd"

class "jumpets_app::models::ads::product_ad.dart::_$ProductAdSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +ProductAd deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::ads::product_ad.dart::_$ProductAdSerializer"

class "jumpets_app::models::ads::product_ad.dart::_$ProductAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String title
  +double price
  +String description
  +int hashCode
  +ProductAd rebuild()
  +ProductAdBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::ads::product_ad.dart::_$ProductAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::product_ad.dart::_$ProductAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::product_ad.dart::ProductAd" <|-- "jumpets_app::models::ads::product_ad.dart::_$ProductAd"

class "jumpets_app::models::ads::product_ad.dart::ProductAdBuilder" {
  -_$ProductAd _$v
  -String _id
  -DateTime _createdAt
  -ListBuilder<String> _tags
  -ListBuilder<String> _photos
  -User _creator
  -String _title
  -double _price
  -String _description
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +String title
  +double price
  +String description
  -ProductAdBuilder _$this
  +void replace()
  +void update()
  +_$ProductAd build()
}

"jumpets_app::models::ads::product_ad.dart::ProductAdBuilder" o-- "jumpets_app::models::ads::product_ad.dart::_$ProductAd"
"jumpets_app::models::ads::product_ad.dart::ProductAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::product_ad.dart::ProductAdBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::product_ad.dart::ProductAdBuilder" o-- "jumpets_app::models::ads::product_ad.dart::ProductAdBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::ads::product_ad.dart::ProductAdBuilder"
"jumpets_app::models::ads::ad.dart::AdBuilder" <|-- "jumpets_app::models::ads::product_ad.dart::ProductAdBuilder"

abstract class "jumpets_app::models::ads::animal_ad.dart::AnimalAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryInfo
  +String breed
  +AnimalAd rebuild()
  +AnimalAdBuilder toBuilder()
  {static} +AnimalAd fromJson()
}

"jumpets_app::models::ads::animal_ad.dart::AnimalAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animal_ad.dart::AnimalAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animal_ad.dart::AnimalAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animal_ad.dart::AnimalAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::ad.dart::Ad" <|-- "jumpets_app::models::ads::animal_ad.dart::AnimalAd"

abstract class "jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" {
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +ListBuilder<String> personality
  +String mustKnow
  +ListBuilder<DeliveryStatus> deliveryInfo
  +String breed
  +void replace()
  +void update()
}

"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<DeliveryStatus>"
"jumpets_app::models::ads::ad.dart::AdBuilder" <|-- "jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder"

abstract class "jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  {static} +Serializer<BunnyAd> serializer
  +dynamic toJson()
  {static} +BunnyAd fromJson()
}

"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAd" o-- "built_value::serializer.dart::Serializer<BunnyAd>"
"jumpets_app::models::ads::animal_ad.dart::AnimalAd" <|-- "jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAd"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAd"

class "jumpets_app::models::ads::animals::bunny_ad.dart::_$BunnyAdSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +BunnyAd deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::ads::animals::bunny_ad.dart::_$BunnyAdSerializer"

class "jumpets_app::models::ads::animals::bunny_ad.dart::_$BunnyAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  +BuiltList<DeliveryStatus> deliveryInfo
  +int hashCode
  +BunnyAd rebuild()
  +BunnyAdBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::ads::animals::bunny_ad.dart::_$BunnyAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::bunny_ad.dart::_$BunnyAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::bunny_ad.dart::_$BunnyAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::bunny_ad.dart::_$BunnyAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAd" <|-- "jumpets_app::models::ads::animals::bunny_ad.dart::_$BunnyAd"

class "jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAdBuilder" {
  -_$BunnyAd _$v
  -String _id
  -DateTime _createdAt
  -ListBuilder<String> _tags
  -ListBuilder<String> _photos
  -User _creator
  -String _name
  -String _description
  -ActivityLevel _activityLevel
  -DateTime _birthDate
  -bool _male
  -double _adoptionTax
  -double _weight
  -ListBuilder<String> _personality
  -String _mustKnow
  -ListBuilder<DeliveryStatus> _deliveryStatuses
  -String _breed
  -ListBuilder<DeliveryStatus> _deliveryInfo
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +ListBuilder<String> personality
  +String mustKnow
  +ListBuilder<DeliveryStatus> deliveryStatuses
  +String breed
  +ListBuilder<DeliveryStatus> deliveryInfo
  -BunnyAdBuilder _$this
  +void replace()
  +void update()
  +_$BunnyAd build()
}

"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAdBuilder" o-- "jumpets_app::models::ads::animals::bunny_ad.dart::_$BunnyAd"
"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAdBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAdBuilder" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<DeliveryStatus>"
"jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAdBuilder" o-- "jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAdBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAdBuilder"
"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" <|-- "jumpets_app::models::ads::animals::bunny_ad.dart::BunnyAdBuilder"

abstract class "jumpets_app::models::ads::animals::fish_ad.dart::FishAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  {static} +Serializer<FishAd> serializer
  +dynamic toJson()
  {static} +FishAd fromJson()
}

"jumpets_app::models::ads::animals::fish_ad.dart::FishAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::fish_ad.dart::FishAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::fish_ad.dart::FishAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::fish_ad.dart::FishAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::fish_ad.dart::FishAd" o-- "built_value::serializer.dart::Serializer<FishAd>"
"jumpets_app::models::ads::animal_ad.dart::AnimalAd" <|-- "jumpets_app::models::ads::animals::fish_ad.dart::FishAd"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::ads::animals::fish_ad.dart::FishAd"

class "jumpets_app::models::ads::animals::fish_ad.dart::_$FishAdSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +FishAd deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::ads::animals::fish_ad.dart::_$FishAdSerializer"

class "jumpets_app::models::ads::animals::fish_ad.dart::_$FishAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  +BuiltList<DeliveryStatus> deliveryInfo
  +int hashCode
  +FishAd rebuild()
  +FishAdBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::ads::animals::fish_ad.dart::_$FishAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::fish_ad.dart::_$FishAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::fish_ad.dart::_$FishAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::fish_ad.dart::_$FishAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::fish_ad.dart::FishAd" <|-- "jumpets_app::models::ads::animals::fish_ad.dart::_$FishAd"

class "jumpets_app::models::ads::animals::fish_ad.dart::FishAdBuilder" {
  -_$FishAd _$v
  -String _id
  -DateTime _createdAt
  -ListBuilder<String> _tags
  -ListBuilder<String> _photos
  -User _creator
  -String _name
  -String _description
  -ActivityLevel _activityLevel
  -DateTime _birthDate
  -bool _male
  -double _adoptionTax
  -double _weight
  -ListBuilder<String> _personality
  -String _mustKnow
  -ListBuilder<DeliveryStatus> _deliveryStatuses
  -String _breed
  -ListBuilder<DeliveryStatus> _deliveryInfo
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +ListBuilder<String> personality
  +String mustKnow
  +ListBuilder<DeliveryStatus> deliveryStatuses
  +String breed
  +ListBuilder<DeliveryStatus> deliveryInfo
  -FishAdBuilder _$this
  +void replace()
  +void update()
  +_$FishAd build()
}

"jumpets_app::models::ads::animals::fish_ad.dart::FishAdBuilder" o-- "jumpets_app::models::ads::animals::fish_ad.dart::_$FishAd"
"jumpets_app::models::ads::animals::fish_ad.dart::FishAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::animals::fish_ad.dart::FishAdBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::fish_ad.dart::FishAdBuilder" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::fish_ad.dart::FishAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<DeliveryStatus>"
"jumpets_app::models::ads::animals::fish_ad.dart::FishAdBuilder" o-- "jumpets_app::models::ads::animals::fish_ad.dart::FishAdBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::ads::animals::fish_ad.dart::FishAdBuilder"
"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" <|-- "jumpets_app::models::ads::animals::fish_ad.dart::FishAdBuilder"

abstract class "jumpets_app::models::ads::animals::cat_ad.dart::CatAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  {static} +Serializer<CatAd> serializer
  +dynamic toJson()
  {static} +CatAd fromJson()
}

"jumpets_app::models::ads::animals::cat_ad.dart::CatAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::cat_ad.dart::CatAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::cat_ad.dart::CatAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::cat_ad.dart::CatAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::cat_ad.dart::CatAd" o-- "built_value::serializer.dart::Serializer<CatAd>"
"jumpets_app::models::ads::animal_ad.dart::AnimalAd" <|-- "jumpets_app::models::ads::animals::cat_ad.dart::CatAd"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::ads::animals::cat_ad.dart::CatAd"

class "jumpets_app::models::ads::animals::cat_ad.dart::_$CatAdSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +CatAd deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::ads::animals::cat_ad.dart::_$CatAdSerializer"

class "jumpets_app::models::ads::animals::cat_ad.dart::_$CatAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  +BuiltList<DeliveryStatus> deliveryInfo
  +int hashCode
  +CatAd rebuild()
  +CatAdBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::ads::animals::cat_ad.dart::_$CatAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::cat_ad.dart::_$CatAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::cat_ad.dart::_$CatAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::cat_ad.dart::_$CatAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::cat_ad.dart::CatAd" <|-- "jumpets_app::models::ads::animals::cat_ad.dart::_$CatAd"

class "jumpets_app::models::ads::animals::cat_ad.dart::CatAdBuilder" {
  -_$CatAd _$v
  -String _id
  -DateTime _createdAt
  -ListBuilder<String> _tags
  -ListBuilder<String> _photos
  -User _creator
  -String _name
  -String _description
  -ActivityLevel _activityLevel
  -DateTime _birthDate
  -bool _male
  -double _adoptionTax
  -double _weight
  -ListBuilder<String> _personality
  -String _mustKnow
  -ListBuilder<DeliveryStatus> _deliveryStatuses
  -String _breed
  -ListBuilder<DeliveryStatus> _deliveryInfo
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +ListBuilder<String> personality
  +String mustKnow
  +ListBuilder<DeliveryStatus> deliveryStatuses
  +String breed
  +ListBuilder<DeliveryStatus> deliveryInfo
  -CatAdBuilder _$this
  +void replace()
  +void update()
  +_$CatAd build()
}

"jumpets_app::models::ads::animals::cat_ad.dart::CatAdBuilder" o-- "jumpets_app::models::ads::animals::cat_ad.dart::_$CatAd"
"jumpets_app::models::ads::animals::cat_ad.dart::CatAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::animals::cat_ad.dart::CatAdBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::cat_ad.dart::CatAdBuilder" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::cat_ad.dart::CatAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<DeliveryStatus>"
"jumpets_app::models::ads::animals::cat_ad.dart::CatAdBuilder" o-- "jumpets_app::models::ads::animals::cat_ad.dart::CatAdBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::ads::animals::cat_ad.dart::CatAdBuilder"
"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" <|-- "jumpets_app::models::ads::animals::cat_ad.dart::CatAdBuilder"

abstract class "jumpets_app::models::ads::animals::dog_ad.dart::DogAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  +DogSize size
  {static} +Serializer<DogAd> serializer
  +dynamic toJson()
  {static} +DogAd fromJson()
}

"jumpets_app::models::ads::animals::dog_ad.dart::DogAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAd" o-- "jumpets_app::models::enums::dog_size.dart::DogSize"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAd" o-- "built_value::serializer.dart::Serializer<DogAd>"
"jumpets_app::models::ads::animal_ad.dart::AnimalAd" <|-- "jumpets_app::models::ads::animals::dog_ad.dart::DogAd"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::ads::animals::dog_ad.dart::DogAd"

class "jumpets_app::models::ads::animals::dog_ad.dart::_$DogAdSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +DogAd deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::ads::animals::dog_ad.dart::_$DogAdSerializer"

class "jumpets_app::models::ads::animals::dog_ad.dart::_$DogAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  +DogSize size
  +BuiltList<DeliveryStatus> deliveryInfo
  +int hashCode
  +DogAd rebuild()
  +DogAdBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::ads::animals::dog_ad.dart::_$DogAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::dog_ad.dart::_$DogAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::dog_ad.dart::_$DogAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::dog_ad.dart::_$DogAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::dog_ad.dart::_$DogAd" o-- "jumpets_app::models::enums::dog_size.dart::DogSize"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAd" <|-- "jumpets_app::models::ads::animals::dog_ad.dart::_$DogAd"

class "jumpets_app::models::ads::animals::dog_ad.dart::DogAdBuilder" {
  -_$DogAd _$v
  -String _id
  -DateTime _createdAt
  -ListBuilder<String> _tags
  -ListBuilder<String> _photos
  -User _creator
  -String _name
  -String _description
  -ActivityLevel _activityLevel
  -DateTime _birthDate
  -bool _male
  -double _adoptionTax
  -double _weight
  -ListBuilder<String> _personality
  -String _mustKnow
  -ListBuilder<DeliveryStatus> _deliveryStatuses
  -String _breed
  -DogSize _size
  -ListBuilder<DeliveryStatus> _deliveryInfo
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +ListBuilder<String> personality
  +String mustKnow
  +ListBuilder<DeliveryStatus> deliveryStatuses
  +String breed
  +DogSize size
  +ListBuilder<DeliveryStatus> deliveryInfo
  -DogAdBuilder _$this
  +void replace()
  +void update()
  +_$DogAd build()
}

"jumpets_app::models::ads::animals::dog_ad.dart::DogAdBuilder" o-- "jumpets_app::models::ads::animals::dog_ad.dart::_$DogAd"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAdBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAdBuilder" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<DeliveryStatus>"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAdBuilder" o-- "jumpets_app::models::enums::dog_size.dart::DogSize"
"jumpets_app::models::ads::animals::dog_ad.dart::DogAdBuilder" o-- "jumpets_app::models::ads::animals::dog_ad.dart::DogAdBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::ads::animals::dog_ad.dart::DogAdBuilder"
"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" <|-- "jumpets_app::models::ads::animals::dog_ad.dart::DogAdBuilder"

abstract class "jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  {static} +Serializer<ReptileAd> serializer
  +dynamic toJson()
  {static} +ReptileAd fromJson()
}

"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAd" o-- "built_value::serializer.dart::Serializer<ReptileAd>"
"jumpets_app::models::ads::animal_ad.dart::AnimalAd" <|-- "jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAd"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAd"

class "jumpets_app::models::ads::animals::reptile_ad.dart::_$ReptileAdSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +ReptileAd deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::ads::animals::reptile_ad.dart::_$ReptileAdSerializer"

class "jumpets_app::models::ads::animals::reptile_ad.dart::_$ReptileAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  +BuiltList<DeliveryStatus> deliveryInfo
  +int hashCode
  +ReptileAd rebuild()
  +ReptileAdBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::ads::animals::reptile_ad.dart::_$ReptileAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::reptile_ad.dart::_$ReptileAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::reptile_ad.dart::_$ReptileAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::reptile_ad.dart::_$ReptileAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAd" <|-- "jumpets_app::models::ads::animals::reptile_ad.dart::_$ReptileAd"

class "jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAdBuilder" {
  -_$ReptileAd _$v
  -String _id
  -DateTime _createdAt
  -ListBuilder<String> _tags
  -ListBuilder<String> _photos
  -User _creator
  -String _name
  -String _description
  -ActivityLevel _activityLevel
  -DateTime _birthDate
  -bool _male
  -double _adoptionTax
  -double _weight
  -ListBuilder<String> _personality
  -String _mustKnow
  -ListBuilder<DeliveryStatus> _deliveryStatuses
  -String _breed
  -ListBuilder<DeliveryStatus> _deliveryInfo
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +ListBuilder<String> personality
  +String mustKnow
  +ListBuilder<DeliveryStatus> deliveryStatuses
  +String breed
  +ListBuilder<DeliveryStatus> deliveryInfo
  -ReptileAdBuilder _$this
  +void replace()
  +void update()
  +_$ReptileAd build()
}

"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAdBuilder" o-- "jumpets_app::models::ads::animals::reptile_ad.dart::_$ReptileAd"
"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAdBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAdBuilder" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<DeliveryStatus>"
"jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAdBuilder" o-- "jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAdBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAdBuilder"
"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" <|-- "jumpets_app::models::ads::animals::reptile_ad.dart::ReptileAdBuilder"

abstract class "jumpets_app::models::ads::animals::bird_ad.dart::BirdAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  {static} +Serializer<BirdAd> serializer
  +dynamic toJson()
  {static} +BirdAd fromJson()
}

"jumpets_app::models::ads::animals::bird_ad.dart::BirdAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::bird_ad.dart::BirdAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::bird_ad.dart::BirdAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::bird_ad.dart::BirdAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::bird_ad.dart::BirdAd" o-- "built_value::serializer.dart::Serializer<BirdAd>"
"jumpets_app::models::ads::animal_ad.dart::AnimalAd" <|-- "jumpets_app::models::ads::animals::bird_ad.dart::BirdAd"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::ads::animals::bird_ad.dart::BirdAd"

class "jumpets_app::models::ads::animals::bird_ad.dart::_$BirdAdSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +BirdAd deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::ads::animals::bird_ad.dart::_$BirdAdSerializer"

class "jumpets_app::models::ads::animals::bird_ad.dart::_$BirdAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  +BuiltList<DeliveryStatus> deliveryInfo
  +int hashCode
  +BirdAd rebuild()
  +BirdAdBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::ads::animals::bird_ad.dart::_$BirdAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::bird_ad.dart::_$BirdAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::bird_ad.dart::_$BirdAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::bird_ad.dart::_$BirdAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::bird_ad.dart::BirdAd" <|-- "jumpets_app::models::ads::animals::bird_ad.dart::_$BirdAd"

class "jumpets_app::models::ads::animals::bird_ad.dart::BirdAdBuilder" {
  -_$BirdAd _$v
  -String _id
  -DateTime _createdAt
  -ListBuilder<String> _tags
  -ListBuilder<String> _photos
  -User _creator
  -String _name
  -String _description
  -ActivityLevel _activityLevel
  -DateTime _birthDate
  -bool _male
  -double _adoptionTax
  -double _weight
  -ListBuilder<String> _personality
  -String _mustKnow
  -ListBuilder<DeliveryStatus> _deliveryStatuses
  -String _breed
  -ListBuilder<DeliveryStatus> _deliveryInfo
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +ListBuilder<String> personality
  +String mustKnow
  +ListBuilder<DeliveryStatus> deliveryStatuses
  +String breed
  +ListBuilder<DeliveryStatus> deliveryInfo
  -BirdAdBuilder _$this
  +void replace()
  +void update()
  +_$BirdAd build()
}

"jumpets_app::models::ads::animals::bird_ad.dart::BirdAdBuilder" o-- "jumpets_app::models::ads::animals::bird_ad.dart::_$BirdAd"
"jumpets_app::models::ads::animals::bird_ad.dart::BirdAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::animals::bird_ad.dart::BirdAdBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::bird_ad.dart::BirdAdBuilder" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::bird_ad.dart::BirdAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<DeliveryStatus>"
"jumpets_app::models::ads::animals::bird_ad.dart::BirdAdBuilder" o-- "jumpets_app::models::ads::animals::bird_ad.dart::BirdAdBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::ads::animals::bird_ad.dart::BirdAdBuilder"
"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" <|-- "jumpets_app::models::ads::animals::bird_ad.dart::BirdAdBuilder"

abstract class "jumpets_app::models::ads::animals::other_ad.dart::OtherAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  {static} +Serializer<OtherAd> serializer
  +dynamic toJson()
  {static} +OtherAd fromJson()
}

"jumpets_app::models::ads::animals::other_ad.dart::OtherAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::other_ad.dart::OtherAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::other_ad.dart::OtherAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::other_ad.dart::OtherAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::other_ad.dart::OtherAd" o-- "built_value::serializer.dart::Serializer<OtherAd>"
"jumpets_app::models::ads::animal_ad.dart::AnimalAd" <|-- "jumpets_app::models::ads::animals::other_ad.dart::OtherAd"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::ads::animals::other_ad.dart::OtherAd"

class "jumpets_app::models::ads::animals::other_ad.dart::_$OtherAdSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +OtherAd deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::ads::animals::other_ad.dart::_$OtherAdSerializer"

class "jumpets_app::models::ads::animals::other_ad.dart::_$OtherAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  +BuiltList<DeliveryStatus> deliveryInfo
  +int hashCode
  +OtherAd rebuild()
  +OtherAdBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::ads::animals::other_ad.dart::_$OtherAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::other_ad.dart::_$OtherAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::other_ad.dart::_$OtherAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::other_ad.dart::_$OtherAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::other_ad.dart::OtherAd" <|-- "jumpets_app::models::ads::animals::other_ad.dart::_$OtherAd"

class "jumpets_app::models::ads::animals::other_ad.dart::OtherAdBuilder" {
  -_$OtherAd _$v
  -String _id
  -DateTime _createdAt
  -ListBuilder<String> _tags
  -ListBuilder<String> _photos
  -User _creator
  -String _name
  -String _description
  -ActivityLevel _activityLevel
  -DateTime _birthDate
  -bool _male
  -double _adoptionTax
  -double _weight
  -ListBuilder<String> _personality
  -String _mustKnow
  -ListBuilder<DeliveryStatus> _deliveryStatuses
  -String _breed
  -ListBuilder<DeliveryStatus> _deliveryInfo
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +ListBuilder<String> personality
  +String mustKnow
  +ListBuilder<DeliveryStatus> deliveryStatuses
  +String breed
  +ListBuilder<DeliveryStatus> deliveryInfo
  -OtherAdBuilder _$this
  +void replace()
  +void update()
  +_$OtherAd build()
}

"jumpets_app::models::ads::animals::other_ad.dart::OtherAdBuilder" o-- "jumpets_app::models::ads::animals::other_ad.dart::_$OtherAd"
"jumpets_app::models::ads::animals::other_ad.dart::OtherAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::animals::other_ad.dart::OtherAdBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::other_ad.dart::OtherAdBuilder" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::other_ad.dart::OtherAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<DeliveryStatus>"
"jumpets_app::models::ads::animals::other_ad.dart::OtherAdBuilder" o-- "jumpets_app::models::ads::animals::other_ad.dart::OtherAdBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::ads::animals::other_ad.dart::OtherAdBuilder"
"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" <|-- "jumpets_app::models::ads::animals::other_ad.dart::OtherAdBuilder"

abstract class "jumpets_app::models::ads::animals::rodent_ad.dart::RodentAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  {static} +Serializer<RodentAd> serializer
  +dynamic toJson()
  {static} +RodentAd fromJson()
}

"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAd" o-- "built_value::serializer.dart::Serializer<RodentAd>"
"jumpets_app::models::ads::animal_ad.dart::AnimalAd" <|-- "jumpets_app::models::ads::animals::rodent_ad.dart::RodentAd"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::ads::animals::rodent_ad.dart::RodentAd"

class "jumpets_app::models::ads::animals::rodent_ad.dart::_$RodentAdSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +RodentAd deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::ads::animals::rodent_ad.dart::_$RodentAdSerializer"

class "jumpets_app::models::ads::animals::rodent_ad.dart::_$RodentAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +BuiltList<String> personality
  +String mustKnow
  +BuiltList<DeliveryStatus> deliveryStatuses
  +String breed
  +BuiltList<DeliveryStatus> deliveryInfo
  +int hashCode
  +RodentAd rebuild()
  +RodentAdBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::ads::animals::rodent_ad.dart::_$RodentAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::animals::rodent_ad.dart::_$RodentAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::rodent_ad.dart::_$RodentAd" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::rodent_ad.dart::_$RodentAd" o-- "built_collection::src::list.dart::BuiltList<DeliveryStatus>"
"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAd" <|-- "jumpets_app::models::ads::animals::rodent_ad.dart::_$RodentAd"

class "jumpets_app::models::ads::animals::rodent_ad.dart::RodentAdBuilder" {
  -_$RodentAd _$v
  -String _id
  -DateTime _createdAt
  -ListBuilder<String> _tags
  -ListBuilder<String> _photos
  -User _creator
  -String _name
  -String _description
  -ActivityLevel _activityLevel
  -DateTime _birthDate
  -bool _male
  -double _adoptionTax
  -double _weight
  -ListBuilder<String> _personality
  -String _mustKnow
  -ListBuilder<DeliveryStatus> _deliveryStatuses
  -String _breed
  -ListBuilder<DeliveryStatus> _deliveryInfo
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +String name
  +String description
  +ActivityLevel activityLevel
  +DateTime birthDate
  +bool male
  +double adoptionTax
  +double weight
  +ListBuilder<String> personality
  +String mustKnow
  +ListBuilder<DeliveryStatus> deliveryStatuses
  +String breed
  +ListBuilder<DeliveryStatus> deliveryInfo
  -RodentAdBuilder _$this
  +void replace()
  +void update()
  +_$RodentAd build()
}

"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAdBuilder" o-- "jumpets_app::models::ads::animals::rodent_ad.dart::_$RodentAd"
"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAdBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAdBuilder" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<DeliveryStatus>"
"jumpets_app::models::ads::animals::rodent_ad.dart::RodentAdBuilder" o-- "jumpets_app::models::ads::animals::rodent_ad.dart::RodentAdBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::ads::animals::rodent_ad.dart::RodentAdBuilder"
"jumpets_app::models::ads::animal_ad.dart::AnimalAdBuilder" <|-- "jumpets_app::models::ads::animals::rodent_ad.dart::RodentAdBuilder"

abstract class "jumpets_app::models::ads::service_ad.dart::ServiceAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String title
  +double priceHour
  +String description
  {static} +Serializer<ServiceAd> serializer
  +dynamic toJson()
  {static} +ServiceAd fromJson()
}

"jumpets_app::models::ads::service_ad.dart::ServiceAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::service_ad.dart::ServiceAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::service_ad.dart::ServiceAd" o-- "built_value::serializer.dart::Serializer<ServiceAd>"
"jumpets_app::models::ads::ad.dart::Ad" <|-- "jumpets_app::models::ads::service_ad.dart::ServiceAd"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::ads::service_ad.dart::ServiceAd"

class "jumpets_app::models::ads::service_ad.dart::_$ServiceAdSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +ServiceAd deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::ads::service_ad.dart::_$ServiceAdSerializer"

class "jumpets_app::models::ads::service_ad.dart::_$ServiceAd" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +String title
  +double priceHour
  +String description
  +int hashCode
  +ServiceAd rebuild()
  +ServiceAdBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::ads::service_ad.dart::_$ServiceAd" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::service_ad.dart::_$ServiceAd" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::service_ad.dart::ServiceAd" <|-- "jumpets_app::models::ads::service_ad.dart::_$ServiceAd"

class "jumpets_app::models::ads::service_ad.dart::ServiceAdBuilder" {
  -_$ServiceAd _$v
  -String _id
  -DateTime _createdAt
  -ListBuilder<String> _tags
  -ListBuilder<String> _photos
  -User _creator
  -String _title
  -double _priceHour
  -String _description
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +String title
  +double priceHour
  +String description
  -ServiceAdBuilder _$this
  +void replace()
  +void update()
  +_$ServiceAd build()
}

"jumpets_app::models::ads::service_ad.dart::ServiceAdBuilder" o-- "jumpets_app::models::ads::service_ad.dart::_$ServiceAd"
"jumpets_app::models::ads::service_ad.dart::ServiceAdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::service_ad.dart::ServiceAdBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::ads::service_ad.dart::ServiceAdBuilder" o-- "jumpets_app::models::ads::service_ad.dart::ServiceAdBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::ads::service_ad.dart::ServiceAdBuilder"
"jumpets_app::models::ads::ad.dart::AdBuilder" <|-- "jumpets_app::models::ads::service_ad.dart::ServiceAdBuilder"

abstract class "jumpets_app::models::ads::ad.dart::Ad" {
  +String id
  +DateTime createdAt
  +BuiltList<String> tags
  +BuiltList<String> photos
  +User creator
  +Ad rebuild()
  +AdBuilder toBuilder()
  {static} +Ad fromJson()
}

"jumpets_app::models::ads::ad.dart::Ad" o-- "built_collection::src::list.dart::BuiltList<String>"
"jumpets_app::models::ads::ad.dart::Ad" o-- "jumpets_app::models::users::user.dart::User"

abstract class "jumpets_app::models::ads::ad.dart::AdBuilder" {
  +String id
  +DateTime createdAt
  +ListBuilder<String> tags
  +ListBuilder<String> photos
  +User creator
  +void replace()
  +void update()
}

"jumpets_app::models::ads::ad.dart::AdBuilder" o-- "built_collection::src::list.dart::ListBuilder<String>"
"jumpets_app::models::ads::ad.dart::AdBuilder" o-- "jumpets_app::models::users::user.dart::User"

abstract class "jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAds" {
  +BuiltList<Ad> ads
  +PageInfo pageInfo
  {static} +Serializer<PaginatedAds> serializer
  +dynamic toJson()
  {static} +PaginatedAds fromJson()
}

"jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAds" o-- "built_collection::src::list.dart::BuiltList<Ad>"
"jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAds" o-- "jumpets_app::models::wrappers::page_info.dart::PageInfo"
"jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAds" o-- "built_value::serializer.dart::Serializer<PaginatedAds>"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAds"

class "jumpets_app::models::wrappers::paginated_ads.dart::_$PaginatedAdsSerializer" {
  +Iterable<Type> types
  +dynamic wireName
  +Iterable serialize()
  +PaginatedAds deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::wrappers::paginated_ads.dart::_$PaginatedAdsSerializer"

class "jumpets_app::models::wrappers::paginated_ads.dart::_$PaginatedAds" {
  +BuiltList<Ad> ads
  +PageInfo pageInfo
  +int hashCode
  +PaginatedAds rebuild()
  +PaginatedAdsBuilder toBuilder()
  +dynamic ==()
  +dynamic toString()
}

"jumpets_app::models::wrappers::paginated_ads.dart::_$PaginatedAds" o-- "built_collection::src::list.dart::BuiltList<Ad>"
"jumpets_app::models::wrappers::paginated_ads.dart::_$PaginatedAds" o-- "jumpets_app::models::wrappers::page_info.dart::PageInfo"
"jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAds" <|-- "jumpets_app::models::wrappers::paginated_ads.dart::_$PaginatedAds"

class "jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAdsBuilder" {
  -_$PaginatedAds _$v
  -ListBuilder<Ad> _ads
  -PageInfoBuilder _pageInfo
  +ListBuilder<Ad> ads
  +PageInfoBuilder pageInfo
  -PaginatedAdsBuilder _$this
  +void replace()
  +void update()
  +_$PaginatedAds build()
}

"jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAdsBuilder" o-- "jumpets_app::models::wrappers::paginated_ads.dart::_$PaginatedAds"
"jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAdsBuilder" o-- "built_collection::src::list.dart::ListBuilder<Ad>"
"jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAdsBuilder" o-- "jumpets_app::models::wrappers::page_info.dart::PageInfoBuilder"
"jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAdsBuilder" o-- "jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAdsBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAdsBuilder"

abstract class "jumpets_app::models::wrappers::auth_data.dart::AuthData" {
  +User user
  +dynamic token
  +int tokenExpiration
  {static} +Serializer<AuthData> serializer
  +dynamic toJson()
  {static} +AuthData fromJson()
}

"jumpets_app::models::wrappers::auth_data.dart::AuthData" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::wrappers::auth_data.dart::AuthData" o-- "built_value::serializer.dart::Serializer<AuthData>"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::wrappers::auth_data.dart::AuthData"

class "jumpets_app::models::wrappers::auth_data.dart::_$AuthDataSerializer" {
  +Iterable<Type> types
  +dynamic wireName
  +Iterable serialize()
  +AuthData deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::wrappers::auth_data.dart::_$AuthDataSerializer"

class "jumpets_app::models::wrappers::auth_data.dart::_$AuthData" {
  +User user
  +dynamic token
  +int tokenExpiration
  +int hashCode
  +AuthData rebuild()
  +AuthDataBuilder toBuilder()
  +dynamic ==()
  +dynamic toString()
}

"jumpets_app::models::wrappers::auth_data.dart::_$AuthData" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::wrappers::auth_data.dart::AuthData" <|-- "jumpets_app::models::wrappers::auth_data.dart::_$AuthData"

class "jumpets_app::models::wrappers::auth_data.dart::AuthDataBuilder" {
  -_$AuthData _$v
  -User _user
  -dynamic _token
  -int _tokenExpiration
  +User user
  +dynamic token
  +int tokenExpiration
  -AuthDataBuilder _$this
  +void replace()
  +void update()
  +_$AuthData build()
}

"jumpets_app::models::wrappers::auth_data.dart::AuthDataBuilder" o-- "jumpets_app::models::wrappers::auth_data.dart::_$AuthData"
"jumpets_app::models::wrappers::auth_data.dart::AuthDataBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::wrappers::auth_data.dart::AuthDataBuilder" o-- "jumpets_app::models::wrappers::auth_data.dart::AuthDataBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::wrappers::auth_data.dart::AuthDataBuilder"

class "jumpets_app::models::wrappers::auth_status.dart::AuthenticationStatus" {
  +int index
  {static} +List<AuthenticationStatus> values
  {static} +AuthenticationStatus unknown
  {static} +AuthenticationStatus authenticated
  {static} +AuthenticationStatus unauthenticated
}

"jumpets_app::models::wrappers::auth_status.dart::AuthenticationStatus" o-- "jumpets_app::models::wrappers::auth_status.dart::AuthenticationStatus"

class "jumpets_app::models::wrappers::auth_status.dart::AuthStatus" {
  +AuthData authData
  +AuthenticationStatus status
  +AuthStatus copyWith()
}

"jumpets_app::models::wrappers::auth_status.dart::AuthStatus" o-- "jumpets_app::models::wrappers::auth_data.dart::AuthData"
"jumpets_app::models::wrappers::auth_status.dart::AuthStatus" o-- "jumpets_app::models::wrappers::auth_status.dart::AuthenticationStatus"

abstract class "jumpets_app::models::wrappers::page_info.dart::PageInfo" {
  +dynamic endCursor
  +dynamic startCursor
  +dynamic hasNextPage
  +dynamic hasPreviousPage
  {static} +Serializer<PageInfo> serializer
  +dynamic toJson()
  {static} +PageInfo fromJson()
}

"jumpets_app::models::wrappers::page_info.dart::PageInfo" o-- "built_value::serializer.dart::Serializer<PageInfo>"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::wrappers::page_info.dart::PageInfo"

class "jumpets_app::models::wrappers::page_info.dart::_$PageInfoSerializer" {
  +Iterable<Type> types
  +dynamic wireName
  +Iterable serialize()
  +PageInfo deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::wrappers::page_info.dart::_$PageInfoSerializer"

class "jumpets_app::models::wrappers::page_info.dart::_$PageInfo" {
  +dynamic endCursor
  +dynamic startCursor
  +dynamic hasNextPage
  +dynamic hasPreviousPage
  +int hashCode
  +PageInfo rebuild()
  +PageInfoBuilder toBuilder()
  +dynamic ==()
  +dynamic toString()
}

"jumpets_app::models::wrappers::page_info.dart::PageInfo" <|-- "jumpets_app::models::wrappers::page_info.dart::_$PageInfo"

class "jumpets_app::models::wrappers::page_info.dart::PageInfoBuilder" {
  -_$PageInfo _$v
  -dynamic _endCursor
  -dynamic _startCursor
  -dynamic _hasNextPage
  -dynamic _hasPreviousPage
  +dynamic endCursor
  +dynamic startCursor
  +dynamic hasNextPage
  +dynamic hasPreviousPage
  -PageInfoBuilder _$this
  +void replace()
  +void update()
  +_$PageInfo build()
}

"jumpets_app::models::wrappers::page_info.dart::PageInfoBuilder" o-- "jumpets_app::models::wrappers::page_info.dart::_$PageInfo"
"jumpets_app::models::wrappers::page_info.dart::PageInfoBuilder" o-- "jumpets_app::models::wrappers::page_info.dart::PageInfoBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::wrappers::page_info.dart::PageInfoBuilder"

class "jumpets_app::models::forms::ad_forms.dart::AdStringValidationError" {
  +int index
  {static} +List<AdStringValidationError> values
  {static} +AdStringValidationError empty
}

"jumpets_app::models::forms::ad_forms.dart::AdStringValidationError" o-- "jumpets_app::models::forms::ad_forms.dart::AdStringValidationError"

class "jumpets_app::models::forms::ad_forms.dart::AdDoubleValidationError" {
  +int index
  {static} +List<AdDoubleValidationError> values
  {static} +AdDoubleValidationError invalid
}

"jumpets_app::models::forms::ad_forms.dart::AdDoubleValidationError" o-- "jumpets_app::models::forms::ad_forms.dart::AdDoubleValidationError"

class "jumpets_app::models::forms::ad_forms.dart::AdString" {
  +AdStringValidationError validator()
}

"formz::formz.dart::FormzInput<T, E>" <|-- "jumpets_app::models::forms::ad_forms.dart::AdString"

class "jumpets_app::models::forms::ad_forms.dart::AdDouble" {
  +AdDoubleValidationError validator()
}

"formz::formz.dart::FormzInput<T, E>" <|-- "jumpets_app::models::forms::ad_forms.dart::AdDouble"

class "jumpets_app::models::forms::user_forms.dart::NameValidationError" {
  +int index
  {static} +List<NameValidationError> values
  {static} +NameValidationError empty
}

"jumpets_app::models::forms::user_forms.dart::NameValidationError" o-- "jumpets_app::models::forms::user_forms.dart::NameValidationError"

class "jumpets_app::models::forms::user_forms.dart::AddressValidationError" {
  +int index
  {static} +List<AddressValidationError> values
  {static} +AddressValidationError empty
}

"jumpets_app::models::forms::user_forms.dart::AddressValidationError" o-- "jumpets_app::models::forms::user_forms.dart::AddressValidationError"

class "jumpets_app::models::forms::user_forms.dart::PhoneValidationError" {
  +int index
  {static} +List<PhoneValidationError> values
  {static} +PhoneValidationError empty
}

"jumpets_app::models::forms::user_forms.dart::PhoneValidationError" o-- "jumpets_app::models::forms::user_forms.dart::PhoneValidationError"

class "jumpets_app::models::forms::user_forms.dart::WebValidationError" {
  +int index
  {static} +List<WebValidationError> values
  {static} +WebValidationError empty
}

"jumpets_app::models::forms::user_forms.dart::WebValidationError" o-- "jumpets_app::models::forms::user_forms.dart::WebValidationError"

class "jumpets_app::models::forms::user_forms.dart::EmailValidationError" {
  +int index
  {static} +List<EmailValidationError> values
  {static} +EmailValidationError empty
}

"jumpets_app::models::forms::user_forms.dart::EmailValidationError" o-- "jumpets_app::models::forms::user_forms.dart::EmailValidationError"

class "jumpets_app::models::forms::user_forms.dart::PasswordNullableValidationError" {
  +int index
  {static} +List<PasswordNullableValidationError> values
  {static} +PasswordNullableValidationError empty
}

"jumpets_app::models::forms::user_forms.dart::PasswordNullableValidationError" o-- "jumpets_app::models::forms::user_forms.dart::PasswordNullableValidationError"

class "jumpets_app::models::forms::user_forms.dart::PasswordValidationError" {
  +int index
  {static} +List<PasswordValidationError> values
  {static} +PasswordValidationError empty
}

"jumpets_app::models::forms::user_forms.dart::PasswordValidationError" o-- "jumpets_app::models::forms::user_forms.dart::PasswordValidationError"

class "jumpets_app::models::forms::user_forms.dart::CommentValidationError" {
  +int index
  {static} +List<CommentValidationError> values
  {static} +CommentValidationError empty
  {static} +CommentValidationError too_short
}

"jumpets_app::models::forms::user_forms.dart::CommentValidationError" o-- "jumpets_app::models::forms::user_forms.dart::CommentValidationError"

class "jumpets_app::models::forms::user_forms.dart::Name" {
  +NameValidationError validator()
}

"formz::formz.dart::FormzInput<T, E>" <|-- "jumpets_app::models::forms::user_forms.dart::Name"

class "jumpets_app::models::forms::user_forms.dart::Address" {
  +AddressValidationError validator()
}

"formz::formz.dart::FormzInput<T, E>" <|-- "jumpets_app::models::forms::user_forms.dart::Address"

class "jumpets_app::models::forms::user_forms.dart::Phone" {
  +PhoneValidationError validator()
}

"formz::formz.dart::FormzInput<T, E>" <|-- "jumpets_app::models::forms::user_forms.dart::Phone"

class "jumpets_app::models::forms::user_forms.dart::Web" {
  +WebValidationError validator()
}

"formz::formz.dart::FormzInput<T, E>" <|-- "jumpets_app::models::forms::user_forms.dart::Web"

class "jumpets_app::models::forms::user_forms.dart::Email" {
  +EmailValidationError validator()
}

"formz::formz.dart::FormzInput<T, E>" <|-- "jumpets_app::models::forms::user_forms.dart::Email"

class "jumpets_app::models::forms::user_forms.dart::PasswordNullable" {
  +PasswordNullableValidationError validator()
}

"formz::formz.dart::FormzInput<T, E>" <|-- "jumpets_app::models::forms::user_forms.dart::PasswordNullable"

class "jumpets_app::models::forms::user_forms.dart::Password" {
  +PasswordValidationError validator()
}

"formz::formz.dart::FormzInput<T, E>" <|-- "jumpets_app::models::forms::user_forms.dart::Password"

class "jumpets_app::models::forms::user_forms.dart::Comment" {
  +CommentValidationError validator()
}

"formz::formz.dart::FormzInput<T, E>" <|-- "jumpets_app::models::forms::user_forms.dart::Comment"

class "jumpets_app::models::enums::activity_level.dart::ActivityLevel" {
  {static} +ActivityLevel HIGH
  {static} +ActivityLevel MEDIUM
  {static} +ActivityLevel LOW
  {static} +BuiltSet<ActivityLevel> values
  {static} +Serializer<ActivityLevel> serializer
  {static} +ActivityLevel valueOf()
  +String serialize()
  {static} +ActivityLevel deserialize()
}

"jumpets_app::models::enums::activity_level.dart::ActivityLevel" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::models::enums::activity_level.dart::ActivityLevel" o-- "built_collection::src::set.dart::BuiltSet<ActivityLevel>"
"jumpets_app::models::enums::activity_level.dart::ActivityLevel" o-- "built_value::serializer.dart::Serializer<ActivityLevel>"
"built_value::built_value.dart::EnumClass" <|-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"

class "jumpets_app::models::enums::activity_level.dart::_$ActivityLevelSerializer" {
  +Iterable<Type> types
  +String wireName
  +Object serialize()
  +ActivityLevel deserialize()
}

"built_value::serializer.dart::PrimitiveSerializer<T>" <|-- "jumpets_app::models::enums::activity_level.dart::_$ActivityLevelSerializer"

class "jumpets_app::models::enums::user_types.dart::UserType" {
  {static} +UserType PROTECTORA
  {static} +UserType PROFESIONAL
  {static} +UserType PARTICULAR
  {static} +BuiltSet<UserType> values
  {static} +Serializer<UserType> serializer
  {static} +UserType valueOf()
  +String serialize()
  {static} +UserType deserialize()
}

"jumpets_app::models::enums::user_types.dart::UserType" o-- "jumpets_app::models::enums::user_types.dart::UserType"
"jumpets_app::models::enums::user_types.dart::UserType" o-- "built_collection::src::set.dart::BuiltSet<UserType>"
"jumpets_app::models::enums::user_types.dart::UserType" o-- "built_value::serializer.dart::Serializer<UserType>"
"built_value::built_value.dart::EnumClass" <|-- "jumpets_app::models::enums::user_types.dart::UserType"

class "jumpets_app::models::enums::user_types.dart::_$UserTypeSerializer" {
  +Iterable<Type> types
  +String wireName
  +Object serialize()
  +UserType deserialize()
}

"built_value::serializer.dart::PrimitiveSerializer<T>" <|-- "jumpets_app::models::enums::user_types.dart::_$UserTypeSerializer"

class "jumpets_app::models::enums::delivery_status.dart::DeliveryStatus" {
  {static} +DeliveryStatus VACCINATED
  {static} +DeliveryStatus DEWORMED
  {static} +DeliveryStatus HEALTHY
  {static} +DeliveryStatus STERILIZED
  {static} +DeliveryStatus IDENTIFIED
  {static} +DeliveryStatus MICROCHIP
  {static} +BuiltSet<DeliveryStatus> values
  {static} +Serializer<DeliveryStatus> serializer
  {static} +DeliveryStatus valueOf()
  +String serialize()
  {static} +DeliveryStatus deserialize()
}

"jumpets_app::models::enums::delivery_status.dart::DeliveryStatus" o-- "jumpets_app::models::enums::delivery_status.dart::DeliveryStatus"
"jumpets_app::models::enums::delivery_status.dart::DeliveryStatus" o-- "built_collection::src::set.dart::BuiltSet<DeliveryStatus>"
"jumpets_app::models::enums::delivery_status.dart::DeliveryStatus" o-- "built_value::serializer.dart::Serializer<DeliveryStatus>"
"built_value::built_value.dart::EnumClass" <|-- "jumpets_app::models::enums::delivery_status.dart::DeliveryStatus"

class "jumpets_app::models::enums::delivery_status.dart::_$DeliveryStatusSerializer" {
  +Iterable<Type> types
  +String wireName
  +Object serialize()
  +DeliveryStatus deserialize()
}

"built_value::serializer.dart::PrimitiveSerializer<T>" <|-- "jumpets_app::models::enums::delivery_status.dart::_$DeliveryStatusSerializer"

class "jumpets_app::models::enums::animal_types.dart::AnimalType" {
  {static} +AnimalType DOG
  {static} +AnimalType CAT
  {static} +AnimalType BUNNY
  {static} +AnimalType REPTILE
  {static} +AnimalType OTHER
  {static} +AnimalType BIRD
  {static} +AnimalType RODENT
  {static} +AnimalType FISH
  {static} +BuiltSet<AnimalType> values
  {static} +Serializer<AnimalType> serializer
  {static} +AnimalType valueOf()
  +String serialize()
  {static} +AnimalType deserialize()
}

"jumpets_app::models::enums::animal_types.dart::AnimalType" o-- "jumpets_app::models::enums::animal_types.dart::AnimalType"
"jumpets_app::models::enums::animal_types.dart::AnimalType" o-- "built_collection::src::set.dart::BuiltSet<AnimalType>"
"jumpets_app::models::enums::animal_types.dart::AnimalType" o-- "built_value::serializer.dart::Serializer<AnimalType>"
"built_value::built_value.dart::EnumClass" <|-- "jumpets_app::models::enums::animal_types.dart::AnimalType"

class "jumpets_app::models::enums::animal_types.dart::_$AnimalTypeSerializer" {
  +Iterable<Type> types
  +String wireName
  +Object serialize()
  +AnimalType deserialize()
}

"built_value::serializer.dart::PrimitiveSerializer<T>" <|-- "jumpets_app::models::enums::animal_types.dart::_$AnimalTypeSerializer"

class "jumpets_app::models::enums::categories.dart::Category" {
  {static} +Category SHELTERS
  {static} +Category PRODUCTS
  {static} +Category SERVICES
  {static} +Category DOGS
  {static} +Category CATS
  {static} +Category BUNNIES
  {static} +Category REPTILES
  {static} +Category OTHERS
  {static} +Category BIRDS
  {static} +Category RODENTS
  {static} +Category FISHES
  {static} +BuiltSet<Category> values
  {static} +Serializer<Category> serializer
  {static} +Category valueOf()
  +String serialize()
  {static} +Category deserialize()
}

"jumpets_app::models::enums::categories.dart::Category" o-- "jumpets_app::models::enums::categories.dart::Category"
"jumpets_app::models::enums::categories.dart::Category" o-- "built_collection::src::set.dart::BuiltSet<Category>"
"jumpets_app::models::enums::categories.dart::Category" o-- "built_value::serializer.dart::Serializer<Category>"
"built_value::built_value.dart::EnumClass" <|-- "jumpets_app::models::enums::categories.dart::Category"

class "jumpets_app::models::enums::categories.dart::_$CategorySerializer" {
  +Iterable<Type> types
  +String wireName
  +Object serialize()
  +Category deserialize()
}

"built_value::serializer.dart::PrimitiveSerializer<T>" <|-- "jumpets_app::models::enums::categories.dart::_$CategorySerializer"

class "jumpets_app::models::enums::dog_size.dart::DogSize" {
  {static} +DogSize BIG
  {static} +DogSize MEDIUM
  {static} +DogSize SMALL
  {static} +BuiltSet<DogSize> values
  {static} +Serializer<DogSize> serializer
  {static} +DogSize valueOf()
  +String serialize()
  {static} +DogSize deserialize()
}

"jumpets_app::models::enums::dog_size.dart::DogSize" o-- "jumpets_app::models::enums::dog_size.dart::DogSize"
"jumpets_app::models::enums::dog_size.dart::DogSize" o-- "built_collection::src::set.dart::BuiltSet<DogSize>"
"jumpets_app::models::enums::dog_size.dart::DogSize" o-- "built_value::serializer.dart::Serializer<DogSize>"
"built_value::built_value.dart::EnumClass" <|-- "jumpets_app::models::enums::dog_size.dart::DogSize"

class "jumpets_app::models::enums::dog_size.dart::_$DogSizeSerializer" {
  +Iterable<Type> types
  +String wireName
  +Object serialize()
  +DogSize deserialize()
}

"built_value::serializer.dart::PrimitiveSerializer<T>" <|-- "jumpets_app::models::enums::dog_size.dart::_$DogSizeSerializer"

class "jumpets_app::models::serializers::user_serializer.dart::UserSerializer" {
  +Iterable<Type> types
  +String wireName
  +User deserialize()
  +Iterable serialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::serializers::user_serializer.dart::UserSerializer"

class "jumpets_app::models::serializers::date_time_serializer_plugin.dart::DateTimeSerializerPlugin" {
  +Object beforeSerialize()
  +Object afterSerialize()
  +Object beforeDeserialize()
  +Object afterDeserialize()
}

"built_value::serializer.dart::SerializerPlugin" <|-- "jumpets_app::models::serializers::date_time_serializer_plugin.dart::DateTimeSerializerPlugin"

abstract class "jumpets_app::models::users::protectora.dart::Protectora" {
  +String id
  +String name
  +String thumbnail
  +String address
  +int phone
  +String email
  +String password
  +DateTime createdAt
  +DateTime updatedAt
  +BuiltList<Valuation> valuations
  +String web
  +int distance
  +int travelTime
  {static} +Serializer<Protectora> serializer
  +dynamic toJson()
  {static} +Protectora fromJson()
}

"jumpets_app::models::users::protectora.dart::Protectora" o-- "built_collection::src::list.dart::BuiltList<Valuation>"
"jumpets_app::models::users::protectora.dart::Protectora" o-- "built_value::serializer.dart::Serializer<Protectora>"
"jumpets_app::models::users::user.dart::User" <|-- "jumpets_app::models::users::protectora.dart::Protectora"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::users::protectora.dart::Protectora"

class "jumpets_app::models::users::protectora.dart::_$ProtectoraSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +Protectora deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::users::protectora.dart::_$ProtectoraSerializer"

class "jumpets_app::models::users::protectora.dart::_$Protectora" {
  +String id
  +String name
  +String thumbnail
  +String address
  +int phone
  +String email
  +String password
  +DateTime createdAt
  +DateTime updatedAt
  +BuiltList<Valuation> valuations
  +String web
  +int distance
  +int travelTime
  +int hashCode
  +Protectora rebuild()
  +ProtectoraBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::users::protectora.dart::_$Protectora" o-- "built_collection::src::list.dart::BuiltList<Valuation>"
"jumpets_app::models::users::protectora.dart::Protectora" <|-- "jumpets_app::models::users::protectora.dart::_$Protectora"

class "jumpets_app::models::users::protectora.dart::ProtectoraBuilder" {
  -_$Protectora _$v
  -String _id
  -String _name
  -String _thumbnail
  -String _address
  -int _phone
  -String _email
  -String _password
  -DateTime _createdAt
  -DateTime _updatedAt
  -ListBuilder<Valuation> _valuations
  -String _web
  -int _distance
  -int _travelTime
  +String id
  +String name
  +String thumbnail
  +String address
  +int phone
  +String email
  +String password
  +DateTime createdAt
  +DateTime updatedAt
  +ListBuilder<Valuation> valuations
  +String web
  +int distance
  +int travelTime
  -ProtectoraBuilder _$this
  +void replace()
  +void update()
  +_$Protectora build()
}

"jumpets_app::models::users::protectora.dart::ProtectoraBuilder" o-- "jumpets_app::models::users::protectora.dart::_$Protectora"
"jumpets_app::models::users::protectora.dart::ProtectoraBuilder" o-- "built_collection::src::list.dart::ListBuilder<Valuation>"
"jumpets_app::models::users::protectora.dart::ProtectoraBuilder" o-- "jumpets_app::models::users::protectora.dart::ProtectoraBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::users::protectora.dart::ProtectoraBuilder"
"jumpets_app::models::users::user.dart::UserBuilder" <|-- "jumpets_app::models::users::protectora.dart::ProtectoraBuilder"

abstract class "jumpets_app::models::users::user.dart::User" {
  +String id
  +String name
  +String thumbnail
  +String address
  +int phone
  +String email
  +String password
  +DateTime createdAt
  +DateTime updatedAt
  +BuiltList<Valuation> valuations
  {static} +Serializer<User> serializer
  +User rebuild()
  +UserBuilder toBuilder()
  {static} +User fromJson()
}

"jumpets_app::models::users::user.dart::User" o-- "built_collection::src::list.dart::BuiltList<Valuation>"
"jumpets_app::models::users::user.dart::User" o-- "built_value::serializer.dart::Serializer<User>"

abstract class "jumpets_app::models::users::user.dart::UserBuilder" {
  +String id
  +String name
  +String thumbnail
  +String address
  +int phone
  +String email
  +String password
  +DateTime createdAt
  +DateTime updatedAt
  +ListBuilder<Valuation> valuations
  +void replace()
  +void update()
}

"jumpets_app::models::users::user.dart::UserBuilder" o-- "built_collection::src::list.dart::ListBuilder<Valuation>"

abstract class "jumpets_app::models::users::valuation.dart::Valuation" {
  +User author
  +dynamic comment
  +dynamic value
  +dynamic createdAt
  +dynamic updatedAt
  {static} +Serializer<Valuation> serializer
  +dynamic toJson()
  {static} +Valuation fromJson()
}

"jumpets_app::models::users::valuation.dart::Valuation" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::users::valuation.dart::Valuation" o-- "built_value::serializer.dart::Serializer<Valuation>"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::users::valuation.dart::Valuation"

class "jumpets_app::models::users::valuation.dart::_$ValuationSerializer" {
  +Iterable<Type> types
  +dynamic wireName
  +Iterable serialize()
  +Valuation deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::users::valuation.dart::_$ValuationSerializer"

class "jumpets_app::models::users::valuation.dart::_$Valuation" {
  +User author
  +dynamic comment
  +dynamic value
  +dynamic createdAt
  +dynamic updatedAt
  +int hashCode
  +Valuation rebuild()
  +ValuationBuilder toBuilder()
  +dynamic ==()
  +dynamic toString()
}

"jumpets_app::models::users::valuation.dart::_$Valuation" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::users::valuation.dart::Valuation" <|-- "jumpets_app::models::users::valuation.dart::_$Valuation"

class "jumpets_app::models::users::valuation.dart::ValuationBuilder" {
  -_$Valuation _$v
  -User _author
  -dynamic _comment
  -dynamic _value
  -dynamic _createdAt
  -dynamic _updatedAt
  +User author
  +dynamic comment
  +dynamic value
  +dynamic createdAt
  +dynamic updatedAt
  -ValuationBuilder _$this
  +void replace()
  +void update()
  +_$Valuation build()
}

"jumpets_app::models::users::valuation.dart::ValuationBuilder" o-- "jumpets_app::models::users::valuation.dart::_$Valuation"
"jumpets_app::models::users::valuation.dart::ValuationBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::users::valuation.dart::ValuationBuilder" o-- "jumpets_app::models::users::valuation.dart::ValuationBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::users::valuation.dart::ValuationBuilder"

abstract class "jumpets_app::models::users::profesional.dart::Profesional" {
  +String id
  +String name
  +String thumbnail
  +String address
  +int phone
  +String email
  +String password
  +DateTime createdAt
  +DateTime updatedAt
  +BuiltList<Valuation> valuations
  +String web
  {static} +Serializer<Profesional> serializer
  +dynamic toJson()
  {static} +Profesional fromJson()
}

"jumpets_app::models::users::profesional.dart::Profesional" o-- "built_collection::src::list.dart::BuiltList<Valuation>"
"jumpets_app::models::users::profesional.dart::Profesional" o-- "built_value::serializer.dart::Serializer<Profesional>"
"jumpets_app::models::users::user.dart::User" <|-- "jumpets_app::models::users::profesional.dart::Profesional"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::users::profesional.dart::Profesional"

class "jumpets_app::models::users::profesional.dart::_$ProfesionalSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +Profesional deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::users::profesional.dart::_$ProfesionalSerializer"

class "jumpets_app::models::users::profesional.dart::_$Profesional" {
  +String id
  +String name
  +String thumbnail
  +String address
  +int phone
  +String email
  +String password
  +DateTime createdAt
  +DateTime updatedAt
  +BuiltList<Valuation> valuations
  +String web
  +int hashCode
  +Profesional rebuild()
  +ProfesionalBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::users::profesional.dart::_$Profesional" o-- "built_collection::src::list.dart::BuiltList<Valuation>"
"jumpets_app::models::users::profesional.dart::Profesional" <|-- "jumpets_app::models::users::profesional.dart::_$Profesional"

class "jumpets_app::models::users::profesional.dart::ProfesionalBuilder" {
  -_$Profesional _$v
  -String _id
  -String _name
  -String _thumbnail
  -String _address
  -int _phone
  -String _email
  -String _password
  -DateTime _createdAt
  -DateTime _updatedAt
  -ListBuilder<Valuation> _valuations
  -String _web
  +String id
  +String name
  +String thumbnail
  +String address
  +int phone
  +String email
  +String password
  +DateTime createdAt
  +DateTime updatedAt
  +ListBuilder<Valuation> valuations
  +String web
  -ProfesionalBuilder _$this
  +void replace()
  +void update()
  +_$Profesional build()
}

"jumpets_app::models::users::profesional.dart::ProfesionalBuilder" o-- "jumpets_app::models::users::profesional.dart::_$Profesional"
"jumpets_app::models::users::profesional.dart::ProfesionalBuilder" o-- "built_collection::src::list.dart::ListBuilder<Valuation>"
"jumpets_app::models::users::profesional.dart::ProfesionalBuilder" o-- "jumpets_app::models::users::profesional.dart::ProfesionalBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::users::profesional.dart::ProfesionalBuilder"
"jumpets_app::models::users::user.dart::UserBuilder" <|-- "jumpets_app::models::users::profesional.dart::ProfesionalBuilder"

abstract class "jumpets_app::models::users::particular.dart::Particular" {
  +String id
  +String name
  +String thumbnail
  +String address
  +int phone
  +String email
  +String password
  +DateTime createdAt
  +DateTime updatedAt
  +BuiltList<Valuation> valuations
  {static} +Serializer<Particular> serializer
  +dynamic toJson()
  {static} +Particular fromJson()
}

"jumpets_app::models::users::particular.dart::Particular" o-- "built_collection::src::list.dart::BuiltList<Valuation>"
"jumpets_app::models::users::particular.dart::Particular" o-- "built_value::serializer.dart::Serializer<Particular>"
"jumpets_app::models::users::user.dart::User" <|-- "jumpets_app::models::users::particular.dart::Particular"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::users::particular.dart::Particular"

class "jumpets_app::models::users::particular.dart::_$ParticularSerializer" {
  +Iterable<Type> types
  +String wireName
  +Iterable serialize()
  +Particular deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::users::particular.dart::_$ParticularSerializer"

class "jumpets_app::models::users::particular.dart::_$Particular" {
  +String id
  +String name
  +String thumbnail
  +String address
  +int phone
  +String email
  +String password
  +DateTime createdAt
  +DateTime updatedAt
  +BuiltList<Valuation> valuations
  +int hashCode
  +Particular rebuild()
  +ParticularBuilder toBuilder()
  +bool ==()
  +String toString()
}

"jumpets_app::models::users::particular.dart::_$Particular" o-- "built_collection::src::list.dart::BuiltList<Valuation>"
"jumpets_app::models::users::particular.dart::Particular" <|-- "jumpets_app::models::users::particular.dart::_$Particular"

class "jumpets_app::models::users::particular.dart::ParticularBuilder" {
  -_$Particular _$v
  -String _id
  -String _name
  -String _thumbnail
  -String _address
  -int _phone
  -String _email
  -String _password
  -DateTime _createdAt
  -DateTime _updatedAt
  -ListBuilder<Valuation> _valuations
  +String id
  +String name
  +String thumbnail
  +String address
  +int phone
  +String email
  +String password
  +DateTime createdAt
  +DateTime updatedAt
  +ListBuilder<Valuation> valuations
  -ParticularBuilder _$this
  +void replace()
  +void update()
  +_$Particular build()
}

"jumpets_app::models::users::particular.dart::ParticularBuilder" o-- "jumpets_app::models::users::particular.dart::_$Particular"
"jumpets_app::models::users::particular.dart::ParticularBuilder" o-- "built_collection::src::list.dart::ListBuilder<Valuation>"
"jumpets_app::models::users::particular.dart::ParticularBuilder" o-- "jumpets_app::models::users::particular.dart::ParticularBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::users::particular.dart::ParticularBuilder"
"jumpets_app::models::users::user.dart::UserBuilder" <|-- "jumpets_app::models::users::particular.dart::ParticularBuilder"

abstract class "jumpets_app::models::chats::room.dart::Room" {
  +dynamic id
  +User user1
  +User user2
  +BuiltList<Message> messages
  +dynamic createdAt
  +dynamic updatedAt
  {static} +Serializer<Room> serializer
  +dynamic toJson()
  {static} +Room fromJson()
}

"jumpets_app::models::chats::room.dart::Room" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::chats::room.dart::Room" o-- "built_collection::src::list.dart::BuiltList<Message>"
"jumpets_app::models::chats::room.dart::Room" o-- "built_value::serializer.dart::Serializer<Room>"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::chats::room.dart::Room"

class "jumpets_app::models::chats::room.dart::_$RoomSerializer" {
  +Iterable<Type> types
  +dynamic wireName
  +Iterable serialize()
  +Room deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::chats::room.dart::_$RoomSerializer"

class "jumpets_app::models::chats::room.dart::_$Room" {
  +dynamic id
  +User user1
  +User user2
  +BuiltList<Message> messages
  +dynamic createdAt
  +dynamic updatedAt
  +int hashCode
  +Room rebuild()
  +RoomBuilder toBuilder()
  +dynamic ==()
  +dynamic toString()
}

"jumpets_app::models::chats::room.dart::_$Room" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::chats::room.dart::_$Room" o-- "built_collection::src::list.dart::BuiltList<Message>"
"jumpets_app::models::chats::room.dart::Room" <|-- "jumpets_app::models::chats::room.dart::_$Room"

class "jumpets_app::models::chats::room.dart::RoomBuilder" {
  -_$Room _$v
  -dynamic _id
  -User _user1
  -User _user2
  -ListBuilder<Message> _messages
  -dynamic _createdAt
  -dynamic _updatedAt
  +dynamic id
  +User user1
  +User user2
  +ListBuilder<Message> messages
  +dynamic createdAt
  +dynamic updatedAt
  -RoomBuilder _$this
  +void replace()
  +void update()
  +_$Room build()
}

"jumpets_app::models::chats::room.dart::RoomBuilder" o-- "jumpets_app::models::chats::room.dart::_$Room"
"jumpets_app::models::chats::room.dart::RoomBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::chats::room.dart::RoomBuilder" o-- "built_collection::src::list.dart::ListBuilder<Message>"
"jumpets_app::models::chats::room.dart::RoomBuilder" o-- "jumpets_app::models::chats::room.dart::RoomBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::chats::room.dart::RoomBuilder"

abstract class "jumpets_app::models::chats::message.dart::Message" {
  +dynamic id
  +dynamic text
  +Ad ad
  +User sender
  +dynamic createdAt
  +dynamic updatedAt
  {static} +Serializer<Message> serializer
  +dynamic toJson()
  {static} +Message fromJson()
}

"jumpets_app::models::chats::message.dart::Message" o-- "jumpets_app::models::ads::ad.dart::Ad"
"jumpets_app::models::chats::message.dart::Message" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::chats::message.dart::Message" o-- "built_value::serializer.dart::Serializer<Message>"
"built_value::built_value.dart::Built<V, B>" <|-- "jumpets_app::models::chats::message.dart::Message"

class "jumpets_app::models::chats::message.dart::_$MessageSerializer" {
  +Iterable<Type> types
  +dynamic wireName
  +Iterable serialize()
  +Message deserialize()
}

"built_value::serializer.dart::StructuredSerializer<T>" <|-- "jumpets_app::models::chats::message.dart::_$MessageSerializer"

class "jumpets_app::models::chats::message.dart::_$Message" {
  +dynamic id
  +dynamic text
  +Ad ad
  +User sender
  +dynamic createdAt
  +dynamic updatedAt
  +int hashCode
  +Message rebuild()
  +MessageBuilder toBuilder()
  +dynamic ==()
  +dynamic toString()
}

"jumpets_app::models::chats::message.dart::_$Message" o-- "jumpets_app::models::ads::ad.dart::Ad"
"jumpets_app::models::chats::message.dart::_$Message" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::chats::message.dart::Message" <|-- "jumpets_app::models::chats::message.dart::_$Message"

class "jumpets_app::models::chats::message.dart::MessageBuilder" {
  -_$Message _$v
  -dynamic _id
  -dynamic _text
  -Ad _ad
  -User _sender
  -dynamic _createdAt
  -dynamic _updatedAt
  +dynamic id
  +dynamic text
  +Ad ad
  +User sender
  +dynamic createdAt
  +dynamic updatedAt
  -MessageBuilder _$this
  +void replace()
  +void update()
  +_$Message build()
}

"jumpets_app::models::chats::message.dart::MessageBuilder" o-- "jumpets_app::models::chats::message.dart::_$Message"
"jumpets_app::models::chats::message.dart::MessageBuilder" o-- "jumpets_app::models::ads::ad.dart::Ad"
"jumpets_app::models::chats::message.dart::MessageBuilder" o-- "jumpets_app::models::users::user.dart::User"
"jumpets_app::models::chats::message.dart::MessageBuilder" o-- "jumpets_app::models::chats::message.dart::MessageBuilder"
"built_value::built_value.dart::Builder<V, B>" <|-- "jumpets_app::models::chats::message.dart::MessageBuilder"

class "jumpets_app::models::errors::network_error.dart::InvalidArgsError" {
  +String msg
  +String fromError
  +String toString()
}

"dart::core::Error" <|-- "jumpets_app::models::errors::network_error.dart::InvalidArgsError"

class "jumpets_app::models::errors::network_error.dart::NetworkError" {
  +int status
  +String msg
  +String fromError
  +String toString()
}

"dart::core::Error" <|-- "jumpets_app::models::errors::network_error.dart::NetworkError"

class "jumpets_app::models::errors::network_error.dart::FetchDataError" {
}

"jumpets_app::models::errors::network_error.dart::NetworkError" <|-- "jumpets_app::models::errors::network_error.dart::FetchDataError"

class "jumpets_app::models::errors::network_error.dart::BadRequestError" {
}

"jumpets_app::models::errors::network_error.dart::NetworkError" <|-- "jumpets_app::models::errors::network_error.dart::BadRequestError"

class "jumpets_app::models::errors::network_error.dart::UnauthorisedError" {
}

"jumpets_app::models::errors::network_error.dart::NetworkError" <|-- "jumpets_app::models::errors::network_error.dart::UnauthorisedError"

class "jumpets_app::models::errors::network_error.dart::InvalidInputError" {
}

"jumpets_app::models::errors::network_error.dart::NetworkError" <|-- "jumpets_app::models::errors::network_error.dart::InvalidInputError"

newpage

class "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsBloc" {
  +AdsRepository repository
  +ErrorHandlerBloc errorBloc
  +Stream mapEventToState()
}

"jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsBloc" o-- "jumpets_app::data::repositories::ads_repository.dart::AdsRepository"
"jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsBloc"

abstract class "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsEvent" {
}

class "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::AdsSearched" {
  +dynamic text
  +DogSize size
  +dynamic deliveryInfo
  +dynamic male
  +ActivityLevel activityLevel
  +AnimalType type
  +dynamic creator
}

"jumpets_app::blocs::search_bloc::search_ads_bloc.dart::AdsSearched" o-- "jumpets_app::models::enums::dog_size.dart::DogSize"
"jumpets_app::blocs::search_bloc::search_ads_bloc.dart::AdsSearched" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::blocs::search_bloc::search_ads_bloc.dart::AdsSearched" o-- "jumpets_app::models::enums::animal_types.dart::AnimalType"
"jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsEvent" <|-- "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::AdsSearched"

abstract class "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsState" {
}

class "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsInitial" {
}

"jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsState" <|-- "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsInitial"

class "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsLoading" {
}

"jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsState" <|-- "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsLoading"

class "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsSuccess" {
  +dynamic ads
}

"jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsState" <|-- "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsSuccess"

class "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsFailure" {
}

"jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsState" <|-- "jumpets_app::blocs::search_bloc::search_ads_bloc.dart::SearchAdsFailure"

class "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsBloc" {
  +AdsRepository repository
  +AuthBloc authBloc
  +ErrorHandlerBloc errorBloc
  +Stream mapEventToState()
}

"jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsBloc" o-- "jumpets_app::data::repositories::ads_repository.dart::AdsRepository"
"jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsBloc" o-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc"
"jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsBloc"

abstract class "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsEvent" {
}

class "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::AdDeleted" {
  +Ad ad
}

"jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::AdDeleted" o-- "jumpets_app::models::ads::ad.dart::Ad"
"jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsEvent" <|-- "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::AdDeleted"

abstract class "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsState" {
}

class "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsInitial" {
}

"jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsState" <|-- "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsInitial"

class "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsLoading" {
}

"jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsState" <|-- "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsLoading"

class "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsSuccess" {
}

"jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsState" <|-- "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsSuccess"

class "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsFailure" {
}

"jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsState" <|-- "jumpets_app::blocs::delete_ads::delete_ads_bloc.dart::DeleteAdsFailure"

class "jumpets_app::blocs::theme_bloc::theme_bloc.dart::ThemeBloc" {
  +Stream mapEventToState()
  +ThemeState fromJson()
  +Map toJson()
}

"hydrated_bloc::src::hydrated_bloc.dart::HydratedBloc<Event, State>" <|-- "jumpets_app::blocs::theme_bloc::theme_bloc.dart::ThemeBloc"

abstract class "jumpets_app::blocs::theme_bloc::theme_bloc.dart::ThemeEvent" {
}

class "jumpets_app::blocs::theme_bloc::theme_bloc.dart::DarkModeEnabled" {
}

"jumpets_app::blocs::theme_bloc::theme_bloc.dart::ThemeEvent" <|-- "jumpets_app::blocs::theme_bloc::theme_bloc.dart::DarkModeEnabled"

class "jumpets_app::blocs::theme_bloc::theme_bloc.dart::LightModeEnabled" {
}

"jumpets_app::blocs::theme_bloc::theme_bloc.dart::ThemeEvent" <|-- "jumpets_app::blocs::theme_bloc::theme_bloc.dart::LightModeEnabled"

abstract class "jumpets_app::blocs::theme_bloc::theme_bloc.dart::ThemeState" {
}

class "jumpets_app::blocs::theme_bloc::theme_bloc.dart::LightTheme" {
}

"jumpets_app::blocs::theme_bloc::theme_bloc.dart::ThemeState" <|-- "jumpets_app::blocs::theme_bloc::theme_bloc.dart::LightTheme"

class "jumpets_app::blocs::theme_bloc::theme_bloc.dart::DarkTheme" {
}

"jumpets_app::blocs::theme_bloc::theme_bloc.dart::ThemeState" <|-- "jumpets_app::blocs::theme_bloc::theme_bloc.dart::DarkTheme"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdBloc" {
  +AdsRepository repository
  +ErrorHandlerBloc errorBloc
  +InfoHandlerBloc infoBloc
  +AuthBloc authBloc
  +dynamic isValid
  +Stream mapEventToState()
  -UploadAdState _mapAdCategoryChangedToState()
  -UploadAdState _mapAdDescriptionChangedToState()
  -UploadAdState _mapAdTagsChangedToState()
  -UploadAdState _mapAdImgChangedToState()
  -UploadAdState _mapAdTitleChangedToState()
  -UploadAdState _mapAdPriceChangedToState()
  -UploadAdState _mapAdNameChangedToState()
  -UploadAdState _mapAdActivityLevelChangedToState()
  -UploadAdState _mapAdDogSizeChangedToState()
  -UploadAdState _mapAdPersonalityChangedToState()
  -UploadAdState _mapAdWeightChangedToState()
  -UploadAdState _mapAdMustKnowChangedToState()
  -UploadAdState _mapAdBreedChangedToState()
  -UploadAdState _mapAdDeliveryInfoChangedToState()
  -UploadAdState _mapAdBirthDateChangedToState()
  -UploadAdState _mapAdAdoptionTaxChangedToState()
  -UploadAdState _mapAdSexChangedToState()
  -Stream _mapAdSubmittedChangedToState()
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdBloc" o-- "jumpets_app::data::repositories::ads_repository.dart::AdsRepository"
"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdBloc" o-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerBloc"
"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdBloc" o-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdBloc"

abstract class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" {
}

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdCategoryChanged" {
  +Category category
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdCategoryChanged" o-- "jumpets_app::models::enums::categories.dart::Category"
"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdCategoryChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdDescriptionChanged" {
  +dynamic description
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdDescriptionChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdNameChanged" {
  +dynamic name
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdNameChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdTagsChanged" {
  +dynamic tags
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdTagsChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdSexChanged" {
  +dynamic male
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdSexChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdDogSizeChanged" {
  +DogSize dogSize
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdDogSizeChanged" o-- "jumpets_app::models::enums::dog_size.dart::DogSize"
"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdDogSizeChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdActivityLevelChanged" {
  +ActivityLevel level
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdActivityLevelChanged" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdActivityLevelChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdPersonalityChanged" {
  +dynamic personality
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdPersonalityChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdWeightChanged" {
  +dynamic weight
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdWeightChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdMustKnowChanged" {
  +dynamic mustKnow
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdMustKnowChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdBreedChanged" {
  +dynamic breed
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdBreedChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdDeliveryInfoChanged" {
  +dynamic deliveryInfo
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdDeliveryInfoChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdBirthDateChanged" {
  +dynamic birthDate
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdBirthDateChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdAdoptionTaxChanged" {
  +dynamic adoptionTax
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdAdoptionTaxChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdImgChanged" {
  +dynamic files
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdImgChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdTitleChanged" {
  +dynamic title
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdTitleChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdPriceChanged" {
  +dynamic price
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdPriceChanged"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdSubmitted" {
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdEvent" <|-- "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::AdSubmitted"

class "jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdState" {
  +dynamic status
  +Category category
  +dynamic photos
  +AdString description
  +dynamic tags
  +AdString name
  +AdString mustKnow
  +AdString breed
  +AdDouble weight
  +AdDouble adoptionTax
  +dynamic personality
  +dynamic birthDate
  +dynamic deliveryInfo
  +dynamic male
  +ActivityLevel activityLevel
  +DogSize dogSize
  +AdString title
  +AdDouble price
  +Ad ad
  +UploadAdState copyWith()
  +dynamic toString()
}

"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdState" o-- "jumpets_app::models::enums::categories.dart::Category"
"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdState" o-- "jumpets_app::models::forms::ad_forms.dart::AdString"
"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdState" o-- "jumpets_app::models::forms::ad_forms.dart::AdDouble"
"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdState" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdState" o-- "jumpets_app::models::enums::dog_size.dart::DogSize"
"jumpets_app::blocs::upload_ad_bloc::upload_ad_bloc.dart::UploadAdState" o-- "jumpets_app::models::ads::ad.dart::Ad"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsBloc" {
  +AdsRepository repository
  +AuthBloc authBloc
  -dynamic _currentEndCursor
  +Category category
  -dynamic _lastestAdsFetched
  +AdsSearched filters
  +dynamic searchMode
  +ErrorHandlerBloc errorBloc
  +dynamic isCategoryValidToSearch
  -dynamic _hasNextPage
  +void onTransition()
  +dynamic mapEventToState()
  +dynamic isEventSearchValid()
  -AdsState _mapLastAdsRefreshedToState()
  -Future _mapAdsSearchedToState()
  -dynamic _mapMoreAdsFetchedToState()
  -Future _mapAdsFetchedToState()
  +dynamic transformEvents()
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsBloc" o-- "jumpets_app::data::repositories::ads_repository.dart::AdsRepository"
"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsBloc" o-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc"
"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsBloc" o-- "jumpets_app::models::enums::categories.dart::Category"
"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsBloc" o-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsSearched"
"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsBloc"

abstract class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsEvent" {
}

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::LastAdsRefreshed" {
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsEvent" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::LastAdsRefreshed"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::MoreAdsFetched" {
  +int photosWidth
  +int photosHeight
  +int thumbnailWidth
  +int thumbnailHeight
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsEvent" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::MoreAdsFetched"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsFetched" {
  +int photosWidth
  +int photosHeight
  +int thumbnailWidth
  +int thumbnailHeight
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsEvent" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsFetched"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsSearched" {
  +dynamic text
  +DogSize size
  +dynamic deliveryInfo
  +dynamic male
  +ActivityLevel activityLevel
  +dynamic creator
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsSearched" o-- "jumpets_app::models::enums::dog_size.dart::DogSize"
"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsSearched" o-- "jumpets_app::models::enums::activity_level.dart::ActivityLevel"
"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsEvent" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsSearched"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::SearchModeDisabled" {
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsEvent" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::SearchModeDisabled"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::CategorySelected" {
  +Category category
  +dynamic toString()
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::CategorySelected" o-- "jumpets_app::models::enums::categories.dart::Category"
"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsEvent" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::CategorySelected"

abstract class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsState" {
}

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsInitial" {
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsState" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsInitial"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsLoading" {
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsState" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsLoading"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsLoadingMore" {
  +dynamic ads
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsState" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsLoadingMore"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsSuccess" {
  +PaginatedAds paginatedAds
  +dynamic shelters
  +dynamic searchedAds
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsSuccess" o-- "jumpets_app::models::wrappers::paginated_ads.dart::PaginatedAds"
"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsState" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsSuccess"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsFailure" {
  +Function retry
  +dynamic msg
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsState" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsFailure"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::CategoryChanged" {
  +dynamic category
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsState" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::CategoryChanged"

class "jumpets_app::blocs::ads_bloc::ads_bloc.dart::SearchModeChanged" {
  +dynamic searchMode
}

"jumpets_app::blocs::ads_bloc::ads_bloc.dart::AdsState" <|-- "jumpets_app::blocs::ads_bloc::ads_bloc.dart::SearchModeChanged"

class "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc" {
  +Stream mapEventToState()
}

"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"

abstract class "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerEvent" {
}

class "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerCatched" {
  +Bloc bloc
  +dynamic event
  +dynamic error
  +bool notification
}

"jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerCatched" o-- "bloc::src::bloc.dart::Bloc"
"jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerEvent" <|-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerCatched"

abstract class "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerState" {
}

class "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerEmpty" {
}

"jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerState" <|-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerEmpty"

class "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorThrownNotification" {
  +dynamic error
  +void Function() retry
}

"jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorThrownNotification" o-- "dart::ui::void Function()"
"jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerState" <|-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorThrownNotification"

class "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorThrownDialog" {
  +dynamic error
  +void Function() retry
}

"jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorThrownDialog" o-- "dart::ui::void Function()"
"jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerState" <|-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorThrownDialog"

class "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsBloc" {
  +AuthBloc authBloc
  +ErrorHandlerBloc errorBloc
  +UserRepository repository
  +Stream mapEventToState()
  -Future _mapRoomsFetchedToState()
  +Future gotAlreadyRoomWithUser()
  +Room getRoomWithId()
}

"jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsBloc" o-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc"
"jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsBloc" o-- "jumpets_app::data::repositories::user_repository.dart::UserRepository"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsBloc"

abstract class "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsEvent" {
}

class "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsInitialized" {
}

"jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsEvent" <|-- "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsInitialized"

class "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsFetched" {
}

"jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsEvent" <|-- "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsFetched"

class "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomUpdated" {
  +Room room
}

"jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomUpdated" o-- "jumpets_app::models::chats::room.dart::Room"
"jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsEvent" <|-- "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomUpdated"

abstract class "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsState" {
}

class "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsInitial" {
}

"jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsState" <|-- "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsInitial"

class "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsLoading" {
}

"jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsState" <|-- "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsLoading"

class "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsSuccess" {
  +dynamic rooms
}

"jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsState" <|-- "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsSuccess"

class "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsFailure" {
  +Function retry
  +dynamic msg
}

"jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsState" <|-- "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsFailure"

class "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileBloc" {
  +UserRepository repository
  +AuthBloc authBloc
  +ErrorHandlerBloc errorBloc
  +InfoHandlerBloc infoBloc
  +Stream mapEventToState()
  -EditProfileState _mapProfileWebChangedToState()
  -EditProfileState _mapProfilePhoneChangedToState()
  -EditProfileState _mapProfileAddressChangedToState()
  -EditProfileState _mapProfileNameChangedToState()
  -EditProfileState _mapProfileEmailChangedToState()
  -EditProfileState _mapProfileImgChangedToState()
  -EditProfileState _mapProfilePasswordChangedToState()
  -Stream _mapProfileSubmittedChangedToState()
}

"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileBloc" o-- "jumpets_app::data::repositories::user_repository.dart::UserRepository"
"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileBloc" o-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc"
"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileBloc" o-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerBloc"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileBloc"

abstract class "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileEvent" {
}

class "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileNameChanged" {
  +dynamic name
}

"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileEvent" <|-- "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileNameChanged"

class "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileEmailChanged" {
  +dynamic email
}

"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileEvent" <|-- "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileEmailChanged"

class "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileAddressChanged" {
  +dynamic address
}

"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileEvent" <|-- "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileAddressChanged"

class "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileWebChanged" {
  +dynamic web
}

"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileEvent" <|-- "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileWebChanged"

class "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfilePasswordChanged" {
  +dynamic password
}

"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileEvent" <|-- "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfilePasswordChanged"

class "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfilePhoneChanged" {
  +int phone
}

"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileEvent" <|-- "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfilePhoneChanged"

class "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileImgChanged" {
  +dynamic file
}

"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileEvent" <|-- "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileImgChanged"

class "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileEditSubmitted" {
}

"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileEvent" <|-- "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::ProfileEditSubmitted"

class "jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileState" {
  +dynamic status
  +Email email
  +Name name
  +Web web
  +Address address
  +Phone phone
  +dynamic file
  +PasswordNullable password
  +EditProfileState copyWith()
  +dynamic toString()
}

"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileState" o-- "jumpets_app::models::forms::user_forms.dart::Email"
"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileState" o-- "jumpets_app::models::forms::user_forms.dart::Name"
"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileState" o-- "jumpets_app::models::forms::user_forms.dart::Web"
"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileState" o-- "jumpets_app::models::forms::user_forms.dart::Address"
"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileState" o-- "jumpets_app::models::forms::user_forms.dart::Phone"
"jumpets_app::blocs::edit_profile_bloc::edit_profile_bloc.dart::EditProfileState" o-- "jumpets_app::models::forms::user_forms.dart::PasswordNullable"

class "jumpets_app::blocs::locale_bloc::locale_bloc.dart::LocaleBloc" {
  +Stream mapEventToState()
  +LocaleState fromJson()
  +Map toJson()
}

"hydrated_bloc::src::hydrated_bloc.dart::HydratedBloc<Event, State>" <|-- "jumpets_app::blocs::locale_bloc::locale_bloc.dart::LocaleBloc"

abstract class "jumpets_app::blocs::locale_bloc::locale_bloc.dart::LocaleEvent" {
}

class "jumpets_app::blocs::locale_bloc::locale_bloc.dart::LocaleChanged" {
  +String code
  +String toString()
}

"jumpets_app::blocs::locale_bloc::locale_bloc.dart::LocaleEvent" <|-- "jumpets_app::blocs::locale_bloc::locale_bloc.dart::LocaleChanged"

class "jumpets_app::blocs::locale_bloc::locale_bloc.dart::LocaleState" {
  +String code
}

class "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesBloc" {
  +AdsRepository repository
  +AuthBloc authBloc
  +ErrorHandlerBloc errorBloc
  +String token
  +Stream mapEventToState()
  -Future _mapFavouritesAdRemovedToState()
  -Future _mapFavouritesAdAddedToState()
  -Future _mapFavouritesFetchedToState()
}

"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesBloc" o-- "jumpets_app::data::repositories::ads_repository.dart::AdsRepository"
"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesBloc" o-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc"
"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesBloc"

abstract class "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesEvent" {
}

class "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouriteInitialized" {
}

"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesEvent" <|-- "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouriteInitialized"

class "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouriteAdAdded" {
  +Ad ad
}

"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouriteAdAdded" o-- "jumpets_app::models::ads::ad.dart::Ad"
"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesEvent" <|-- "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouriteAdAdded"

class "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouriteAdRemoved" {
  +String adId
}

"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesEvent" <|-- "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouriteAdRemoved"

class "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesFetched" {
}

"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesEvent" <|-- "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesFetched"

abstract class "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesState" {
}

class "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesInitial" {
}

"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesState" <|-- "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesInitial"

class "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesLoading" {
}

"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesState" <|-- "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesLoading"

class "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesSuccess" {
  +List<Ad> ads
}

"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesState" <|-- "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesSuccess"

class "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesFailure" {
  +Function retry
  +String msg
}

"jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesState" <|-- "jumpets_app::blocs::favs_bloc::favourites_bloc.dart::FavouritesFailure"

class "jumpets_app::blocs::bloc_delegate.dart::BlocDelegate" {
  +void onEvent()
  +void onTransition()
  +void onError()
}

"bloc::src::bloc_observer.dart::BlocObserver" <|-- "jumpets_app::blocs::bloc_delegate.dart::BlocDelegate"

class "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsBloc" {
  +AuthBloc authBloc
  +UserRepository repository
  +ErrorHandlerBloc errorBloc
  +bool isValueValid
  +Stream mapEventToState()
  -Future _mapValuationValueChangedToState()
  -Future _mapValuationCommentChangedToState()
  +bool isValueValidParam()
  -Stream _mapValuationSubmittedToState()
  -Stream _mapValuationDeletedToState()
}

"jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsBloc" o-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc"
"jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsBloc" o-- "jumpets_app::data::repositories::user_repository.dart::UserRepository"
"jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsBloc"

abstract class "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsEvent" {
}

class "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationCommentChanged" {
  +String comment
}

"jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsEvent" <|-- "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationCommentChanged"

class "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationValueChanged" {
  +double value
}

"jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsEvent" <|-- "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationValueChanged"

class "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationSubmitted" {
  +String id
}

"jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsEvent" <|-- "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationSubmitted"

class "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationDeleted" {
  +String id
}

"jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsEvent" <|-- "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationDeleted"

class "jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsState" {
  +dynamic status
  +Comment comment
  +double value
  +User user
  +ValuationsState copyWith()
  +String toString()
}

"jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsState" o-- "jumpets_app::models::forms::user_forms.dart::Comment"
"jumpets_app::blocs::valuations_bloc::valuations_bloc.dart::ValuationsState" o-- "jumpets_app::models::users::user.dart::User"

class "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerBloc" {
  +Stream mapEventToState()
  -void _addFirstMsg()
}

"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerBloc"

abstract class "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerEvent" {
}

class "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::MessageAdded" {
  +dynamic msg
  +bool notification
}

"jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerEvent" <|-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::MessageAdded"

class "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::MessageActionAdded" {
  +dynamic msg
  +dynamic onMainText
  +dynamic onSecondaryText
  +Function onMainCallback
  +Function onSecondaryCallback
}

"jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerEvent" <|-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::MessageActionAdded"

class "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::ChatMessageReceived" {
  +Message msg
  +dynamic roomId
}

"jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::ChatMessageReceived" o-- "jumpets_app::models::chats::message.dart::Message"
"jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerEvent" <|-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::ChatMessageReceived"

abstract class "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerState" {
}

class "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerEmpty" {
}

"jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerState" <|-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerEmpty"

class "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoNotification" {
  +dynamic msg
}

"jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerState" <|-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoNotification"

class "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoDialog" {
  +dynamic msg
}

"jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerState" <|-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoDialog"

class "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoDialogAction" {
  +dynamic msg
  +dynamic onMainText
  +dynamic onSecondaryText
  +Function onMainCallback
  +Function onSecondaryCallback
}

"jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerState" <|-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoDialogAction"

class "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::ChatMessage" {
  +Message msg
  +dynamic roomId
}

"jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::ChatMessage" o-- "jumpets_app::models::chats::message.dart::Message"
"jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerState" <|-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::ChatMessage"

class "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc" {
  +ErrorHandlerBloc errorBloc
  +InfoHandlerBloc infoBloc
  -StreamSubscription<AuthStatus> _authenticationStatusSubscription
  -AuthenticationRepository _authenticationRepository
  +Stream mapEventToState()
  -void _addTimer()
  +Future close()
}

"jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc" o-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerBloc"
"jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc" o-- "dart::async::StreamSubscription<AuthStatus>"
"jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc" o-- "jumpets_app::data::repositories::authentication_repository.dart::AuthenticationRepository"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc"

abstract class "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthEvent" {
}

class "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthStatusChanged" {
  +AuthStatus status
}

"jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthStatusChanged" o-- "jumpets_app::models::wrappers::auth_status.dart::AuthStatus"
"jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthEvent" <|-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthStatusChanged"

class "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthUserUpdated" {
  +dynamic user
}

"jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthEvent" <|-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthUserUpdated"

class "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthLogoutRequested" {
}

"jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthEvent" <|-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthLogoutRequested"

class "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthState" {
  +AuthStatus authStatus
  +dynamic toString()
}

"jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthState" o-- "jumpets_app::models::wrappers::auth_status.dart::AuthStatus"

class "jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginBloc" {
  +ErrorHandlerBloc errorBloc
  -AuthenticationRepository _authenticationRepository
  +Stream mapEventToState()
  -LoginState _mapLoginEmailChangedToState()
  -LoginState _mapLoginPasswordChangedToState()
  -Stream _mapLoginSubmittedChangedToState()
}

"jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginBloc" o-- "jumpets_app::data::repositories::authentication_repository.dart::AuthenticationRepository"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginBloc"

abstract class "jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginEvent" {
}

class "jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginEmailChanged" {
  +dynamic email
}

"jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginEvent" <|-- "jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginEmailChanged"

class "jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginPasswordChanged" {
  +dynamic password
}

"jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginEvent" <|-- "jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginPasswordChanged"

class "jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginLogInSubmitted" {
}

"jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginEvent" <|-- "jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginLogInSubmitted"

class "jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginState" {
  +dynamic status
  +Email email
  +Password password
  +LoginState copyWith()
}

"jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginState" o-- "jumpets_app::models::forms::user_forms.dart::Email"
"jumpets_app::blocs::auth_bloc::bloc::login_bloc.dart::LoginState" o-- "jumpets_app::models::forms::user_forms.dart::Password"

class "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterBloc" {
  +ErrorHandlerBloc errorBloc
  -AuthenticationRepository _authenticationRepository
  +Stream mapEventToState()
  -RegisterState _mapRegisterNameChangedToState()
  -RegisterState _mapRegisterEmailChangedToState()
  -RegisterState _mapRegisterPasswordChangedToState()
  -RegisterState _mapRegisterSecondPasswordChangedToState()
  -Stream _mapRegisterSubmittedChangedToState()
}

"jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterBloc" o-- "jumpets_app::data::repositories::authentication_repository.dart::AuthenticationRepository"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterBloc"

abstract class "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterEvent" {
}

class "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterNameChanged" {
  +dynamic name
}

"jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterEvent" <|-- "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterNameChanged"

class "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterEmailChanged" {
  +dynamic email
}

"jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterEvent" <|-- "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterEmailChanged"

class "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterPasswordChanged" {
  +dynamic password
}

"jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterEvent" <|-- "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterPasswordChanged"

class "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterSecondPasswordChanged" {
  +dynamic password
}

"jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterEvent" <|-- "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterSecondPasswordChanged"

class "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterSubmitted" {
  +UserType type
}

"jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterSubmitted" o-- "jumpets_app::models::enums::user_types.dart::UserType"
"jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterEvent" <|-- "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterSubmitted"

class "jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterState" {
  +dynamic status
  +Email email
  +Name name
  +Password password
  +Password confirmedPassword
  +RegisterState copyWith()
}

"jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterState" o-- "jumpets_app::models::forms::user_forms.dart::Email"
"jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterState" o-- "jumpets_app::models::forms::user_forms.dart::Name"
"jumpets_app::blocs::auth_bloc::bloc::register_bloc.dart::RegisterState" o-- "jumpets_app::models::forms::user_forms.dart::Password"

class "jumpets_app::blocs::profile_bloc::profile_bloc.dart::ProfileBloc" {
  +UserRepository repository
  +ErrorHandlerBloc errorBloc
  +Stream mapEventToState()
  -Future _mapUserFetchedToState()
}

"jumpets_app::blocs::profile_bloc::profile_bloc.dart::ProfileBloc" o-- "jumpets_app::data::repositories::user_repository.dart::UserRepository"
"jumpets_app::blocs::profile_bloc::profile_bloc.dart::ProfileBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::profile_bloc::profile_bloc.dart::ProfileBloc"

abstract class "jumpets_app::blocs::profile_bloc::profile_bloc.dart::ProfileEvent" {
}

class "jumpets_app::blocs::profile_bloc::profile_bloc.dart::UserUpdated" {
  +dynamic user
}

"jumpets_app::blocs::profile_bloc::profile_bloc.dart::ProfileEvent" <|-- "jumpets_app::blocs::profile_bloc::profile_bloc.dart::UserUpdated"

class "jumpets_app::blocs::profile_bloc::profile_bloc.dart::UserFetched" {
}

"jumpets_app::blocs::profile_bloc::profile_bloc.dart::ProfileEvent" <|-- "jumpets_app::blocs::profile_bloc::profile_bloc.dart::UserFetched"

class "jumpets_app::blocs::profile_bloc::profile_bloc.dart::ProfileState" {
  +dynamic user
}

class "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageBloc" {
  +AuthBloc authBloc
  +ErrorHandlerBloc errorBloc
  +InfoHandlerBloc infoBloc
  +RoomsBloc roomsBloc
  +UserRepository repository
  -dynamic _roomsSubscriptions
  +Stream mapEventToState()
  -Future _mapMessageSentToState()
  -void _mapMessageReceivedToUpdateRoom()
  -void _mapUserRoomsUpdated()
  +Future close()
}

"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageBloc" o-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc"
"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageBloc" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageBloc" o-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerBloc"
"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageBloc" o-- "jumpets_app::blocs::rooms_bloc::rooms_bloc.dart::RoomsBloc"
"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageBloc" o-- "jumpets_app::data::repositories::user_repository.dart::UserRepository"
"bloc::src::bloc.dart::Bloc<Event, State>" <|-- "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageBloc"

abstract class "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageEvent" {
}

class "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageSent" {
  +String toUserId
  +String adId
  +String text
}

"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageEvent" <|-- "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageSent"

class "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageReceived" {
  +Message message
  +String roomId
}

"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageReceived" o-- "jumpets_app::models::chats::message.dart::Message"
"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageEvent" <|-- "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageReceived"

class "jumpets_app::blocs::message_bloc::message_bloc.dart::RoomsUpdated" {
  +dynamic roomsIds
}

"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageEvent" <|-- "jumpets_app::blocs::message_bloc::message_bloc.dart::RoomsUpdated"

abstract class "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageState" {
}

class "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageInitial" {
}

"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageState" <|-- "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageInitial"

class "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageLoading" {
}

"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageState" <|-- "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageLoading"

class "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageSuccess" {
  +Room room
}

"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageSuccess" o-- "jumpets_app::models::chats::room.dart::Room"
"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageState" <|-- "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageSuccess"

class "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageFailure" {
}

"jumpets_app::blocs::message_bloc::message_bloc.dart::MessageState" <|-- "jumpets_app::blocs::message_bloc::message_bloc.dart::MessageFailure"

class "jumpets_app::main.dart::MyApp" {
  +AuthBloc authBloc
  +ErrorHandlerBloc errorBloc
  +InfoHandlerBloc infoBloc
  +LocaleBloc localeBloc
  +AdsRepository adsRepository
  +AuthenticationRepository authenticationRepository
  +UserRepository userRepository
  +Widget build()
}

"jumpets_app::main.dart::MyApp" o-- "jumpets_app::blocs::auth_bloc::auth_bloc.dart::AuthBloc"
"jumpets_app::main.dart::MyApp" o-- "jumpets_app::blocs::error_handler_bloc::error_handler_bloc.dart::ErrorHandlerBloc"
"jumpets_app::main.dart::MyApp" o-- "jumpets_app::blocs::info_handler_bloc::info_handler_bloc.dart::InfoHandlerBloc"
"jumpets_app::main.dart::MyApp" o-- "jumpets_app::blocs::locale_bloc::locale_bloc.dart::LocaleBloc"
"jumpets_app::main.dart::MyApp" o-- "jumpets_app::data::repositories::ads_repository.dart::AdsRepository"
"jumpets_app::main.dart::MyApp" o-- "jumpets_app::data::repositories::authentication_repository.dart::AuthenticationRepository"
"jumpets_app::main.dart::MyApp" o-- "jumpets_app::data::repositories::user_repository.dart::UserRepository"
"flutter::src::widgets::framework.dart::StatelessWidget" <|-- "jumpets_app::main.dart::MyApp"

class "jumpets_app::route_generator.dart::RouteGenerator" {
  {static} +Route generateRoute()
  {static} -Route _errorRoute()
}

newpage 

class "jumpets_app::data::providers::ads_provider.dart::AdsProvider" {
  -ApiBaseHelper _api
  {static} +dynamic animalAdFragment
  {static} +dynamic serviceAdFragment
  {static} +dynamic productAdFragment
  {static} +dynamic adFragment
  +Future getPaginatedAds()
  +Future getFavs()
  +Future saveAd()
  +Future unsaveAd()
  +Future getCloseShelters()
  +Future createAnimalAd()
  +Future createProductAd()
  +Future createServiceAd()
  +Future searchAds()
  +Future deleteAnimalAd()
  +Future deleteServiceAd()
  +Future deleteProductAd()
}

"jumpets_app::data::providers::ads_provider.dart::AdsProvider" o-- "jumpets_app::data::api_base_helper.dart::ApiBaseHelper"

class "jumpets_app::data::providers::user_provider.dart::UserProvider" {
  -ApiBaseHelper _api
  {static} +String getUserFragment
  +Future getUser()
  +Future updateUser()
  +Future valuateUser()
  +Future removeValuation()
  +Future getRooms()
  +Future sendMessage()
}

"jumpets_app::data::providers::user_provider.dart::UserProvider" o-- "jumpets_app::data::api_base_helper.dart::ApiBaseHelper"

class "jumpets_app::data::providers::authentication_provider.dart::AuthenticationProvider" {
  -ApiBaseHelper _api
  +Future logIn()
  +Future register()
}

"jumpets_app::data::providers::authentication_provider.dart::AuthenticationProvider" o-- "jumpets_app::data::api_base_helper.dart::ApiBaseHelper"

class "jumpets_app::data::repositories::ads_repository.dart::AdsRepository" {
  -AdsProvider _adsProvider
  +Future searchAds()
  +Future getPaginatedAds()
  +Future getCloseShelters()
  +Future getFavs()
  +Future saveAd()
  +Future unsaveAd()
  +Future createAnimalAd()
  +Future createProductAd()
  +Future createServiceAd()
  +void deleteAnimalAd()
  +void deleteServiceAd()
  +void deleteProductAd()
}

"jumpets_app::data::repositories::ads_repository.dart::AdsRepository" o-- "jumpets_app::data::providers::ads_provider.dart::AdsProvider"

class "jumpets_app::data::repositories::websocket_repository.dart::WebSocketRepository" {
  {static} +dynamic messageSent()
  {static} +WebSocketLink websocketLink()
  {static} +GraphQLClient client()
}

class "jumpets_app::data::repositories::user_repository.dart::UserRepository" {
  -UserProvider _userProvider
  +Future valuateUser()
  +Future getRooms()
  +Future updateUser()
  +Future getUser()
  +Future removeValuation()
  +Future sendMessage()
}

"jumpets_app::data::repositories::user_repository.dart::UserRepository" o-- "jumpets_app::data::providers::user_provider.dart::UserProvider"

class "jumpets_app::data::repositories::authentication_repository.dart::AuthenticationRepository" {
  -StreamController<AuthStatus> _controller
  +AuthenticationProvider authenticationProvider
  +Stream<AuthStatus> status
  +Future logIn()
  +Future register()
  +void logOut()
  +void dispose()
}

"jumpets_app::data::repositories::authentication_repository.dart::AuthenticationRepository" o-- "dart::async::StreamController<AuthStatus>"
"jumpets_app::data::repositories::authentication_repository.dart::AuthenticationRepository" o-- "jumpets_app::data::providers::authentication_provider.dart::AuthenticationProvider"
"jumpets_app::data::repositories::authentication_repository.dart::AuthenticationRepository" o-- "dart::async::Stream<AuthStatus>"

class "jumpets_app::data::api_base_helper.dart::ApiBaseHelper" {
  +String baseUrl
  +int timeout
  {static} +String domain
  +Future get()
  +Future post()
  +Future postWithFile()
  -dynamic _returnResponse()
}


@enduml