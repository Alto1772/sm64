# Super Mario 64

- This repo contains a full decompilation of Super Mario 64 (J), (U), (E), and (SH).
- Naming and documentation of the source code and data structures are in progress.
- It also contains the leaked levels from the original source, formatted to match the decomp's level format.

This repo does not include all assets necessary for compiling the ROMs.
A prior copy of the game is required to extract the assets.

## Currently added levels

**NOTE**: to access these levels, set ``gDebugLevelSelect`` on ``src/game/main.c`` to 1.

- [x] 1st (castle_beta)
- [x] 2nd (athlmap)
- [x] 3rd (donjon)
- [ ] 32nd
- [x] 35th (dummy)
- [ ] 37th
- [x] 38th (sand_test)

*This is still unfinished because the 32nd and 37th levels are just object test maps and some of the objects it contains are missing.*

## Quick Start (for Ubuntu)

1. Install prerequisites: `sudo apt install -y build-essential git binutils-mips-linux-gnu python3`
2. Clone the repo from within Linux: `git clone https://github.com/n64decomp/sm64.git`
3. Place a Super Mario 64 ROM called `baserom.<VERSION>.z64` into the project folder for asset extraction, where `VERSION` can be `us`, `jp`, or `eu`.
4. Run `make` to build. Qualify the version through `make VERSION=<VERSION>`. Add `-j4` to improve build speed (hardware dependent).

Ensure the repo path length does not exceed 255 characters. Long path names result in build errors.

## Installation

### Windows

#### WSL

Install WSL and a distro of your choice following
[Windows Subsystem for Linux Installation Guide for Windows 10.](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
We recommend either Debian or Ubuntu 18.04 Linux distributions under WSL.
Note: WSL1 does not currently support Ubuntu 20.04.

Next, clone the SM64 repo from within the Linux shell:
`git clone https://github.com/Alto1772/sm64.git -b newlevels`

Then continue following the directions in the [Linux](#linux) installation section below.

#### MSYS2
To install build dependencies:
```
sudo pacman -S base-devel gcc libelf mingw-w64-x86_64-capstone mingw-w64-x86_64-gcc
```
Install this AUR package using `makepkg`:
* [mips64-elf-binutils](https://aur.archlinux.org/packages/mips64-elf-binutils) (AUR)

_Note: I don't know if that breaks, I ain't an expert in toolchain building._

Build the tools directory first:
```
$ cd tools
$ source shell mingw64
$ cd ido5.3_recomp
$ CC=x86_64-pc-msys-gcc make -j4
$ cd ..
$ source shell msys
$ make -j4
$ cd ..
```
Explainations from above:
* `CC=x86_64-pc-msys-gcc make` - this is because Capstone is only available on MinGW builds.
* `source shell msys && make` - to use unix newlines (to avoid warning of CR `'\015'` on IDO from files generated from built tools) and fix buggy `patch_libultra_math`.

Then continue following the directions in [step 2](#step-2-copy-baseroms-for-asset-extraction-1) below.

### Linux

There are 3 steps to set up a working build.

#### Step 1: Install dependencies

The build system has the following package requirements:
 * binutils-mips
 * capstone
 * pkgconf
 * python3 >= 3.6

Dependency installation instructions for common Linux distros are provided below:

##### Debian / Ubuntu
To install build dependencies:
```
sudo apt install -y binutils-mips-linux-gnu build-essential git libcapstone-dev pkgconf python3
```

##### Arch Linux
To install build dependencies:
```
sudo pacman -S base-devel capstone python
```
Install the following AUR packages:
* [mips64-elf-binutils](https://aur.archlinux.org/packages/mips64-elf-binutils) (AUR)


##### Other Linux distributions

Most modern Linux distributions should have equivalent packages to the other two listed above.
You may have to use a different version of GNU binutils. Listed below are fully compatible binutils
distributions with support in the makefile, and examples of distros that offer them:

* `mips64-elf-` (Arch AUR)
* `mips-linux-gnu-` (Ubuntu and other Debian-based distros)
* `mips64-linux-gnu-` (RHEL/CentOS/Fedora)

You may also use [Docker](#docker-installation) to handle installing an image with minimal dependencies.

#### Step 2: Copy baserom(s) for asset extraction

For each version (jp/us/eu) for which you want to build a ROM, put an existing ROM at
`./baserom.<VERSION>.z64` for asset extraction.

##### Step 3: Build the ROM

Run `make` to build the ROM (defaults to `VERSION=us`).
Other examples:
```
make VERSION=jp -j4       # build (J) version instead with 4 jobs
make VERSION=eu COMPARE=0 # build (EU) version but do not compare ROM hashes
```

Resulting artifacts can be found in the `build` directory.

The full list of configurable variables are listed below, with the default being the first listed:

* ``VERSION``: ``us``, ``jp``, ``eu``, ``sh`` (WIP)
* ``GRUCODE``: ``f3d_old``, ``f3d_new``, ``f3dex``, ``f3dex2``, ``f3dzex``
* ``COMPARE``: ``1`` (compare ROM hash), ``0`` (do not compare ROM hash)
* ``NON_MATCHING``: Use functionally equivalent C implementations for non-matchings (Currently there aren't any non-matchings, but this will apply to Shindou and iQue). Also will avoid instances of undefined behavior.
* ``CROSS``: Cross-compiler tool prefix (Example: ``mips64-elf-``).

### macOS

With macOS, you may either use Homebrew or [Docker](#docker-installation).

#### Homebrew

#### Step 1: Install dependencies
Install [Homebrew](https://brew.sh) and the following dependencies:
```
brew update
brew install capstone coreutils gcc make pkg-config tehzz/n64-dev/mips64-elf-binutils
```

#### Step 2: Copy baserom(s) for asset extraction

For each version (jp/us/eu) for which you want to build a ROM, put an existing ROM at
`./baserom.<VERSION>.z64` for asset extraction.

##### Step 3: Build the ROM

Use Homebrew's GNU make because the version included with macOS is too old.

```
gmake VERSION=jp -j4       # build (J) version instead with 4 jobs
```

### Docker Installation

#### Create Docker image

After installing and starting Docker, create the docker image. This only needs to be done once.
```
docker build -t sm64 .
```

#### Build

To build, mount the local filesystem into the Docker container and build the ROM with `docker run sm64 make`.

##### macOS example for (U):
```
docker run --rm --mount type=bind,source="$(pwd)",destination=/sm64 sm64 make VERSION=us -j4
```

##### Linux example for (U):
For a Linux host, Docker needs to be instructed which user should own the output files:
```
docker run --rm --mount type=bind,source="$(pwd)",destination=/sm64 --user $UID:$GID sm64 make VERSION=us -j4
```

Resulting artifacts can be found in the `build` directory.

## Project Structure
	
	sm64
	├── actors: object behaviors, geo layout, and display lists
	├── asm: handwritten assembly code, rom header
	│   └── non_matchings: asm for non-matching sections
	├── assets: animation and demo data
	│   ├── anims: animation data
	│   └── demos: demo data
	├── bin: C files for ordering display lists and textures
	├── build: output directory
	├── data: behavior scripts, misc. data
	├── doxygen: documentation infrastructure
	├── enhancements: example source modifications
	├── include: header files
	├── levels: level scripts, geo layout, and display lists
	├── lib: SDK library code
	├── rsp: audio and Fast3D RSP assembly code
	├── sound: sequences, sound samples, and sound banks
	├── src: C source code for game
	│   ├── audio: audio code
	│   ├── buffers: stacks, heaps, and task buffers
	│   ├── engine: script processing engines and utils
	│   ├── game: behaviors and rest of game source
	│   ├── goddard: Mario intro screen
	│   └── menu: title screen and file, act, and debug level selection menus
	├── text: dialog, level names, act names
	├── textures: skybox and generic texture data
	└── tools: build tools

## Contributing

Pull requests are welcome. For major changes, please open an issue first to
discuss what you would like to change.

Run `clang-format` on your code to ensure it meets the project's coding standards.
