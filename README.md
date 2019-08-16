# Neutrino

A light, flexible alternative to browser-based runtimes like Electron.

Neutrino consists of Javascript bindings (via the duktape engine) to the following C libraries:

* [x] GLFW (OpenGL support)
* [x] OS X build
* [ ] [Nuklear](https://github.com/vurtun/nuklear) (Immediate Mode GUI, includes stb libraries for text handling)
* [ ] Windows build
* [ ] duktape
* [ ] glfw bindings via [duk-glfw](https://github.com/lzubiaur/duk-glfw)
* [ ] Nuklear duktape bindings
* [ ] libcurl (http/s, network support)
* [ ] libcurl bindings via [dukcurl](https://github.com/creationix/dukcurl)
* [ ] SQLite (local database)
* [ ] sqlite duktape bindings (previous work: [sqlite-js](https://github.com/abiliojr/sqlite-js), [duklite](https://github.com/fasterthanlime/duklite))
* [ ] stb_image (image loading)
* [ ] stb_image duktape bindings

## Component Goals:

Users should be able to:

* flag which components they want to include via compile-time flags
* swap out different components (GUI library, DB library, etc) if they have other preferences
* add new native components by dropping in a C library and writing duktape bindings for it
* update components by dropping in an updated version of the dynamic library (to patch bugs and security vulnerabilities)

## v2.0 Goals

* Users should be able to write apps that run on mobile, as well as desktop, via [GLFM](https://github.com/brackeen/glfm)
