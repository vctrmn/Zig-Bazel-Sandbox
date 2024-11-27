const std = @import("std");
const stdout = std.io.getStdOut().writer();

pub const helloWorld = "Hello World !";

pub fn printHelloWorld() !void {
    try stdout.print("Hello World !\n", .{});
}
