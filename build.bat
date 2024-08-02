@ECHO OFF

echo === Cloning vcpkg repo ...

git clone --depth 1 https://github.com/microsoft/vcpkg

echo === Bootstrapping vcpkg ...

pushd vcpkg
call bootstrap-vcpkg.bat

echo === Applying triplet ...

xcopy /Y ..\x64-windows-recorder.cmake triplets
xcopy /Y ..\arm64-windows-recorder.cmake triplets

echo === Building ffmpeg ...

vcpkg install openssl:x64-windows-recorder
vcpkg install openssl:arm64-windows-recorder

echo === Copying to output folder ...

popd

xcopy /Y /E vcpkg\packages\openssl_x64-windows-recorder\bin\*.dll output\recorder\x86_64\openssl\bin\
xcopy /Y /E vcpkg\packages\openssl_x64-windows-recorder\include output\recorder\x86_64\openssl\include\
xcopy /Y /E vcpkg\packages\openssl_x64-windows-recorder\lib output\recorder\x86_64\openssl\lib\
xcopy /Y /E vcpkg\packages\openssl_x64-windows-recorder\share output\recorder\x86_64\openssl\share\

xcopy /Y /E vcpkg\packages\openssl_x64-windows-recorder\bin\*.pdb output\recorder\x86_64\openssl_pdb\

xcopy /Y /E vcpkg\packages\openssl_arm64-windows-recorder\bin\*.dll output\recorder\arm64\openssl\bin\
xcopy /Y /E vcpkg\packages\openssl_arm64-windows-recorder\include output\recorder\arm64\openssl\include\
xcopy /Y /E vcpkg\packages\openssl_arm64-windows-recorder\lib output\recorder\arm64\openssl\lib\
xcopy /Y /E vcpkg\packages\openssl_arm64-windows-recorder\share output\recorder\arm64\openssl\share\

xcopy /Y /E vcpkg\packages\openssl_arm64-windows-recorder\bin\*.pdb output\recorder\arm64\openssl_pdb\