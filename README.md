# AttitudeIndicator


AttitudeIndicator is just a simple horizon view that display pitch and roll.

For use it, it´s necessary to do this:
```
AttitudeIndicator * ai = [[AttitudeIndicator alloc] init];

[ai setCurrentPitch: XX]; //Current pitch in degrees

[ai setCurrentRoll: XX];  //Current roll in degrees

[ai updateHorizon];
```

Enjoy :)
