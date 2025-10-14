# Example MOD for Amazing Cultivation Simulator Mobile

## 1. How to create a MOD
The easiest and fastest way is to modify configuration files (settings/scripts). Put the modified files in the same directory under the mod folder to be loaded.
For configuration files and documentation, see: https://github.com/GSQStudio/acs1_mods/tree/master/Docs

## 2. How to configure your MOD
Create an `Info.json` file in the root directory of your MOD. Fill in the following content:
```json
{
  "Name": "ExampleMod",
  "DisplayName": "Example Mod",
  "Desc": "This is an official demonstration mod, showing some of the features mods can provide.",
  "Author": "GSQ",
  "UIPackage": null,
  "Dependencies": null
}
```
**Explanation:**
- **Name**: English ID
- **DisplayName**: Display name
- **Desc**: Description, UBB tags supported
- **Author**: Author
- **UIPackage**: UI package, fill in if you have custom UI files,e.g.`UI/Sample"`
- **Dependencies**: Other MODs required, use GitHub URLs, e.g. `["https://github.com/GSQStudio/acs1_example_mod"]`

## 3. How to publish your MOD
Publish a Release and use numbers and dots for the Tag name.
e.g.
0.0.1
0.1
1.2

---

# 了不起的修仙模拟器移动版 MOD 范例

## 1. 如何制作一个MOD
修改配置文件（settings/scripts）是最简单最快的方式，将修改后的文件放在 mod 文件夹下的相同目录就可以被正常调用。
配置文件以及相关说明请查看：https://github.com/GSQStudio/acs1_mods/tree/master/Docs

## 2. 如何配置MOD
在 MOD 根目录创建 Info.json 文件。填写以下内容：
```json
{
  "Name": "ExampleMod",
  "DisplayName": "Example Mod",
  "Desc": "这是一个模组的官方示范，它演示了模组可以提供的部分功能。",
  "Author": "GSQ",
  "UIPackage": "UI/Sample",
  "Dependencies": null
}
```
**说明：**
- **Name**: 英文ID
- **DisplayName**: 显示的名字
- **Desc**: 描述，可以使用UBB标签
- **Author**: 作者
- **UIPackage**: UI包，如果你有自制的UI文件就需要填写它,e.g.`UI/Sample"`
- **Dependencies**: 依赖的其他MOD，需要填写github的地址，例如 `["https://github.com/GSQStudio/acs1_example_mod"]`

## 3. 如何发布MOD
发布一个 Release，使用数字和点来命名 Tag。
e.g.
0.0.1
0.1
1.2


