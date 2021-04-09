<p align="center">
  <img src="data/icons/128/com.github.plugarut.wingpanel-monitor.svg" alt="Wingpanel Monitor icon"/>
</p>
<h1 align="center">Wingpanel Monitor</h1>

![Screenshot](data/screenshot_1.png)

## Building and Installation

You'll need the following dependencies:

```
libglib2.0-dev
libgtop2-dev
libgranite-dev
libgtk-3-dev
libwingpanel-2.0-dev
libgeoclue-2-dev
libgweather-3-dev
meson
valac
```

You can install them running:

```
sudo apt install libgtop2-dev libgranite-dev libgtk-3-dev libwingpanel-2.0-dev meson valac libgeoclue-2-dev libgweather-3-dev
```

Run `meson` to configure the build environment and then `ninja` to build

```
meson build --prefix=/usr
cd build
ninja
```

To install, use `ninja install`

```
sudo ninja install
com.github.plugarut.wingpanel-monitor
```

## Special thanks and credits
 - [Plugaru T.](https://github.com/PlugaruT/) for developing the [original project](https://github.com/PlugaruT/wingpanel-monitor).
 - [Nararyans R.I.](https://github.com/Fatih20) for the icon
 - Network widget icon (net-symbolic.svg) made by [Freepik](https://www.freepik.com) from [https://www.flaticon.com/](www.flaticon.com)
 - [Mathieu Rousseau](https://github.com/mathieurousseau) for developing the [disk widget code](https://github.com/mathieurousseau/wingpanel-monitor/commit/3cf5b9ebde5639be041e713d79119f6add99a1ac)
 - Disk widget icon (disk-symbolic.svg) made by [Pixel perfect](https://www.flaticon.com/authors/pixel-perfect) from [https://www.flaticon.com/](www.flaticon.com)
