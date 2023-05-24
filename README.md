# APOLLO 7.0  CMAKE for CyberRT

## 简介
    为了将CyberRT单独作为一个项目编译， 使用CMake对其进行重构

## 步骤
    1. 将cmake/文件夹移动至 $APOLLO_ROOT_DIR 下
    2. 打unit_test补丁，其中对部分测试用例main函数调整，将若干用例合并到一个工程，具体可参考CMakeLists文件，用例未做修改
    3. 如果使用fastrtps1.5 需要解决字符串截断这个bug，官方Apollo docker installer路径下有FastRTPS_1.5.0.patch； 
    需要在FastRTPS1.5.0源码路径下执行下述指令修复BUg 
   ```
    patch -p1 < FastRTPS_1.5.0.patch
   ```
    4. （可选，建议直接用fastrtps1.5.0）如果使用1.9.0以上的版本, 因为FastRtps API有略微调整，本工程不太兼容，可使用我做
    的补丁修复本工程，在apollo下执行下述命令
    ```
    source ./cmake/scripts/patch_for_fastrtps-1_9_0.bash 
    ```

    5. 编译
    ```
    mkdir -p cmake/build
    cd cmake/build
    cmake -DBUILD_TEST=ON ..
    make -j4
    ../scripts/unittest.bash ./ > ../scripts/test.report
    ```

    6. 安装
    目前，scheduler 单元测试虽然通过，但是却与期望不符，具体可见测试报告，解决此BUG后，再编写 cmake install 单元， 通过 
    make install 将cyber安装至系统，后续使用将于ros2 一样简单。

## TODO

    参见，scheduler_classic_test.report 协程执行简单的延时明显超过了延时时间，不知道哪里出问题，怀疑时条件变量唤醒丢失造成。
