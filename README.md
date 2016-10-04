# TickTock

### Usage
```objective-c
[TickTock tick:@"someTask"];

// Perform task

[TickTock tock:@"someTask"];
```

```objective-c
someTask finished in 135.25 ms
```

Multiple operations:
```objective-c
[TickTock tick:@"lightTask"];
[TickTock tick:@"heavyTask"];

// Perform task

[TickTock tock:@"lightTask"];

// Perform more tasks

[TickTock tock:@"heavyTask"];
```

```objective-c
lightTask finished in 812.55 µs
heavyTask finished in 3.94 s
```
