begin
   require "#{ENV["HOME"]}/.config/subtle/contrib/selector.rb"
   require "#{ENV["HOME"]}/.config/subtle/contrib/launcher.rb"

   # Fonts
   Subtle::Contrib::Selector.font = "xft:Envy Code R:pixelsize=12:antialias=true"
   Subtle::Contrib::Launcher.fonts = [
      "xft:Envy Code R:pixelsize=80:antialias=true",
      "xft:Envy Code R:pixelsize=12:antialias=true",
   ]

   # Paths
   Subtle::Contrib::Launcher.paths = ["/usr/bin", "#{ENV["HOME"]}/bin"]

rescue LoadError => error
   puts error
end

# Options
set :increase_step,     5
set :border_snap,       10
set :default_gravity,   :max
set :urgent_dialogs,    false
set :honor_size_hints,  false
set :gravity_tiling,    false
set :click_to_focus,    true
set :skip_pointer_warp, false
set :skip_urgent_warp,  false

# Screens
load_config "#{ENV["HOME"]}/.config/subtle/screens.rb"

# Styles
load_config "#{ENV["HOME"]}/.config/subtle/styles.rb"

# Gravities
load_config "#{ENV["HOME"]}/.config/subtle/gravities.rb"

# Grabs
load_config "#{ENV["HOME"]}/.config/subtle/grabs.rb"

# Tags
load_config "#{ENV["HOME"]}/.config/subtle/tags.rb"

# Views
load_config "#{ENV["HOME"]}/.config/subtle/views.rb"

# Sublets
load_config "#{ENV["HOME"]}/.config/subtle/sublets.rb"

on :start do 
   views = Subtlext::View.all.map { |view| view.name }
   tags = Subtlext::Tag.all.map { |tag| tag.name }

   views.each do |view|
      unless tags.include?(view)
         tag = Subtlext::Tag.new(view)
         tag.save
      end
   end
end

on :client_create do |client|
   client.views.first.jump
   client.focus
end
