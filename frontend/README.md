CHERI-WAMR Front-End App: wamr-app
==================================

This folder is wamr-app, a front-end C++ application which uses the WAMR runtime through the WAMR vmlib.
It then calls into WAMR via its SDK.

To build, set WAMR_FRONTEND=1 in build options and run CMake on the CMakeLists.txt in the root folder.
