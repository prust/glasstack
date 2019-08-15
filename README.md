# Neutrino

A light, flexible alternative to browser-based runtimes like Electron.

Foundation: the project consists of Javascript bindings (via the duktape engine) to the following C libraries:

* [x] GLFW (OpenGL support)
  * [ ] glfw bindings via https://github.com/lzubiaur/duk-glfw
* [ ] libcurl (http/s, network support)
  * [ ] libcurl bindings via https://github.com/creationix/dukcurl
* [ ] [Nuklear]() or [Quarks](https://gist.github.com/vurtun/c5b0374c27d2f5e9905bfbe7431d9dc0) (Immediate Mode GUI, includes stb libraries for text handling)
  * [ ] UI duktape bindings
* [ ] SQLite (local database)
  * [ ] sqlite duktape bindings (prev work: https://github.com/abiliojr/sqlite-js, https://github.com/fasterthanlime/duklite)
* [ ] stb_image (image loading)
  * [ ] stb_image bindings

## Core Goals:

* Users should be able to easily flag which components they want to include via compile-time flags
* Users should be able to swap out different components (GUI library, DB library, etc) if they have other preferences
* Users should be able to easily add new components via dropping in a C library and writing duktape bindings for it
* Components should be dynamically linked for easier compilation and to allow in-place updating of components (to patch bugs and security vulnerabilities in a component)

## Future Goals

* Users should be able to write apps that run on mobile, as well as desktop, via [GLFM](https://github.com/brackeen/glfm)

## NTH Goals

* It might be nice if users could choose to statically compile to a single executable, for use as an installer or a single-file executable download. That said, I'm not sure this will be worth the effort.

## Alternative UI Implementation

* Probably building on Quarks, I would like to make it so the layout/UI logic can be controlled by JS, but anything that needs to run frequently, like animation, will be running in C. Some common layout algorithms may also be written in C for a performance boost. I'm not familiar enough yet with Quarks to know how this will work.

## Alternative DB Implementation

* As an optional alternative to SQLite, I would like to provide a lower-level DB-like API with the power of SQL (joins, indexes, aggregates, etc) but in an imperative way instead of declarative, and with explicit saving/loading from disk to memory and vice-versa.

* Being imperative and explicit about *how* a query will be performed (which indexes are being used, in what order) will remove the complex AI of a traditional query planner and provide simplicity, deterministic performance and clarity about which indexes are being used, etc. Ideally I would like to use B+ Trees (not log-structured merge), and/or flat arrays. It should include indexes and a relational data model, but should not need a Query Planner, since queries will be explicit and imperative.

* Being explicit about what records and indexes are loaded into memory will allow the application to "own" the DB's in-memory cache and treat it as its own in-memory data.
