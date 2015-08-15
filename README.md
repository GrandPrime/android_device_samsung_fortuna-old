android_device_samsung_fortuna
==============================

Device tree for Samsung Galaxy Grand Prime [Fortuna]

Device tree uses common: https://github.com/CyanogenMod/android_device_cyanogen_msm8916-common

For build TeamWinRecoveryProject (TWRP): `TW=y make -j4 recoveryimage`
ToDo with recovery:
	-- fix restore*
	-- set enforcing SELinux
	-- fix brightness
	-- fix MTP

* Restore bug:
We need to restore KitKat two steps:
1. Restore without data then Wipe > Factory Reset > Reboot system
2. After boot, hold the Power Button and reboot to recovery, then restore data
Done :)

Credits:
	-- Moto E 2015 (codename:surnia) contributors (https://github.com/Motorola-CyanogenMod)
	-- CM contributors developing msm8916 (https://github.com/CyanogenMod)
	-- Tell me if I have forgotten about you :)
