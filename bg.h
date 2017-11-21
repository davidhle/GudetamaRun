
//{{BLOCK(bg)

//======================================================================
//
//	bg, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 297 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 9504 + 4096 = 14112
//
//	Time-stamp: 2017-11-21, 15:23:55
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG_H
#define GRIT_BG_H

#define bgTilesLen 9504
extern const unsigned short bgTiles[4752];

#define bgMapLen 4096
extern const unsigned short bgMap[2048];

#define bgPalLen 512
extern const unsigned short bgPal[256];

#endif // GRIT_BG_H

//}}BLOCK(bg)
