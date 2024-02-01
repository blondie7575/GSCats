# Cat Fight

## Introduction

This is a simple game in the style of Apple II Artilley, Scorched Earth, or Worms– but with cats and nobody gets hurt. The goal is simply to make the other cat so angry that they pee themselves (based on the true story of Tinker and Sprocket's first encounter).

This was written as an exercise for me to learn the fundamentals of Apple IIgs game programming, and I certainly won't claim there's anything special here technically. The neatest part is probably the terrain, which is deformable and scrolls at 60fps on stock hardware. Well, sometimes it does, anyway, depending on how you hold your nose. The GS is hard. Also it no longer does it at 60fps since I built a whole game on top of that engine. It was neat for a while, okay? I did a whole KansasFest presentation about it. There's a video. Google it yourself. I'm not your mother.

If nothing else, I do think this project serves as a solid starting point for anyone interested in writing GS games. The basics are all here- an art pipeline with compiled sprites, a VBL-synced game loop, input handling, fonts, animation system, and sound. All the things you need on a GS, and all things that are hard on the GS. I'll describe these systems in more detail below.


## Running The Game

The included 800k disk image should load fine in any emulator or on real hardware. It should run on any GS with 512k or more of RAM, and no acceleration is required. The game runs of ProDOS 8 and can in theory be copied to a hard drive, but at the moment the volume name is hardcoded in the loader. Sorry, it's lame, I know. The image boots Bitsy Bye, and the game is called CATFIGHT. Run that and enjoy spitting at your opponent all the live long day.


## Acknowledgements

I'm writing this game now because I'm learning all the things I wished I could know when I was a teenager and playing all the amazing GS games. Games like Rastan, Task Force, Alien Mind, The Immortal, and Sword of Sodan that did things that people said the GS shouldn't be capable of. I was never able to acquire the knowledge of how these things were done back then, but thanks to an amazing modern retro community, I can! In that spirit, thanks to:

- John Brooks, who has forgotten more about the GS than I will ever know.
- Rebecca Heineman, who wrote every good game on the platform that you probably played except the ones John wrote
- Jeremy Rand, who is inspiring to me with his prolific retro programming endeavours and humble spirit. Not to mention I learned a lot from reading his code for [BuGS](https://github.com/jeremysrand/BuGS).
- Brutal Deluxe, who have made so many great GS tools, including [Mr. Sprite](http://www.brutaldeluxe.fr/products/crossdevtools/mrsprite/index.html) and Cadius, upon which this game depends. I doubt you could find anyone more consistently devoted to the platform than these guys. Mr. Sprite's Tech Page is probably the greatest single treatise ever written on how to do fast Apple IIgs graphics.
- Dagen Brock and Kent Dickey, for tirelessly maintaining [GSPlus](https://apple2.gs/plus/) and [KEGS](https://kegs.sourceforge.net) respectively. Without good emulators, retro-development dies, so thank you for fighting the good fight, gents. Emulating the GS is a thankless job for a platform almost nobody cares about.
- All of the KansasFest and Apple II community on Slack and elsewhere

## Memory map

The GS's memory banks in Cat Fight are allocated as follows:

- Bank $00 : *Loader*
- Bank $02 : *Code*. Most of this 64k bank is filled with the game code
- Bank $03 : *Sprites*. This bank holds all compiled sprite rendering code
- Bank $04 : *Sound*. The bank of audio samples to be loaded into Ensoniq live here
- Bank $05 : *Fonts*. The game uses three compiled fonts, and the rendering code lives here
- Bank $06 : *Title Screen*. Loaded here for copying into VRAM as needed

This means Cat Fight requires a minimum of 512k of RAM. I've never seen a GS with less than 1.25MB of RAM in the wild, but I suppose they exist. The very earliest machines shipped with 256k, so it's possible. Those people can't play my game. You're not missing much.


## The Loader

Cat Fight is a little too big to be a trivial "let ProDOS load it and run" game, so it needed a loader. However the loader is very silly and slow. I made no effort to make this clever. I steal as much memory as I can from bank $00 without stepping on ProDOS 8 to use as a loading buffer. Chunks are loaded from disk into this buffer, then copied into the banks where they need to live. If the bank is full (64k) then I have to do this in two steps since I obviously can't load a full 64k into bank $00 without stepping on something important. Nothing is compressed, which is admittedly lame. At least I made a pretty loading bar for you to look at. Once loaded, however, the game is fully RAM resident so you can play all day with no more loading.

Why on earth did I use ProDOS 8, you might ask? A very reasonable question. The truth is, because it's simple, easy, and still reasonably compatible with solid state devices, hard drives, and GS/OS. It's a clean ProDOS 8 app that plays nice with quitting and such. GS/OS is such a beast and I don't want to deal with it. I did my time on that back in the day. Writing a custom RWTS loader is neat, but not compatible with anything else. ProDOS 8 is a nice middle ground. Hey, if it's good enough for Wil Harvey (Zany Golf, The Immortal) it's sure as hell good enough for me. He didn't even use a *current* ProDOS 8. At least I'm using John Brooks' cool new one. The only weirdness comes from the fact that ProDOS 8 is 8-bit and doesn't know about the IIgs. This means you have to run ProDOS 8 calls in emulation, then go native to copy the data into other banks. ProDOS 8 can't load into other banks because it doesn't know that a universe can have more than 64k in it, and wouldn't believe you if you told it.


## The Sprite Engine

Cat Fight's sprites are rendered in a typical Apple IIgs way, which is to say a very strange way to anyone who doesn't know this platform. Bank $01/E1 memory shadowing is enabled, the stack is placed at $2000 in bank $01, then pixels are drawn by pushing on to the stack. Because all writes to the super hi-res video buffer on the GS are forced to 1MHz, this stack relocation trick allows us to render as quickly as possible. With stack pushing, you get cheap memory writes (no separate load and store) and you get pointer incrementing for free. When rendering constant values, it's possible to exceed one pixel per clock cycle. It's still 1MHz, but at least it's as few of those slow cycles as possible. To render sprites this way, you need a sprite compiler. If you want a lot more technical detail on how GS sprite compiling works, check out the Mr. Sprite link above. The gist is that it generates code that pushes constant values for all the pixels in your sprite to the stack. If you set up the stack to point at the video buffer before calling it, your sprite will be drawn. There are a huge number of devils in the details, but the basic idea is as simple as that.

## The Art Pipeline

All the artwork is done in GIF format via GIMP, since the GS uses indexed colour. GIF is an easy format to work in for indexed colour. These images are fed to the Brutal Deluxe tool called Mr. Sprite which generates blocks of code for rendering those sprites. One of the great things about the GS is that it has 16-bit index registers. That means you can reference every pixel on the screen with offset addressing modes. No fancy math or lookup tables required to calculate rendering positions. This makes sprite compiling really easy because you can assume the VRAM position to render at is stored in X, and the compiled sprite code can be general, while still compact and fast. The Makefile produces the compiled sprite code into a bank called SPRITEBANK when you `make art`. This Sprite Bank file is loaded into Bank 3 for use as indicated in the memory map above.

## The Font Compiler

Fonts on the GS are best rendered in a similar way to sprites- as compiled entities. I tried to use Mr. Sprite for this as I did the sprites, but the truth is Mr. Sprite is a little buggy. It's a fantastic tool and I have the utmost respect for Brutal Deluxe for writing it. I am forever endebted to them. However the specific bugs that it has are around quick colour transitions in small sprites, exactly what a font tends to do a lot of. I worked around the bugs for my main sprites, but for the fonts, I couldn't. I set out to write a subset of Mr. Sprite in Python, but I couldn't stop and ended up replicating about 99% of its features. My next game will probably use only this new Python implementation. You'l find it here as "CompileFont". The nice thing about it is that it's a modern Python implementation so it's completely portable to whatever your modern cross-development system is.


## The Terrain Engine

Rendering fast on the GS is all about compiling your pixel writes. This usually means sprite compiling, which is where you use an offline tool to convert your sprite art into code that renders those sprites directly, as explained above. For the terrain engine in Cat Fight, this means taking a 2D height map and compiling it into a series of stack push instructions to render as quickly as possible. It's similar to sprite compiling, but this has to be done on the fly. The way I did this was by limiting the terrain to a single colour. This means I only need four bit patterns to represent all possible terrain pixel patterns (since the GS has 4 pixels per word). We can store four bit patterns in four registers that can all be pushed- the accumulator, index X, index Y, and the Direct Page register. This means the terrain compiler generates a huge block of PHA, PHX, PHY, and PHD instructions to render the terrain. We're not done though, because the terrain needs to be deformable to make it a true artillery style game. To do this, sections of the terrain can be recompiled as needed to modify it. Compiling the entire map would be slow (and is only done once) but recompiling small "dirty rectangles" is so fast you don't notice it. Furthermore, the terrain has to scroll, which means we render an arbitrary 320 pixel wide section of it. To do this, the compiled terrain code is "clipped" by inserting a column of JMP instructions at the left edge of the virtual screen's location. Each row of terrain is rendered by jumping to the right edge entry point, then bouncing back at the left edge off the return JMP. When the terrain scrolls, that column of JMP instructions is replaced with the terrain data that was there. The column of terrain we overwrite to do this is saved in a little mini stack. To save and restore this data very quickly, I use the amazing GS trick of relocating the GS stack. I can push and pop this data to save/restore it very quickly into a little buffer than I hide in an unused area of bank $E0.

All of this is a little mind-bending because stack-based rendering means you do everything backwards. Sprites are rendered from bottom right to top left, and my terrain is rendered right-to-left on each row, and bottom to top overall.


## The Build Pipeline

The build is done with a makefile. The steps are:
1) A blank formatted disk image is created from scratch using Cadius
2) A functional ProDOS 8 disk is created by copying critical SYSTEM files to it
3) John Brooks' Bitsy Bye is copied over as a quick launcher
4) The fonts are compiled into a FONTBANK file, which is copied to the disk image
5) The titlescreen bitmap is copied to the disk image
6) The game code is assembled with ca65 into a CODEBANK file and copied to the disk image
7) The compiled sprite code (SPRITEBANK) is copied to the disk image
8) The sound data (SOUNDBANK) is copied to the disk image
9) The loader code is assembled with ca65, a ProDOS 8 executable is made, and copied to the disk image
10) An instance of the emulator GSPlus is launched with the disk image as the boot volume

All of that is fast enough to be done every time. The sprite compiling is only done when you manually `make art`. This generates the SPRITEBANK file copied in step 7 above. Similarly, the SOUNDBANK is only produced with a manual `make sound`.

## The Sound System

The sound bank (SOUNDBANK) is a 64k file that is already in the internal format expected by the Ensoniq for its sound ram. This file is generated from WAV files using a Python script GenerateSoundBank. These WAVs are converted into the very low fidelity format needed to fit in the Ensoniq, converted to the signed 8 bit format it expects, then packed together and padded out to the Ensoniq's 4k wavetable boundaries. Playing sound on the GS is quite easy. Getting audio files into the expected wavetable format is not, and I am especially indebted to Jeremy Rand for this step. At load time, the 64k bank is copied directly into Ensoniq instrument RAM and sounds are played from there. Cat Fight doesn't do any audio streaming, I just kept the sound minimal enough to fit in 64k.

 
### Sound Credits:

- Cat noise compilation, by Counter-gamer. Used with permission under CC3.0 license. [https://freesound.org/s/213889/](url)
- Cat Howl, by InspectorJ. Used with permission under CC4.0 license. [https://freesound.org/s/415209/](url)


## Known Bugs

I did my best to make this sufficiently bug free to play. I'm not aware of any open bugs. If there are any, they will mostly likely be rendering artifacts. For example, you might see half a floating cat head or a stray crosshair when the map scrolls. That sort of thing. The sprite rendering is admitedly not very robust, and doesn't handle overlaps well. I fixed all the cases I could find, but I would not be surprised if there are others.

The game may or may not actually be fun. It has had no playtesting or balancing work done. After seven years of working on this, I decided I just needed to finish it and it is what it is. It will not start some new revolution of retro-gaming enthusiasm on the GS.

The game has been tested on:
- The GSPlus emulator (v0.14)
- The KEGS emulator (v1.34)
- A ROM01 GS at 2.8MHz
- A ROM01 GS with Transwarp at 7MHz

