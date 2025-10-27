# Example MOD for Amazing Cultivation Simulator Mobile

## 1. How to create a MOD
The easiest and fastest way is to modify configuration files (settings/scripts). Put the modified files in the same directory under the mod folder to be loaded.
For configuration files and documentation, see: https://github.com/GSQStudio/acs1_mods/tree/master/Docs

## 2. How to configure your MOD
In the MOD root directory:
- Place a square image named `Preview.png` for preview.
- Create an `Info.json` file. Fill in the following content:
```json
{
  "Name": "ExampleMod",
  "DisplayName": "Example Mod",
  "Desc": "This is an official demonstration mod, showing some of the features mods can provide.",
  "Author": "GSQ",
  "UIPackage": "UI/Sample",
  "Dependencies": null
}
```
**Explanation:**
- **Name**: English ID
- **DisplayName**: Display name
- **Desc**: Description, UBB tags supported
- **Author**: Author
- **UIPackage**: UI package, fill in if you have custom UI files, e.g. `"UI/Sample"`
- **Dependencies**: Other MODs required, use GitHub URLs, e.g. `["https://github.com/GSQStudio/acs1_example_mod"]`

## 3. How to publish your MOD
Publish a Release and use numbers and dots for the Tag name.
e.g.
- 0.0.1
- 0.1
- 1.2

## 4.Add MOD to the official list
https://github.com/GSQStudio/acs1_mods/

---

# 了不起的修仙模拟器移动版 MOD 范例

## 1. 如何制作一个MOD
最简单最快的方法是修改配置文件（settings/scripts），将修改后的文件放在 mod 文件夹下的相同目录即可被加载。
配置文件及相关说明请查看：https://github.com/GSQStudio/acs1_mods/tree/master/Docs

## 2. 如何配置你的MOD
在 MOD 根目录：
- 放置一张正方形图片，命名为 `Preview.png`，用于预览。
- 创建 `Info.json` 文件，填写如下内容：
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
- **DisplayName**: 显示名称
- **Desc**: 描述，支持UBB标签
- **Author**: 作者
- **UIPackage**: UI包，如果有自定义UI文件需填写，例如 `"UI/Sample"`
- **Dependencies**: 依赖的其他MOD，填写GitHub地址，例如 `["https://github.com/GSQStudio/acs1_example_mod"]`

## 3. 如何发布你的MOD
发布一个 Release，Tag 名称使用数字和点。
例如：
- 0.0.1
- 0.1
- 1.2

## 4.添加mod到官方列表
https://github.com/GSQStudio/acs1_mods/


