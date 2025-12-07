const std = @import("std");
const Mutlimodal = @import("MultiModal_Instructions");

pub fn main() !void {
    try Mutlimodal.start();
}
