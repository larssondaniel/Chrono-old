# Chrono

`Chrono` is a lightweight and easy-to-use timer for profiling processes on iOS.

## Usage

Create timers on the fly and stop them whenever you are finished with what is being profiled.

```objective-c
[Chrono start:@"someTask"];

// Perform task

[Chrono stop:@"someTask"];
```
console:
```
someTask finished in 135.25 ms
```

#### Multiple operations & operations split up into pieces:
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
console:
```
lightTask finished in 82.55 ms
---------------------------------------------
heavyTask finished in 5.90 s
heavyTask - firstPart took 1.14 s (19.32%)
heavyTask - secondPart took 1.02 s (17.28%)
heavyTask - thirdPart took 3.74 s (63.40%)
```

## Contributing
If you have feature requests or bug reports, feel free to help out by sending pull requests or by creating new issues.

## License
`Chrono` is distributed under the terms and conditions of the [MIT license](https://github.com/larssondaniel/Chrono/blob/master/LICENSE).
