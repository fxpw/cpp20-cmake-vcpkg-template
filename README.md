> ```sudo apt-get update && sudo apt-get install -y cmake```
> ```sudo apt-get install gdb```
> ```sudo apt-get install pkg-config```
> ```sudo apt install linux-libc-dev```


>```install vspkg in /usr/local/vcpkg```

>```sudo mkdir -p /usr/local/vcpkg```

>```sudo git clone https://github.com/microsoft/vcpkg.git /usr/local/vcpkg```

>```cd /usr/local/vcpkg```

>```sudo ./bootstrap-vcpkg.sh```

>```export PATH="$PATH:/usr/local/vcpkg"```

>```source ~/.bashrc```

>```source ~/.zshrc```
>```/usr/local/vcpkg/vcpkg integrate install```
>```-DCMAKE_TOOLCHAIN_FILE=/usr/local/vcpkg/scripts/buildsystems/vcpkg.cmake```
> ```sudo chown -R $USER:$USER /usr/local/vcpkg```


> ```make v_install```