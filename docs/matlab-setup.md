## Setting up MATLAB for ROS2

### 1. Install MATLAB R2023a

### 2. Install Python 3.9

### 3. Install Visual Studio C++ 2022

### 4. Install CMake >3.15

### 5. Open Command Prompt **as administrator** and run this command:

```
mklink /D "C:\Program Files\MATLAB\R2023a\bin\win64\cmake" "C:\Program Files\CMake"
```

### 6. Delete `C:\Users\[user]\source` if it exists

### 7. In MATLAB, run `pyenv(Version="3.9")`

### 8. Run `matlab\generateMsgs.m`

### 9. Right click `matlab\share` > Add to Path > Selected Folders

### 10. Ready to run boom.