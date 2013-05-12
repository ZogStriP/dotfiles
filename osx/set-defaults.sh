# Ask for the administrator password upfront
sudo -v
 
# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# System Preferences > General                                                #
###############################################################################
 
# Sidebar icon size (1 - Small, 2 - Medium, 3 - Large)
defaults write -g NSTableViewDefaultSizeMode -int 1
 
# Show scroll bars (`Automatic`, `WhenScrolling`, `Always`)
defaults write -g AppleShowScrollBars -string "Always"
 
# Click in the scroll bar to (false - jump to the next page, true - jump to the spot that's clicked)
defaults write -g AppleScrollerPagingBehavior -bool true
 
###############################################################################
# System Preferences > Desktop                                                #
###############################################################################
 
# Translucent menu bar
defaults write -g AppleEnableMenuBarTransparency -bool false
 
###############################################################################
# System Preferences > Screen Saver                                           #
###############################################################################
 
# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner > Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner > Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner > Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0
 
###############################################################################
# System Preferences > Dock                                                   #
###############################################################################
 
# Size
defaults write com.apple.dock tilesize -int 32
 
# Position on the screen (`left`, `bottom`, `right`)
defaults write com.apple.dock orientation -string "left"
 
# Animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false
 
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
 
# Wipe all app icons from the Dock
# (this should be done only once, when you setup your Mac)
#defaults write com.apple.dock persistent-apps -array
#defaults write com.apple.dock persistent-others -array
 
# [HIDDEN] Auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
 
# [HIDDEN] Animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0
 
# [HIDDEN] Animation when opening an applicatin in the Dock
defaults write com.apple.dock launchanim -bool false
 
# [HIDDEN] Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

###############################################################################
# System Preferences > Mission Control                                        #
###############################################################################
 
# Show Dashboard as a space
defaults write com.apple.dock dashboard-in-overlay -bool true
 
# [HIDDEN] Mission control animation
defaults write com.apple.dock expose-animation-duration -float 0
 
# [HIDDEN] Disable dashboard
defaults write com.apple.dashboard mcx-disabled -boolean true

###############################################################################
# System Preferences > Language & Text                                        #
###############################################################################
 
# Languages
defaults write -g AppleLanguages -array "en"
 
# Use symbol and text substitution
defaults write -g NSUserReplacementItemsEnabled -bool false
defaults write -g WebAutomaticTextReplacementEnabled -bool false
 
# Correct spelling automatically
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
 
# Region
defaults write -g AppleLocale -string "en_US@currency=EUR"
defaults write -g AppleMeasurementUnits -string "Centimeters"
defaults write -g AppleMetricUnits -bool true

###############################################################################
# System Preferences > Notifications                                          #
###############################################################################
 
# Disable Notification Center and remove the menu bar icon
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2>/dev/null
 
###############################################################################
# System Preferences > Energy Saver                                           #
###############################################################################
 
#### Power Adapter
 
# Computer sleep: Never
sudo pmset -c sleep 0

###############################################################################
# System Preferences > Keyboard                                               #
###############################################################################
 
# Key Repeat
defaults write -g KeyRepeat -int 0
 
# Delay Until Repeat
defaults write -g InitialKeyRepeat -int 10
 
# [HIDDEN] Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false
 
# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300
 
# [HIDDEN] Full keyboard access for all controls 
# (so you can navigate through the UI using keyboard)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
 
###############################################################################
# System Preferences > Mouse                                                  #
###############################################################################
 
# Scroll direction
defaults write -g com.apple.swipescrolldirection -bool false
 
# [HIDDEN] Smooth scrolling
defaults write -g AppleScrollAnimationEnabled -bool false
defaults write -g NSScrollAnimationEnabled -bool false
 
# [HIDDEN] Rubberband scrolling (doesn't affect web views)
defaults write -g NSScrollViewRubberbanding -bool false
 
###############################################################################
# System Preferences > Trackpad                                               #
###############################################################################
 
### Point & Click
 
# Look up
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 0
 
### More Gestures
 
# Notification Center
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
 
# App Expose
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
 
# Launchpad
defaults write com.apple.dock showLaunchpadGestureEnabled -bool false

###############################################################################
# System Preferences > Sharing                                                #
###############################################################################
 
# Set computer name
sudo scutil --set ComputerName "Eve"
sudo scutil --set HostName "Eve"
sudo scutil --set LocalHostName "Eve"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "Eve"
 
###############################################################################
# System Preferences > Users & Groups                                         #
###############################################################################
 
# Allow guests to log in to this computer
sudo defaults write /Library/Preferences/com.apple.loginwindow 'GuestEnabled' -bool false
 
### Login Options
 
# Show the Sleep, Restart, and Shut Down buttons
sudo defaults write /Library/Preferences/com.apple.loginwindow 'PowerOffDisabled' -bool true
 
# Show Input menu in login window
sudo defaults write /Library/Preferences/com.apple.loginwindow 'showInputMenu' -bool false
 
# Show password hints
sudo defaults write /Library/Preferences/com.apple.loginwindow 'RetriesUntilHint' -int 0

###############################################################################
# System Preferences > Date & Time                                            #
###############################################################################
 
### Time Zone
 
# Set the timezone; see `systemsetup -listtimezones` for other values
systemsetup -settimezone "Europe/Paris" > /dev/null
 
### Clock
 
# Date format
defaults write com.apple.menuextra.clock 'DateFormat' -string 'EEE MMM d   h:mm:ss a'
 
###############################################################################
# System Preferences > Software Update                                        #
###############################################################################
 
# [HIDDEN] Check for software updates daily, not just once per week
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ScheduleFrequency -int 1

###############################################################################
# Misc.                                                                       #
###############################################################################
 
# Disable window animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
 
# Window resize speed for Cocoa applications
defaults write -g NSWindowResizeTime -float .001
 
# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
 
# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
 
# Disable "Reopen windows when logging back in"
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
 
# Disable auto-correct
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
 
# Disable system-wide resume
defaults write -g NSQuitAlwaysKeepsWindows -bool false
 
# Enable subpixel font rendering on non-Apple LCDs
defaults write -g AppleFontSmoothing -int 2
 
# Disable crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"
 
# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
 
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
 
# Show remaining battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
 
# Enable Verbose boot
sudo nvram boot-args="-v"
 
# Show the ~/Library directory
chflags nohidden ~/Library
 
# Disable Hibernation
sudo pmset -a hibernatemode 0
sudo rm /var/vm/sleepimage
 
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
 
# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
 
# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

### Finder
 
# Show all filename extensions in Finder
defaults write -g AppleShowAllExtensions -bool true
 
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
 
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
 
# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
 
# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true
 
# Use current directory as default search scope
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
 
# Show Path bar
defaults write com.apple.finder ShowPathbar -bool true
 
# Show Status bar
defaults write com.apple.finder ShowStatusBar -bool true
 
# disable window animations and Get Info animations
defaults write com.apple.finder AnimateInfoPanes -bool false
defaults write com.apple.finder AnimateWindowZoom -bool false
defaults write com.apple.finder DisableAllAnimations -bool true
 
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
 
# allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true
 
# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
 
# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0
 
# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
 
### DMG
 
# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
 
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

###############################################################################
# Safari                                                                      #
###############################################################################
 
# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"
 
# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
 
# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
 
# Hide Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool false
 
# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
 
# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
 
# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
 
# Remove useless icons from Safari’s bookmarks bar
defaults write com.apple.Safari ProxiesInBookmarksBar "()"
 
# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
 
# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

###############################################################################
# Calculator                                                                  #
###############################################################################
 
# View mode (`Basic`, `Scientific`, `Programmer`)
defaults write com.apple.calculator ViewDefaultsKey -string "Scientific"
 
# Show Thousands Separator
defaults write com.apple.calculator SeparatorsDefaultsKey -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################
 
for app in Finder Dock Dashboard SystemUIServer Calculator Safari; do
  killall "$app" > /dev/null 2>&1
done
 
echo "Done. Note that some of these changes require a logout/restart to take effect."
