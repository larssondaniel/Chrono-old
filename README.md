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

// Perform task

[Chrono stop:@"lightTask"];

// Perform more tasks

[Chrono stop:@"heavyTask"];
```

```objective-c
lightTask finished in 812.55 µs
heavyTask finished in 3.94 s
```
