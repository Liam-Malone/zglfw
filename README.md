# Learning How To Use GLFW

This is a little test project for using glfw and vulkan

## Getting Started

This can be compiled using a nightly build of zig -- which should work on any platform

Currently included dependencies:
 - mach-glfw
 - mach-gamemode

Planned additional dependencies:
 - vulkan-zig-generated
 - mach-sysaudio
 - mach-freetype


## Notes From Mach-GLFW Guide

Reference: [Mach Engine site](https://machengine.org/pkg/mach-glfw/)

"Unfortunately, GLFW must return errors for a large portion of its functionality on some platforms, but especially for Wayland in particular. If you want your application to run well for most Linux users, you should e.g. merely log errors that are not critical."

A rough list of unsupported functions (on Wayland)

```
 - Window.setIcon
 - Window.setPos, Window.getPos
 - Window.iconify, Window.focus
 - Monitor.setGamma
 - Monitor.getGammaRamp, Monitor.setGammaRamp
```

