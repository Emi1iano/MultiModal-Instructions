const std = @import("std");

var EXCERISE = [_][]const u8 {
    "const std = @import(std);\n",
    "\n",
    "pub fn main() !void {\n",
        "\tstd.debug.print(\"Hello World\\n\", .{});\n",
    "\n",
        "\tvar gpa = std.heap.GeneralPurposeAllocator(.{}).init;\n",
        "\tdefer _ = gpa.deinit();\n",
        "\tvar alloc = gpa.allocator();\n",
    "\n",
        "\tconst string = cin(alloc) catch \"\";\n",
        "\tdefer alloc.free(string);\n",
        "\tstd.debug.print(\"You Typed: {s}\", .{string});\n",
    "}\n",
    "\n",
    "fn cin(alloc: std.mem.Allocator) ![]const u8 {\n",
        "\tvar buffer: [64]u8 = undefined;\n",
        "\tvar reader = std.fs.File.stdin().reader(&buffer);\n",
        "\tvar input = &reader.interface;\n",
    "\n",
        "\tvar writer = std.Io.Writer.Allocating.init(alloc);\n",
        "\tdefer writer.deinit();\n",
    "\n",
        "\tif(input.streamDelimiter(&writer.writer, '\\n')) |length| {\n",
            "\t\treturn try alloc.dupe(u8, writer.written()[0..length-1]);\n",
        "\t} else |err| return err;\n",
    "}\n\n",
    "Explaination of Strings in zig\n",
    "Explaination of Reader\n",
    "Explaination of Writer\n",
    "EXIT\n",
};

var EXPLAINATION = [_][]const u8 {
    \\ We create a variable called std that will hold the standard library
    \\ Using the @import builtin we can import the std library from zig
    \\
    ,
    \\ Nothing here to explain
    \\
    ,
    \\ We create a main function and make it public so you can call the function from outside the file
    \\ The return type will be an error union meaning we can return an error (!) or return nothing (void)
    \\
    ,
    \\ Some test code to print out a Hello World
    \\
    ,
    \\ Nothing here to explain
    \\
    ,
    \\ We create a General Purpose Allocator that will allocate memory on the heap for us
    \\ We initialize it and pass it an empty config (.{})
    \\ The allocator will be able to keep track of the memory we allocate and tell us
    \\ if we forget to free up the memory we allocated
    \\
    ,
    \\ Since we initialized the allocator we have to deinitialize it which returns a value
    \\ so we set it to _ which will ignore the return type.
    \\
    ,
    \\ We create a actual allocator using the General Purpose one we made.
    \\
    ,
    \\ Nothing here to explain
    \\
    ,
    \\ We call our cin function and pass it the allocator we made
    \\ Since our cin function can return an error we use the catch keyword
    \\ so that if a error is returned we default to the empty string ""
    \\
    ,
    \\ Since we allocated memory manually we have to free it up
    \\ Using the keyword defer means that the line of code will be executed after the block 
    \\ it is called in exits, so in this case it will be called when main exits
    \\
    ,
    \\ We simply print out what the user typed into the terminal
    \\
    ,
    \\ Nothing here to explain
    \\
    ,
    \\ Nothing here to explain
    \\
    ,
    \\ We create a function called cin with a parameter alloc of type std.mem.Allocator
    \\ The return type of this function is an error union meaning it can return a
    \\ error (!) or a string ([]const u8)
    \\
    ,
    \\ We create a array of size 64 of type u8 which is a type with 8 bits or 1 byte
    \\ also known as a char variable
    \\ We set the array to undefined since we aren't initializing it to anything
    \\
    ,
    \\ We create a reader for our terminal, std.fs.File.stdin() gives us the file that represents
    \\ out terminal, doing .reader() gives us the reader for the file which is how you interact with
    \\ files in Zig, in this case read from the file
    \\ We pass the reader the buffer we created by reference so that the reader is able to modify
    \\ the contents of the buffer, the size of the buffer we created matters because the size dicates
    \\ the amount of characters we can read from the terminal at a time so a buffer with a size of 1
    \\ would mean that we would read one character from the terminal at a time which is ineffiecient
    \\ and slow, so pick a appropriate size for the buffer
    \\
    ,
    \\ Since our reader is a interface for reading files we have to take the pointer of the interface
    \\ so we get access to all the functions that the reader provides us
    \\ To explain further the reader we have is a File reader which is a implementation of the IO reader 
    \\ So to get access to the IO readers functions through the File reader we have to get the reference
    \\ to the File readers interface
    \\
    ,
    \\ Nothing here to explain
    \\
    ,
    \\ We create a IO writer which is where we will store all that the user types
    \\ Specifically we make it a allocating writer so that the more the user types
    \\ the more we are able to store in the writer for use later
    \\ We initialize it with the allocator we passed through the function
    \\
    ,
    \\ Since we initialized the writer we got to deinitialize it
    \\ Using the defer will ensure our writer is deinitialized at
    \\ the approiate time
    \\
    ,
    \\ Nothing here to explain
    \\
    ,
    \\ input.StreamDelimter() returns an error union so we put it an a if statement so that if
    \\ an error is returned we go to the else block, if the value is returned it will be the
    \\ length of characters read from the terminal
    \\ Since we specifically have a allocating writer which is an implementaion of a normal writer
    \\ we have to get the normal writer from the allocating writer by doing writer.writer
    \\ We need to send it by reference so that the function can actually write to our writer
    \\ We also tell the function when to stop reading from the terminal which we use '\n'
    \\ which is when the user presses enter
    \\
    ,
    \\ We return what the user typed in the terminal by allocating memory
    \\ We specify the type we want to duplicate (u8) and we pass it what we want to duplicate
    \\ writer.written() will return what was stored from the terminal 
    \\ We only duplicate was stored between 0 and length - 1 this will chop of the '\n' character
    \\ alloc.dupe() can return an error union so we use the try keyword so that if an error is returned
    \\ we crash the program
    \\
    ,
    \\ The else block for the if statement so that if input.streamDelimiter returns an error
    \\ we simply return the error
    \\
    ,
    \\ Nothing here to explain
    \\
    ,
    \\ Strings in Zig are represented by an array of u8, u8 meaning a variable with 8 bits also known
    \\ as 1 byte this is how characters are stored, so we essentially make a 'string' of characters 
    \\ that can represent our string 
    \\
    ,
    \\ The Reader is a interface that can be found in std.Io, Io meaning input output
    \\ The File reader we use is a implementation of the IO reader
    \\ In order to use the reader you need to pass it a buffer, the size of
    \\ the buffer is important because it is what dicates how many characters you will
    \\ read at a time
    \\ Reading from anything is a system call which is slow and inefficient so to 
    \\ reduce the number of system calls you want to pick a appropriate sized buffer
    \\
    ,
    \\ The Writer is a interface that can be found in std.Io, Io meaning input output
    \\ The Writer we use is a Allocating Writer which is a implementation of the 
    \\ Io Writer, we use the allocating writer because we don't know the length
    \\ of the string that the user will type and the allocating writer will automatically
    \\ increase its size to accommodate the length of the string
    \\
};

var MAX_LENGTHS: [30]u16 = undefined;

pub fn start() !void {
    calculateLengths();
    clearScreen();
    introduction();
    printWholeExcercise();
    std.debug.print("Enter a line number for more information on that line: ", .{});
    while(true) {
        const input = cinNUM();
        if(input == 0) {
            clearScreen();
            printWholeExcercise();
            std.debug.print("Enter a line number for more information on that line: ", .{});
            continue;
        }
        if(input == 30) {
            clearScreen();
            return;
        }
        clearScreen();
        printExplainationWithExcerise(input);
        std.debug.print("Enter a line number for more information on that line: ", .{});
    }
    
}

fn introduction() void {
    std.debug.print(
        \\ _    _ _____ _     _____ ________  ___ _____   _____ _____           
        \\| |  | |  ___| |   /  __ \  _  |  \/  ||  ___| |_   _|  _  |          
        \\| |  | | |__ | |   | /  \/ | | | .  . || |__     | | | | | |          
        \\| |/\| |  __|| |   | |   | | | | |\/| ||  __|    | | | | | |          
        \\\  /\  / |___| |___| \__/\ \_/ / |  | || |___    | | \ \_/ /          
        \\ \/  \/\____/\_____/\____/\___/\_|  |_/\____/    \_/  \___/           
        \\                                                                                                                                        
        \\ ___________ _____   _____ _   _ _____ ___________ _____  ___   _     
        \\|___  /_   _|  __ \ |_   _| | | |_   _|  _  | ___ \_   _|/ _ \ | |    
        \\   / /  | | | |  \/   | | | | | | | | | | | | |_/ / | | / /_\ \| |    
        \\  / /   | | | | __    | | | | | | | | | | | |    /  | | |  _  || |    
        \\./ /____| |_| |_\ \   | | | |_| | | | \ \_/ / |\ \ _| |_| | | || |____
        \\\_____/\___/ \____/   \_/  \___/  \_/  \___/\_| \_|\___/\_| |_/\_____/
        \\
        \\
        \\ Enter a line number for more information on that line.
        \\ Set terminal to full size for best experience. 
        \\
        \\ PRESS ENTER TO GET STARTED
        \\ 
        , .{});
    _ = cinNUM();
    clearScreen();
}

fn printExplainationWithExcerise(index: usize) void {
    if(index > EXCERISE.len or index > EXPLAINATION.len) {
        printWholeExcercise();
        return;
    }
    for(0..index) |i| {
        std.debug.print("{d:2}: {s}", .{i+1, EXCERISE[i]});
    }
    printExplainationNicely(index-1);
    //std.debug.print("{s}", .{EXPLAINATION[index-1]});
    for(index..EXCERISE.len) |i| {
        std.debug.print("{d:2}: {s}", .{i+1, EXCERISE[i]});
    }
}

fn printExplainationNicely(index: usize) void {
    std.debug.print("+", .{});
    for(0..MAX_LENGTHS[index]+1) |_| {
        std.debug.print("-", .{});
    }
    std.debug.print("+\n", .{});
    
    var index1: u16 = 0;
    var index2: u16 = 0;
    for(EXPLAINATION[index]) |c| {
        if(c == '\n') {
            std.debug.print("|", .{});
            std.debug.print("{s}", .{EXPLAINATION[index][index2..index1]});
            if(index1 - index2 < MAX_LENGTHS[index]) {
                for(0..MAX_LENGTHS[index] - (index1 - index2)) |_|{
                    std.debug.print(" ", .{});
                }
            }
            std.debug.print(" |\n", .{});
            //std.debug.print("|", .{});
            index2 = index1 + 1;
        }
        index1 += 1;
    }

    std.debug.print("+", .{});
    for(0..MAX_LENGTHS[index]+1) |_| {
        std.debug.print("-", .{});
    }
    std.debug.print("+\n", .{});
}

fn printWholeExcercise() void {
    for(EXCERISE, 1..) |line, index| {
        std.debug.print("{d:2}: {s}", .{index, line});
    }
}

fn clearScreen() void {
    std.debug.print("\x1B[2J\x1B[H", .{});
}

fn cinNUM() usize {
    var gpa = std.heap.GeneralPurposeAllocator(.{}).init;
    defer _ = gpa.deinit();
    var alloc = gpa.allocator();

    const string = cin(alloc);
    defer alloc.free(string);
    std.debug.print("{s}", .{string});

    var result: usize = 0;
    for(string) |c| {
        switch (c) {
            '0'...'9' => {
                result = result * 10 + (c - 48);
            },
            else => {},
        }
    }
    return result;
}

fn cin(alloc: std.mem.Allocator) []const u8 {
    var buffer: [64]u8 = undefined;
    var reader = std.fs.File.stdin().reader(&buffer);
    var input = &reader.interface;

    var writer = std.Io.Writer.Allocating.init(alloc);
    defer writer.deinit();

    if(input.streamDelimiter(&writer.writer, '\n')) |value| {
        return alloc.dupe(u8, writer.written()[0..value]) catch "";
    } else |_| {
        return ""; 
    }
}

fn calculateLengths() void {
    var index: u16 = 0;
    for (EXPLAINATION) |lines| {
        var max: u16 = 0;
        var index1: u16 = 0;
        var index2: u16 = 0;
        for (lines) |c| {
            if(c == '\n') {
                if(max < index1 - index2) {
                    max = index1 - index2;
                }
                index2 = index1 + 1;
            }
            index1 += 1;
        }
        MAX_LENGTHS[index] = max;
        index += 1;
    }
}