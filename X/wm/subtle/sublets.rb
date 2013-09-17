sublet :clock2 do
   date_format    "%y-%m-%d"
   date_color     "#0D0Ef0"
   time_format    "%H:%M"
   time_color     "#900DF9"
end

sublet :volume do
end

sublet :mpd do
   format_string     "%title% by %artist%"
   interval          30
   title_color       "#eee"
   pause_color       "#909090"
   artist_color      "#CC7683"
   show_icons        false
   show_colors       true
end

sublet :battery do
   color_text  true
   colors      10  => "#FF0000",
               20  => "#399BFF",
               80  => "#33CC00",
               100 => "#00FF00"
   path "/sys/class/power_supply/BAT0"
end

sublet :wifi do
   interval 107
end

sublet :pacman do
   interval 311
   separator " - "
end
