# braille-chars - Braille for OpenSCAD

## Basic usage

This library makes it easy to add a line of Braille to your 3D models.
For example, to write the message "hello world", you can use
the following code:

```
use <braille-chars/ueb.scad>

braille_label(["H", "E", "L", "L", "O", "", "W", "O", "R", "L", "D"]);
```

The full set of options for the function is:
```
module braille_label(chars, plate_thickness=2, lie_flat=false)
```

Note that each Braille symbol needs to have its own entry in the list.
Space can be written as an empty string, a space in quotes, or the
lowercase word "space".

Explicit contractions and other symbols are supported, so you can use
a capital sign, period, and a wordsign like this:

```
use <braille-chars/english.scad>

braille_label(["cap", "H", "E", "L", "L", "O", "", "dot456", "W", "."]);
```

Multi-letter contractions, nemeth digits, and punctuation have their own
names which are listed in the [Symbol reference] section, Note that letters and
contractions are in all caps, while indicators, nemeth number prefixes, and
dotXXX combinations are in lowercase.

## Geometry and orientation
By default, `braille_label` will produce the given text on a 2mm thick
vertical plate, with the dots facing toward you (in the -y direction).
This is the most suitable for printing standalone Braille labels, as
Braille printed vertically tends to have better tactile quality and
the dots are more resilient.

You can also choose to have the Braille label lying flat, simply
set `lie_flat=true` and you won't have to manually rotate it.

You can control the thickness of the base plate with `plate_thickness`.
If you set it to zero, no base plate will be produced. Half of the spheres
making up the braille dots will protrude below the X-Y plane, so you must
have a surface for them to merge with in your model.

### Coordinates
**When printed vertically:**
The back of this plate will be against the XZ plane, and the left of it
will be against the YZ plane.

**When printed flat:**
The plate's lower left corner will be at the origin, and the plate will lie in
the +x +y quadrant.

## Symbol reference
|Group | Symbol names
|------|----------------
Letters |`A` `B` `C` `D` `E` `F` `G` `H` `I` `J` `K` `L` `M` `N` `O` `P` `Q` `R` `S` `T` `U` `V` `W` `X` `Y` `Z` 
Strong groupsigns |`CH` `SH` `TH` `WH` `OU` `ST` `GH` `ED` `ER` `OW` `AR` `ING` 
Strong contractions |`AND` `FOR` `OF` `THE` `WITH` 
Strong wordsigns |`CHILD` `SHALL` `THIS` `WHICH` `OUT` `STILL` 
Lower groupsigns |`EA` `BB` `CC` `FF` `GG` `BE` `CON` `DIS` `EN` `IN` 
Lower wordsigns |`BE` `IN` `ENOUGH` `WERE` `HIS` `WAS` 
Indicators |`cap` `#` `grade1` 
Punctuation |`,` `.` `'` `:` `-` `!` `?` `;` `lquote` `rquote` ` ` `space` 
Digits |`1` `2` `3` `4` `5` `6` `7` `8` `9` `0` 
Nemeth digits |`n1` `n2` `n3` `n4` `n5` `n6` `n7` `n8` `n9` `n0` 
Nemeth symbols |`-` `n.` `n+` 
Other dot combinations |`dot4` `dot5` `dot45` `dot456` `dot56` `dot46` 

## Acknowledgements & License
This is an evolution of a library that was improved by multiple people.
Most of the work was done by others.

- Original library by Andreas Kahler: https://www.thingiverse.com/thing:4758
- Contractions added by Sean Tikkun: https://www.thingiverse.com/thing:74358
- Nemeth added by PortlandPrints: https://www.thingiverse.com/thing:3490757
- Adapted to be included as a library by Troy Deck

License: http://creativecommons.org/licenses/by/3.0/

## Contributing
If you have a correction, yo can submit a PR or file an issue in GitHub.

If you're interested in adding support for another language, I'd love to collaborate on that and am happy to accept PRs to add new language files.
