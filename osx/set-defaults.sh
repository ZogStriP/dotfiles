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
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-others -array
 
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


