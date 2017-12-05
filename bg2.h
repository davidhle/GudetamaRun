
//{{BLOCK(bg2)

//======================================================================
//
//	bg2, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 18 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 576 + 2048 = 3136
//
//	Time-stamp: 2017-12-04, 20:13:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG2_H
#define GRIT_BG2_H

#define bg2TilesLen 576
extern const unsigned short bg2Tiles[288];

#define bg2MapLen 2048
extern const unsigned short bg2Map[1024];

#define bg2PalLen 512
extern const unsigned short bg2Pal[256];

#endif // GRIT_BG2_H

//}}BLOCK(bg2)
