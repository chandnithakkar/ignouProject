class AppConstants {
  static const String appName = 'Jain-Insta';
  static const int appVersion = 1;

  /*
Shared Pref
  */
  static const String apiKey = 'apiKey';
  static const String fontFamilyOswald = "Oswald";
  static const String fontFamilyOxygen = "Oxygen";

  static const String configDataPREF = "configDataPREF";
  static const String otp_resend_time = "otp_resend_time";
  static const String otp_expired_time = "otp_expired_time";

  static const String usertypeValue = "1";

  //keys
  static const String deviceTypeK = "device_type";
  static const String deviceIdK = "device_id";
  static const String deviceTokenK = "device_token";
  static const String deviceNameK = "device_name";
  static const String typeK = "type";
  static const String fileTypeK = "file_type";

  static const String pageNoK = "pageno";
  static const String pageK = "page";
  static const String senderUUIDK = "sender_uuid";
  static const String receiverUUIDK = "receiver_uuid";
  static const String localTimeZoneK = "localTimeZone";

  static const String limitK = "limit";
  static const String emailK = "email";
  static const String passwordK = "password";
  static const String apiTokenK = "api_token";
  static const String userTypeK = "user_type";
  static const String uuidK = 'uuid';
  static const String statusK = "status";

  static const String postUuidK ="posts_uuid";
  static const String blockUuidK ="block_uuid";
  static const String reasonCodeK = "reason_code";
  static const String searchK = "search";
  static const String searchFromK = "search_from";
    static const String searchTextK = "search_text";
  static const String nameK = "name";
  static const String userNameK = "username";
  static const String screenNoK = "screen_no";
  static const String mobileK = "mobile";
  static const String phoneCodeK = "phone_code";
  static const String newPwdK = "new_password";
  static const String adharCardK = "aadhaar_card";
  static const String userUUIDK = "user_uuid";
  static const String bioGraphyK = "biography";
  static const String dobK = "date_of_birth";
  static const String genderK = "gender";
  static const String contactListK = "contact_list";
  static const String profileK = "profile";
  static const String videoUUIDK = "video_uuid";
  static const String interestK = "interests";
  static const String profileUUidK = "profile_uuid";
  static const String titleK = "title";
  static const String video_FileK = "video_file";
  static const String thumbK = "thumb";
  static const String privacyK = "privacy";
  static const String tagFriendK = "tag_friend";
  static const String locationK = "location";
  static const String longitudeK = "longitude";
  static const String latitudeK = "latitude";
  static const String tagsK = "tags";
  static const String commentK = "comment";
  static const String commentUuidK ="comment_uuid";
  static const String commentTypeK = "comment_type";
  static const String parentUuidK = "parent_uuid";



  static const String tempUrl = "https://picsum.photos/id/237/200/300";
  static const String placesApikey = "AIzaSyCIxTpffX35e25onFF5dTxBjV9Sw0rT_Ho";
  static const String isLoggedIn = 'isLoggedIn';

  static const String userEmail = 'userEmail';
  static const String loginPref = 'loginPref';
  static const String fullnamePref = 'fullnamePref';
  static const String apiTokenPref = 'apiTokenPref';
  static const String uuidPref = 'uuidPref';
  static const String profilePicPref = 'profilePicPref';
  static const String emailPref = 'email';
  static const String mobilePref = 'mobile';
  static const String fcmTokenPref = 'fcmToken';
  static const String mobileNumber = 'mobileNumber';
  static const String userDetailsPref = 'userDetailsPref';
  static const String contactsPref = 'contactsPref';
  static const String chooseProfilePicPathPref = 'chooseProfilePicPathPref';

  static const String send = 'SEND';
  static const String editButtonName = 'EDIT';
  static const String saveButtonName = 'SAVE';
  static int notificationCount = 12;
  static var internetConMsg = "Please check your internet connection.";
  static var today = "Today";
  static var tomorrow = "Tomorrow";
  static var yesterDay = "Yesterday";

  // Error
  static const String errorEmail = "Please enter email";
  static const String errorMobile = "Please enter mobile number";
  static const String validPhone = "Please enter valid mobile number";

  static const String validEmail = "Please enter valid email";
  static const String errorFullName = "Please enter full name";
  static const String errorUserName = "Please enter user name";

  static get validPwdField =>
      "kindly use a mix of upper and lowercase \nletters,numbers, symbols and minimum \n6 characters length";
  static const String errorPassword = "Please enter password";
  static const String errorNewPassword = "Please enter new password";
  static const String errorConfirmPassword = "Please enter confirm password";
  static const String errorBio = "Please enter bio";

  static get otpDesc =>
      "Enter the verification number\nwhich you have received by EMAIL.";
  static var enterOtpValid = "Please enter otp";
  static var codeNotMatched = "Invalid OTP, Please check and try again";
  static var pwdNotSameError =
      "New password  and confirm password must be same";
  static var tapForBack = 'Tap back again to exit';

  static var cancel = 'Cancel';
  static var ok = 'Ok';
  static const String logoutmsg = 'Are you sure you want to logout?';
  static const String deleteAccountMsg =
      'Are you sure you want to delete Account?';

  static const String createNewOrderMsg = 'Do you want to create new Order?';
  static const String logout = 'Logout';
  static const String yes = 'Yes';

  //forgot pwd
  static const String forgotPassword = "Forgot Password";
  static const String question = "?";

  static const String changePassword = "Change Password";

  static get verifyOTP => "Verify with OTP ";

  static get sendViaText => "Send via phone to ";

  static const String editProfile = "Edit Profile";
  static const String settings = "Settings";
  static const String deleteAccount = "Delete Account";
  static const String saved = "Saved";
  static const String closeFriends = "Close Friends";

  //setting page
  static const String followAndInvite = "Follow and Invite";
  static const String notification = "Notification";
  static const String privacy = "Privacy";
  static const String accountSetting = "Account Setting";
  static const String help = "Help";

//allow contacts
  static const String findContacts = "Find Contacts";
  static const String allow = "Allow";

  static const String findContactsText1 =
      "Find which of your friends are on this app  and choose who to follow";
  static const String skip = "Skip";
  static const String contactList = "contactList";

// follow you friends
  static const String followYourFriends = "Follow Your Friends";

  // invite you friends
  static const String inviteYourFriends = "Invite Your Friends";

  //edit profile
  static const String changeProfile = "Change Profile Photo";
  static const String changePhoto = "Change Photo";

  static const String followText =
      "Press the follow button to start following your friends in your contacts";

  //choose Profile pic
  static const String addProfilePic = "Add Profile Photo";
  static const String addProfilePicText1 =
      "Add your profile photo so that your friends know it's you";
  static const String addAPhoto = "Add A Photo";
  static const String next = "Next";

  static const String profilePhotoAdded = "Profile Photo Added";

  //interest
  static var personalization = "personalization";
  static var selectYourInterestContect =
      "Tap the bubbles you are interested in and we will recommend related discussions.";
  static var selectYour = "Select Your ";
  static var interests = "Interests";

  //upload bio
  static var information = "Information";
  static var addYour = "Add your";
  static var bio = " Bio";
  static var addinfoText = "Add your general info and we will set you up.";

  //recent chat screen
  static var noChatF = "You may now enjoy chatting with your contacts.";
  static var archive = "Archive";
  static var writeMsg = "Send Message...";
  static var writeSome = "Write something here...";
  static var clearConversion = "Clear Conversion";
  static var blockUser = "Block User";
  static const String followers = "Followers";
  static const String friends = "Friends";
  static const chatImg = "chatImage";

  //create post screen
  static var startDiscussion = "Start Discussion";
  static var create = "Create ";
  static var post = "post";
  static var public = "Public";
  static var friend = "Friends";
  static var onlyMe = "Only Me";
  static var shareWith = "Share with ";
  static var whatsOnYourMind = "What’s on your mind?";
  static var hastaged = "  Has Tags : ";
  static var selectedLocation = "  Selected Location";
  static var share = "Share";
  static var audioFileValidation = "Please record audio first";
  static var connectWith = "Connect With New Friends";
  static var report = "Report";
  static var ago = "ago";
  static var block = "Block";
  static var delete = "Delete";
  static var justNow = "Just Now";
  static var isWith = "is with";
  static var unblock = "UnBlock";
  static var snooze = "Snooze";
  static var taged = "  TAGGED : ";
  static var reply = "Reply";
  static var cropVideo = "Crop Video";
  static var save = "Save";
  static var play = "Play";
  static var postNow = "Post Now";
  static var photos = "Photos";
  static var videos = "Videos";
  static var audio = "Audio";
  static var tagFreind = "Tag Friends";
  static var location = "Location";
  static var audioPost = "Audio Post";
  static var start = "Start";
  static var edit = "Edit";
  static var recording = " recording";
  static var selectLocation = "Select a location";
  static var findLocation = "Find a location...";
  static var tagPeople = "Tag people";
  static var searchForAFriend = "Search for a friend...";

  static const double decibleLimit = -30;
  static const amplitudeCaptureRateInMilliSeconds = 100;
    static var writeComment = "Write comment...";
    static var viewAll = "View all";
  static var comments = "commments";
  static var noComment = "No comments";



}
