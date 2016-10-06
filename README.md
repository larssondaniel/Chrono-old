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

#### Events within operations:
```objective-c
[Chrono start:@"heavyTask"];

// Do work
[Chrono addEvent:@"loaded" forOperation:@"heavyTask"];
// Do work
[Chrono addEvent:@"gotResult" forOperation:@"heavyTask"];
// Do work
[Chrono addEvent:@"manipulatedResult" forOperation:@"heavyTask"];

[Chrono stop:@"heavyTask"];
```
console:
```
heavyTask finished in 5.90 s
heavyTask - loaded at 1.05 s (17.79%)
heavyTask - gotResult at 3.02 s (51.18%)
heavyTask - manipulatedResult at 5.74 s (97.28%)
```

## Contributing
If you have feature requests or bug reports, feel free to help out by sending pull requests or by creating new issues.

## License
`Chrono` is distributed under the terms and conditions of the [MIT license](https://github.com/larssondaniel/Chrono/blob/master/LICENSE).
