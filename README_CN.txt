OUT OF SPEC RPG — Stage 5.3.21 双手独立第一人称手部

Mod 版本：0.6.30
运行标记：OUT_OF_SPEC_STAGE_5_3_21.0.6.30
目标环境：Minecraft 1.20.1 Forge、Java 17、Gradle 8.14.5

本版本将第一人称手臂与结印手势改为 OUT OF SPEC 自己渲染。Punchy 不再打包、不再注册为模组、不在编译路径中，也没有任何运行中的 Mixin 再去修改 Punchy。旧的 Punchy 手臂挂接、整臂旋转隔离与 JAR 嵌入代码已移除。

手部渲染接管 Minecraft 的 ItemInHandRenderer.renderPlayerArm 调用，因此自定义手部能够使用当前原版持物/使用动作的 PoseStack；Minecraft 仍然负责渲染物品模型。这样自定义手部不再继承第三方手臂渲染器的跑动/持物旋转矩阵。

骨骼结构：独立第一人称手臂 → seal_hand → hand_basis（180 度解剖基准）→ wrist_joint → palm → thumb / 四根三段式手指。180 度角只属于自定义手部模型，不是对其他模组动画的补偿。只有结印状态会把双手向屏幕中心靠拢并抬起；普通状态不使用结印位移。

保留十二地支独立姿势库、原结印输入状态机、法术施放、追加印、束缚契约、成长系统和 SAO Menu。Epic Fight 仍然不是必需依赖；未来需要针对具体 EF 版本实现独立桥接，本版本尚未实现 EF 适配。

工程根目录使用 JDK 17 和 Gradle 8.14.5 执行 gradle clean build。双手完整性由 renderHandsWithItems 帧结束补全；结印时左右手统一在同一相机坐标系绘制。
最终整合 JAR：build/libs/OUT_OF_SPEC_RPG_IronSpell_SAO_Stage5_3_21_BilateralStandaloneFirstPersonHands.jar。

tests/run_judge_tests.sh 运行纯 Java 模型测试与源码/打包审计。自动化检查通过不等于完整 ForgeGradle 编译成功，也不等于 Minecraft 实机视觉验收完成。必须实测空手、持物、跑动和居中结印。
