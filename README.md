# Neutrino

A minimalistic, zero-abstraction runtime for desktop applications.

Neutrino consists of a default set of C libraries and Javascript bindings for them so developers can write applications using Javascript and/or C. The following libraries are planned:

* [x] [GLFW](https://www.glfw.org) (Desktop OpenGL support)
  * [ ] bindings via [duk-glfw](https://github.com/lzubiaur/duk-glfw)
* [ ] [Nuklear](https://github.com/vurtun/nuklear) (GUI)
  * [ ] bindings
* [ ] [libcurl](https://curl.haxx.se/libcurl/) (http/s, network support)
  * [ ] bindings via [dukcurl](https://github.com/creationix/dukcurl)
* [ ] [SQLite](https://sqlite.org/index.html) (client-side database)
  * [ ] bindings (previous work: [sqlite-js](https://github.com/abiliojr/sqlite-js), [duklite](https://github.com/fasterthanlime/duklite))
* [ ] [stb_image](https://github.com/nothings/stb) (image loading)
  * [ ] bindings
* [ ] [GLFM](https://github.com/brackeen/glfm) (Mobile OpenGL support)

## Javascript Engine

Neutrino embeds the [duktape](https://duktape.org) javascript engine because it is small, easy to integrate, and easy to write bindings for. We intentionally avoid JIT engines (like v8) that pursue performance at the expense of simplicity and size because we believe that the overall performance and maintainability of the application stack is enhanced when performance-critical sections of code are written in C and the application developers understand the low-level code as well as high-level.

## Library Goals

Users should be able to easily:

* remove libraries they don't want (by not including the DLL? or not setting compile macro flags?)
* add alternative libraries (alternative GUI, DB, etc) by dropping in a C library and writing duktape bindings
* update libraries by dropping in an updated version of the dynamic library (to patch bugs and security vulnerabilities)
