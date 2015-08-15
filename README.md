# android_device_samsung_fortuna

## Device tree for Samsung Galaxy Grand Prime [Fortuna]


Check the [`local_manifests`](./local_manifests) directory.

In the [`TWRP_odin`](./TWRP_odin) directory is TWRP build flashable via odin.

## For build TeamWinRecoveryProject (TWRP):
```
TW=y make -j4 recoveryimage
```

## ToDo with recovery:
* fix restore*
* set enforcing SELinux
* fix brightness
* fix MTP

## Restore bug:
We need to restore KitKat two steps:
0. Restore without data then Wipe > Factory Reset > Reboot system
0. After boot, hold the Power Button and reboot to recovery, then restore data
**Done** :sweat_smile:

## Credits:
- [x] Moto E 2015 (codename:surnia) contributors (https://github.com/Motorola-CyanogenMod)
- [x] CM contributors developing msm8916 (https://github.com/CyanogenMod)
- [x] Tell me if I have forgotten about you :)
