# Chrono

### Usage
```objective-c
[Chrono start:@"someTask"];

// Perform task

[Chrono stop:@"someTask"];
```

```objective-c
someTask finished in 135.25 ms
```

Multiple operations:
```objective-c
[Chrono start:@"lightTask"];
[Chrono start:@"heavyTask"];

// Do work
[Chrono subOperation:@"firstPart" operation:@"heavyTask"];
// Do work
[Chrono subOperation:@"secondPart" operation:@"heavyTask"];
// Do work
[Chrono subOperation:@"thirdPart" operation:@"heavyTask"];

[Chrono stop:@"lightTask"];
[Chrono stop:@"heavyTask"];
```

```objective-c
lightTask finished in 812.55 µs
---------------------------------------------
heavyTask finished in 5.90 s
heavyTask - firstPart took 1.14 s (19.32%)
heavyTask - secondPart took 1.02 s (17.28%)
heavyTask - thirdPart took 3.74 s (63.40%)

```
