<div align="center">

<img src="https://orangefox.tech/icon.png" width="100" height="100"/>

# OrangeFox Recovery — TECNO Spark 40 Pro (KM6)

[![OrangeFox](https://img.shields.io/badge/OrangeFox-R12-orange?style=for-the-badge&logo=android)](https://orangefox.tech)
[![Branch](https://img.shields.io/badge/Branch-fox__12.1-blue?style=for-the-badge)](https://gitlab.com/OrangeFox/sync)
[![Device](https://img.shields.io/badge/Device-TECNO%20KM6-green?style=for-the-badge)](https://github.com)
[![Chipset](https://img.shields.io/badge/Chipset-Helio%20G100%20(MT6789)-red?style=for-the-badge)](https://github.com)
[![Release](https://github.com/husnimbark/Action-TWRP-Builder/releases)

</div>

---

## 📱 Device Information

| Property        | Value                         |
|-----------------|-------------------------------|
| **Device Name** | TECNO Spark 40 Pro            |
| **Codename**    | KM6                           |
| **Brand**       | TECNO                         |
| **Chipset**     | MediaTek Helio G100 (MT6789)  |
| **Architecture**| ARM64                         |
| **Partition**   | Virtual A/B (VAB)             |
| **Android**     | 12.1 (fox_12.1)               |
| **Build Target**| `vendor_boot.img`             |

---

## 🦊 Build Instructions

### Requirements
- Linux (Ubuntu 20.04+ recommended)
- At least **45 GB** free disk space
- Git, Python 3, and repo tool installed

### 1. Sync OrangeFox Sources

```bash
mkdir ~/OrangeFox_sync
cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git
cd sync
./orangefox_sync.sh --branch 12.1 --path ~/fox_12.1
```

### 2. Clone This Device Tree

```bash
cd ~/fox_12.1
git clone https://github.com/YOUR_USERNAME/device_tecno_KM6 device/tecno/TECNO-KM6
```

### 3. Build

```bash
cd ~/fox_12.1
source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_VIRTUAL_AB_DEVICE=1
lunch ofox_KM6-eng
mka adbd vendorbootimage
```

Output: `out/target/product/TECNO-KM6/OrangeFox-*.img`

---

## ⚙️ GitHub Actions (Auto Build)

Gunakan file `.github/workflows/OFOX.yml` yang sudah tersedia di repo ini.

1. Fork repo ini
2. Buka tab **Actions** → **OrangeFox - Build** → **Run workflow**
3. Isi input sesuai kebutuhan, lalu klik **Run**

Build akan otomatis sync source `fox_12.1` terbaru dan menghasilkan `vendor_boot.img`.

---

## 📦 Device Tree Structure

```
device/tecno/TECNO-KM6/
├── Android.mk
├── AndroidProducts.mk
├── BoardConfig.mk
├── device.mk
├── ofox_KM6.mk
├── vendorsetup.sh
├── prebuilt/
│   └── dtb.img
├── recovery/
│   └── root/
│       └── system/etc/
│           └── recovery.fstab
└── system.prop
```

---

## ✅ Features

| Feature                        | Status |
|--------------------------------|--------|
| Decryption (FBEv2 / FDE)       | ✅ Working |
| Virtual A/B support            | ✅ Working |
| Fastbootd                      | ✅ Working |
| ADB Sideload                   | ✅ Working |
| MTP / USB OTG                  | ✅ Working |
| EROFS partition support        | ✅ Working |
| Magisk flashing                | ✅ Working |
| Flashlight                     | ❌ Not Working |
| Backup & Restore               | ✅ Working |
| Vibrator/Haptics               | ❌ Not supported (hardware limitation) |

---

## ⚠️ Notes

- **DO NOT** use `fastboot boot` — device does not support it, will brick.
- Flash via **zip installer** only, or `fastboot flash vendor_boot vendor_boot.img` followed by `fastboot reboot recovery`.
- This is an **unofficial** build. Always make a full backup before flashing.
- Target Android: **12 and above only**. Do not use with Android 11 or earlier.
- Filesystem: system/vendor/product/system_ext/vendor_dlkm → **erofs** | odm_dlkm → **ext4** | userdata → **f2fs**

---

## 🙏 Credits

- [OrangeFox Recovery Project](https://orangefox.tech)
- [TeamWin (TWRP)](https://twrp.me)
- [LineageOS Project](https://lineageos.org)
- MediaTek & TECNO kernel/HAL sources

---

<div align="center">
<sub>Made with 🦊 for TECNO Spark 40 Pro (KM6)</sub>
</div>
