#### 一分钟在线编译定制专属固件: [openwrt.ai](https://openwrt.ai)

### openwrt 软路由固件

## 使用说明 / Usage

### GitHub Actions 工作流

本仓库使用统一的 GitHub Actions 工作流来构建 OpenWrt 固件。

#### 手动触发构建

1. 进入 **Actions** 标签页
2. 选择 **Build OpenWrt** 工作流
3. 点击 **Run workflow** 按钮
4. 选择构建选项:
   - **target**: 选择要构建的平台 (或选择 "ALL" 构建所有平台)
   - **rockchip_device**: 如果选择了 rockchip_armv8 平台，可以选择特定的设备型号（支持79个设备）
   - **param**: 可选参数 (如 `ssh`, `nocache`, `notg` 等)

#### 支持的 Rockchip 设备

本项目支持79个 Rockchip 设备，包括但不限于:
- FriendlyARM NanoPi 系列 (R2S, R4S, R5S, R6S 等)
- Radxa Rock 系列 (Rock 3/4/5, Rock Pi 4A 等)
- Orange Pi 5 系列
- Hinlink OPC-H 系列
- 光影猫 (Photonicat) 系列
- 更多设备...

完整设备列表请参考工作流配置文件中的 `rockchip_device` 选项。

#### 自动化触发

工作流也支持通过 `repository_dispatch` 事件触发，适用于自动化场景。

## Acknowledgments

- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [ImmortalWrt](https://github.com/immortalwrt/immortalwrt)
- [unifreq](https://github.com/unifreq/openwrt_packit)
- [ophub](https://github.com/ophub/amlogic-s9xxx-openwrt)
- [hanwckf](https://github.com/hanwckf/immortalwrt-mt798x)
- [P3TERX](https://github.com/P3TERX/Actions-OpenWrt)
- [aparcar](https://github.com/openwrt/asu)
- [GitHub](https://github.com)
- [GitHub Actions](https://github.com/features/actions)
