style :all do
   padding     0, 3, 0, 0
   background  "#151515"
   foreground  "#eee"
   border      "#eee", 0
   font        "xft:Dejavu:bold:pixelsize=9:antialias=true"
end

style :views do
   padding     3, 8, 3, 8
   foreground  "#909090"
   icon        "#909090"

   style :focus do
      icon        "#eee"
      foreground  "#eee"
      background  "#31658C"
   end

   style :urgent do
      icon        "#eee"
      foreground  "#eee"
      border      "#8EDF8D", 1
   end

   style :occupied do
      icon        "#eee"
      foreground  "#eee"
      background  "#333333"
   end
end

style :title do
   padding     3, 8, 0, 8
   foreground  "#909090"
end

style :sublets do
   padding     3, 6, 0, 8
end

style :separator do
   padding     1, 0, 1, 0
   foreground  "#909090"
   separator   "//"
end

style :clients do
   active      "#eee", 2
   inactive    "#3B2D22"
   margin      0
   width       50
end

style :subtle do
   margin            0, 0, 0, 0
   panel_top         "#151515"
   panel_bottom      "#151515"
   launcher_top      "#202020"
   launcher_bottom   "#ff0000"
   stipple           "#757575"
end
