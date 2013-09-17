(1..5).each do |key|
   grab "W-#{key}", "ViewSwitch#{key}".to_sym
end

#grab "W-r" do |command|
#   puts command.name
#end

grab "W-q r", :SubtleReload
grab "W-q C-R", :SubtleRestart
grab "W-q q", :WindowKill

grab "W-Tab", :WindowLower
grab "W-S-Tab", :WindowRaise

#grab "W-Return", "urxvt -T term"
grab "W-r t", "urxvt -T term"
grab "W-r c", "chromium"
grab "W-r r", "urxvt -e ranger"

grab "XF86AudioRaiseVolume", "amixer -c 0 set Master 2dB+"
grab "Xf86AudioLowerVolume", "amixer -c 0 set master 2dB-"
grab "XF86AudioMute", "amixer -c 0 set master toggle"

grab "W-h", :WindowLeft
grab "W-j", :WindowDown
grab "W-k", :WindowUp
grab "W-l", :WindowRight

grab "W-Left",    [ :left50, :left70, :left30 ]
grab "W-Right",   [ :right50, :right70, :right30 ]
grab "W-Up",      [ :top50, :top70, :top30 ]
grab "W-Down",     [ :bottom50, :bottom70, :bottom30 ]
grab "W-space",    [ :full, :stack ]
grab "W-A-space",  :WindowFull

grab "W-r Return" do Subtle::Contrib::Launcher.run; end
grab "W-C-space" do subtle::Contrib::Selector.run; end
