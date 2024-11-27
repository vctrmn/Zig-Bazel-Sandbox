const printHelloWorld = @import("utils/hello.zig").printHelloWorld;
const base32 = @import("base32_module");
const yaml = @import("zig_yaml_module");
const std = @import("std");

const Allocator = std.mem.Allocator;
const stdout = std.io.getStdOut().writer();

/// Function to parse a YAML string and print its representation.
pub fn parseAndPrintYaml(allocator: Allocator, yamlStringInput: []const u8) !void {
    var untyped = try yaml.Yaml.load(allocator, yamlStringInput);
    defer untyped.deinit();
    try untyped.stringify(stdout);
}

/// Function to encode a string in base32 and print the result.
fn encodeString() !void {
    const input = "Hello, World!";
    const size = comptime base32.std_encoding.encodeLen(input.len);
    var buf: [size]u8 = undefined;

    const output = base32.std_encoding.encode(&buf, input);
    try stdout.print("base32 encoding:\n input: {s}\noutput: {s}\n", .{ input, output });
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    const source =
        \\names: [ John Doe, MacIntosh, Jane Austin ]
        \\numbers:
        \\  - 10
        \\  - -8
        \\  - 6
        \\nested:
        \\  some: one
        \\  wick: john doe
        \\finally: [ 8.17,
        \\           19.78      , 17 ,
        \\           21 ]
    ;

    try printHelloWorld();
    try parseAndPrintYaml(allocator, source);
    try encodeString();
}
