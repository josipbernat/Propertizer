# Propertizer
Propertizer is Xcode source extension for easily adding @property commands in ObjectiveC source files.
During Alcatraz plugin era I used a plugin which helped me autocomplete @property using @t shortcut. In Xcode 8 Alcatraz doesn't work so I decided to make an Xcode extension similar to mentioned plugin. Hope you will love it.

![alt tag](https://cloud.githubusercontent.com/assets/2537227/19682256/10d0c48e-9aad-11e6-9ece-c026bed9839e.png)
![alt tag](https://cloud.githubusercontent.com/assets/2537227/19682257/10d14b34-9aad-11e6-8a3c-2c6a17c7775a.png)

### Installation Guide (Xcode 8 / OSX 10.11+)

- Close Xcode
- (*OSX 10.11 only*) `sudo /usr/libexec/xpccachectl`
- Download the [Propertizer app](https://github.com/josipbernat/Propertizer/files/550601/Propertizer.app.zip)
- Unzip and copy to Applications folder
- Run (right click + open)
- ` -> System Preferences... -> Extensions -> All -> Enable Propertizer`
- Open Xcode
- Select a source file
- Use it using `Editor -> Propertizer -> some command...` 

##Note
- Sometimes Propertizer doesn't show in Editor menu even you did instalation guide steps. Open up Xcode and launch Propertizer, it should appear in Editor menu. From now on you don't have to launch Propertizer app.
