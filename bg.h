
//{{BLOCK(bg)

//======================================================================
//
//	bg, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 410 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 13120 + 4096 = 17728
//
//	Time-stamp: 2017-11-30, 16:43:19
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG_H
#define GRIT_BG_H

#define bgTilesLen 13120
extern const unsigned short bgTiles[6560];

#define bgMapLen 4096
extern const unsigned short bgMap[2048];

#define bgPalLen 512
extern const unsigned short bgPal[256];

#endif // GRIT_BG_H

//}}BLOCK(bg)
