neutrinomake:
ifeq ($(OS),Windows_NT)
	gcc -o neutrino.exe neutrino.c
else
	gcc -o neutrino neutrino.c glad_gl.c -Iinclude -L lib -lglfw.3 -rpath lib -framework Cocoa -framework OpenGL -framework IOKit -framework CoreVideo
endif
