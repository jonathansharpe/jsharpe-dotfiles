## QPlatinum Plasma Theme

This is a color shifting theme that is meant to look as much like Mac OS9 (AKA Platinum) as possible. There are still a lot of improvements to be made, but I think it's more or less usable at this point.

This is a combination of my own work and a few SVGs cribbed from a few other themes, mostly QtStep (though at this point I think I at least edited every single one to conform more to my color-matching goals), but also probably Trellium Solid. There might still be something left from Windows 9x and Atelier, but I'm not sure. I also can't underestimate how helpful it was to study [Andi's amazing themes](https://www.pling.com/u/abgr/) (QtStep and Trellium) to figure out how to actually make an old-school-looking theme using SVG assets.

## IMPORTANT NOTE ABOUT COMPATIBLE COLOR-SCHEMES

Because Platinum uses the accent color pretty extensively, and several different versions of it, it's very important that you have 4 different shades/tints of the accent color assigned to the following colors in your Qt color-scheme, from lightest to darkest:

  * View Hover
  * View Focus
  * Button Focus
  * Button Hover

I would also recommend having the _View Background_ color be lighter than the _Window Background_ color, and the _Button Color_ be the same as the _Window Background_, but it's not necessary. You can study the color schemes included in this package for ideas.

