const std = @import("std");
const glfw = @import("mach-glfw");
const gamemode = @import("mach-gamemode");

// Default GLFW error handling callback
fn errorCallback(error_code: glfw.ErrorCode, description: [:0]const u8) void {
    std.log.err("glfw: {}: {s}\n", .{ error_code, description });
}

fn keyCallback(window: glfw.Window, key: glfw.Key, scancode: i32, action: glfw.Action, mods: glfw.Mods) void {
    _ = mods;
    _ = scancode;
    switch (key) {
        .escape => if (action == .release) window.setShouldClose(true),
        else => {},
    }
}

pub fn main() !void {
    glfw.setErrorCallback(errorCallback);
    if (!glfw.init(.{})) {
        std.log.err("failed to initialize GLFW: {?s}", .{glfw.getErrorString()});
        std.process.exit(1);
    }
    defer glfw.terminate();

    gamemode.start(); // can use .isActive() to see if it's running
    defer gamemode.stop();

    const window = glfw.Window.create(600, 400, "GLFW window", null, null, .{}) orelse {
        std.log.err("failed to create GLFW window: {?s}", .{glfw.getErrorString()});
        std.process.exit(1);
    };

    defer window.destroy();

    while (!window.shouldClose()) {
        window.swapBuffers();
        glfw.pollEvents();
        window.setKeyCallback(keyCallback);
    }
}
