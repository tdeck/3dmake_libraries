/*
English Braille + Nemeth Module

Authors:
- Andreas Kahler: https://www.thingiverse.com/thing:4758
- Sean Tikkun: https://www.thingiverse.com/thing:74358
- PortlandPrints: https://www.thingiverse.com/thing:3490757
- Adapted to be included as a library by Troy Deck
License: http://creativecommons.org/licenses/by/3.0/
*/


// mm sizes from http://dots.physics.orst.edu/gs_layout.html
dot_height = .6;
dot_base_width = 1.44;
spacing = 2.34; // Spacing between dot centers in the same cell
distance = 6.2; // Spacing between dot centers in adjacent cells

plate_height = 10; // This is the character cell height (i.e. the length of the 3 dots + padding)

function braille_text_width(chars_or_count) =
    (is_num(chars_or_count) ? chars_or_count : len(chars_or_count)) * distance;

function braille_plate_width(chars_or_count) =
    braille_text_width(chars_or_count) + distance;

module braille_label(chars, plate_thickness=2, lie_flat=false) {
    assert(is_list(chars), "braille_label accepts a list of characters");
    char_count = len(chars);

    rotation = lie_flat ? [0, 0, 0] : [90, 0, 0];

    rotate(rotation) {
        for (count = [0:char_count-1]) {
            translate(v = [count * distance + distance/2, 0, plate_thickness]) {
                _braille_char(chars[count]);
            }
        }
        if (plate_thickness > 0) {
            color([0,0,1]) {
                cube(size = [distance * (char_count+1), plate_height, plate_thickness]);
            }
        }
    }
}

module _letter(bitmap) {
    row_size = 2;
    col_size = 3;
    bitmap_size = row_size * col_size;
    
    vertical_padding = (plate_height - dot_base_width - 2*spacing) / 2;
    
    function loc_x(loc) = loc % row_size * spacing  + (distance-spacing)/2;
    function loc_y(loc) = (2 - floor(loc / row_size)) * spacing + dot_base_width/2 + vertical_padding;

    for (loc = [0:bitmap_size - 1]) {
        if (bitmap[loc] != 0) {
            translate(v = [loc_x(loc), loc_y(loc), 0]) {
                scale([1, 1, 2*dot_height/dot_base_width]) {
                    sphere(d=dot_base_width, $fs=.4);
                }
            }
        }
    }
}


module _braille_char(char) {
    // The "DOCSTART", "DOCEND", "Group:" and "Also:" comments here are used to generate documentation
    
    // DOCSTART
    // Group: Letters
    if (char == "A") {
        _letter([
            1,0,
            0,0,
            0,0
        ]);
    } else if (char == "B") {
        _letter([
            1,0,
            1,0,
            0,0
        ]);
    } else if (char == "C") {
        _letter([
            1,1,
            0,0,
            0,0
        ]);
    } else if (char == "D") {
        _letter([
            1,1,
            0,1,
            0,0
        ]);
    } else if (char == "E") {
        _letter([
            1,0,
            0,1,
            0,0
        ]);
    } else if (char == "F") {
        _letter([
            1,1,
            1,0,
            0,0
        ]);
    } else if (char == "G") {
        _letter([
            1,1,
            1,1,
            0,0
        ]);
    } else if (char == "H") {
        _letter([
            1,0,
            1,1,
            0,0
        ]);
    } else if (char == "I") {
        _letter([
            0,1,
            1,0,
            0,0
        ]);
    } else if (char == "J") {
        _letter([
            0,1,
            1,1,
            0,0
        ]);
    } else if (char == "K") {
        _letter([
            1,0,
            0,0,
            1,0
        ]);
    } else if (char == "L") {
        _letter([
            1,0,
            1,0,
            1,0
        ]);
    } else if (char == "M") {
        _letter([
            1,1,
            0,0,
            1,0
        ]);
    } else if (char == "N") {
        _letter([
            1,1,
            0,1,
            1,0
        ]);
    } else if (char == "O") {
        _letter([
            1,0,
            0,1,
            1,0
        ]);
    } else if (char == "P") {
        _letter([
            1,1,
            1,0,
            1,0
        ]);
    } else if (char == "Q") {
        _letter([
            1,1,
            1,1,
            1,0
        ]);
    } else if (char == "R") {
        _letter([
            1,0,
            1,1,
            1,0
        ]);
    } else if (char == "S") {
        _letter([
            0,1,
            1,0,
            1,0
        ]);
    } else if (char == "T") {
        _letter([
            0,1,
            1,1,
            1,0
        ]);
    } else if (char == "U") {
        _letter([
            1,0,
            0,0,
            1,1
        ]);
    } else if (char == "V") {
        _letter([
            1,0,
            1,0,
            1,1
        ]);
    } else if (char == "W") {
        _letter([
            0,1,
            1,1,
            0,1
        ]);
    } else if (char == "X") {
        _letter([
            1,1,
            0,0,
            1,1
        ]);
    } else if (char == "Y") {
        _letter([
            1,1,
            0,1,
            1,1
        ]);
    } else if (char == "Z") {
        _letter([
            1,0,
            0,1,
            1,1
        ]);

    // Group: Strong groupsigns
    } else if (char == "CH") {
        _letter([
            1,0,
            0,0,
            0,1
        ]);
    } else if (char == "SH") {
        _letter([
            1,1,
            0,0,
            0,1
        ]);
    } else if (char == "TH") {
        _letter([
            1,1,
            0,1,
            0,1
        ]);
    } else if (char == "WH") {
        _letter([
            1,0,
            0,1,
            0,1
        ]);
    } else if (char == "OU") {
        _letter([
            1,0,
            1,1,
            0,1
        ]);
    } else if (char == "ST") {
        _letter([
            0,1,
            0,0,
            1,0
        ]);
    } else if (char == "GH") {
        _letter([
            1,0,
            1,0,
            0,1
        ]);
    } else if (char == "ED") {
        _letter([
            1,1,
            1,0,
            0,1
        ]);
    } else if (char == "ER") {
        _letter([
            1,1,
            1,1,
            0,1
        ]);
    } else if (char == "OW") {
        _letter([
            0,1,
            1,0,
            0,1
        ]);
    } else if (char == "AR") {
        _letter([
            0,1,
            0,1,
            1,0
        ]);
    } else if (char == "ING") {
        _letter([
            0,1,
            0,0,
            1,1
        ]);

    // Group: Strong contractions
    } else if (char == "AND") {
        _letter([
            1,1,
            1,0,
            1,1
        ]);
    } else if (char == "FOR") {
        _letter([
            1,1,
            1,1,
            1,1
        ]);
    } else if (char == "OF") {
        _letter([
            1,0,
            1,1,
            1,1
        ]);
    } else if (char == "THE") {
        _letter([
            0,1,
            1,0,
            1,1
        ]);
    } else if (char == "WITH") {
        _letter([
            0,1,
            1,1,
            1,1
        ]);

    // Group: Strong wordsigns
    } else if (char == "CHILD") {
        _letter([
            1,0,
            0,0,
            0,1
        ]);
    } else if (char == "SHALL") {
        _letter([
            1,1,
            0,0,
            0,1 
        ]);
    } else if (char == "THIS") {
        _letter([
            1,1,
            0,1,
            0,1 
        ]);
    } else if (char == "WHICH") {
        _letter([
            1,0,
            0,1,
            0,1 
        ]);
    } else if (char == "OUT") {
        _letter([
            1,0,
            1,1,
            0,1 
        ]);
    } else if (char == "STILL") {
        _letter([
            0,1,
            0,0,
            1,0 
        ]);

    // Group: Lower groupsigns
    } else if (char == "EA") {
        _letter([
            0,0,
            1,0,
            0,0
        ]);
    } else if (char == "BB") {
        _letter([
            0,0,
            1,0,
            1,0
        ]);
    } else if (char == "CC") {
        _letter([
            0,0,
            1,1,
            0,0
        ]);
    } else if (char == "FF") {
        _letter([
            0,0,
            1,1,
            1,0
        ]);
    } else if (char == "GG") {
        _letter([
            0,0,
            1,1,
            1,1
        ]);
    } else if (char == "BE") { // Also: Lower wordsigns
        _letter([
            0,0,
            1,0,
            1,0
        ]);
    } else if (char == "CON") {
        _letter([
            0,0,
            1,1,
            0,0
        ]);
    } else if (char == "DIS") {
        _letter([
            0,0,
            1,1,
            0,1
        ]);
    } else if (char == "EN") {
        _letter([
            0,0,
            1,0,
            0,1
        ]);
    } else if (char == "IN") { // Also: Lower wordsigns
        _letter([
            0,0,
            0,1,
            1,0
        ]);

    // Group: Lower wordsigns
    } else if (char == "ENOUGH") {
        _letter([
            0,0,
            1,0,
            0,1 
        ]);
    } else if (char == "WERE") {
        _letter([
            0,0,
            1,1,
            1,1 
        ]);
    } else if (char == "HIS") {
        _letter([
            0,0,
            1,0,
            1,1 
        ]);
    } else if (char == "WAS") {
        _letter([
            0,0,
            0,1,
            1,1 
        ]);

    // Group: Indicators
    } else if (char == "cap") {
        _letter([
            0,0,
            0,0,
            0,1
        ]);
    } else if (char == "#") {
        _letter([
            0,1,
            0,1,
            1,1
        ]);
    } else if (char == "grade1") {
        _letter([
            0,0,
            0,1,
            0,1 
        ]);

    // Group: Punctuation
    } else if (char == ",") {
        _letter([
            0,0,
            1,0,
            0,0 
        ]);
    } else if (char == ".") {
        _letter([
            0,0,
            1,1,
            0,1
        ]);
    } else if (char == "'") {
        _letter([
            0,0,
            1,0,
            1,0 
        ]);
    } else if (char == ":") {
        _letter([
            0,0,
            1,1,
            0,0 
        ]);
    } else if (char == "-") { // Also: Nemeth symbols
        _letter([
            0,0,
            0,0,
            1,1
        ]);
    } else if (char == "!") {
        _letter([
            0,0,
            1,1,
            1,0
        ]);
    } else if (char == "?") {
        _letter([
            0,0,
            1,0,
            1,1
        ]);
    } else if (char == ";") {
        _letter([
            0,0,
            1,0,
            1,0 
        ]);
    } else if (char == "lquote") {
        _letter([
            0,0,
            1,0,
            1,1
        ]);
    } else if (char == "rquote") {
        _letter([
            0,0,
            0,1,
            1,1
        ]);
    } else if (char == "" || char == " " || char == "space") {
        // Don't need to do anything

    // Group: Digits
    } else if (char == "1") {
        _letter([
            1,0,
            0,0,
            0,0
        ]);
    } else if (char == "2") {
        _letter([
            1,0,
            1,0,
            0,0
        ]);
    } else if (char == "3") {
        _letter([
            1,1,
            0,0,
            0,0
        ]);
    } else if (char == "4") {
        _letter([
            1,1,
            0,1,
            0,0
        ]);
    } else if (char == "5") {
        _letter([
            1,0,
            0,1,
            0,0
        ]);
    } else if (char == "6") {
        _letter([
            1,1,
            1,0,
            0,0
        ]);
    } else if (char == "7") {
        _letter([
            1,1,
            1,1,
            0,0
        ]);
    } else if (char == "8") {
        _letter([
            1,0,
            1,1,
            0,0
        ]);
    } else if (char == "9") {
        _letter([
            0,1,
            1,0,
            0,0
        ]);
    } else if (char == "0") {
        _letter([
            0,1,
            1,1,
            0,0
        ]);

    // Group: Nemeth digits
    } else if (char == "n1") {
        _letter([
            0,0,
            1,0,
            0,0
        ]);
    } else if (char == "n2") {
        _letter([
            0,0,
            1,0,
            1,0
        ]);
    } else if (char == "n3") {
        _letter([
            0,0,
            1,1,
            0,0
        ]);
    } else if (char == "n4") {
        _letter([
            0,0,
            1,1,
            0,1
        ]);
    } else if (char == "n5") {
        _letter([
            0,0,
            1,0,
            0,1
        ]);
    } else if (char == "n6") {
        _letter([
            0,0,
            1,1,
            1,0
        ]);
    } else if (char == "n7") {
        _letter([
            0,0,
            1,1,
            1,1
        ]);
    } else if (char == "n8") {
        _letter([
            0,0,
            1,0,
            1,1
        ]);
    } else if (char == "n9") {
        _letter([
            0,0,
            0,1,
            1,0
        ]);
    } else if (char == "n0") {
        _letter([
            0,0,
            0,1,
            1,1
        ]);

    // Group: Nemeth symbols
    } else if (char == "n.") {
        _letter([
            0,1,
            0,0,
            0,1 
        ]);
    } else if (char == "n+") {
        _letter([
            0,1,
            0,0,
            1,1 
        ]);

    // Group: Other dot combinations
    } else if (char == "dot4") {
        _letter([
            0,1,
            0,0,
            0,0
        ]);
    } else if (char == "dot5") {
        _letter([
            0,0,
            0,1,
            0,0
        ]);
    } else if (char == "dot45") {
        _letter([
            0,1,
            0,1,
            0,0
        ]);
     } else if (char == "dot456") {
        _letter([
            0,1,
            0,1,
            0,1
        ]);
    } else if (char == "dot56") {
        _letter([
            0,0,
            0,1,
            0,1 
        ]);
    } else if (char == "dot46") {
        _letter([
            0,1,
            0,0,
            0,1 
        ]);
    // DOCEND
    } else {
        assert(false, str("Invalid Character: ", char));
    }
}
