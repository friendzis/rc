tag "internets", "chromium|firefox"
tag "editor", "vim"
tag "term" do
   match "xterm|[u]?rxvt"
   exclude :name => "ncmpcpp|weechat|irssi"
   exclude :instance => "ncmpcpp|weechat|irssi"
end

tag "IDE" do
   match "ccstudio|eclipse"
end
