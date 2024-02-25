# xclickroot

This is source

Inspired by
[xclickroot](https://github.com/phillbush/xclickroot)

## Original vesion

xclickroot runs a command every time a given mouse button is pressed on
the root window.

## Running xclickroot

xclickroot gets as argument an command and its arguments and run this
command every time the right mouse button is pressed on the root window.

One of the options -l, -m, -r, -1, -2, -3, -4, or -5 which indicate mouse button

	xclickroot -l xterm &

# My Upgrade

    I removed command option for specify button which trigger choosen program
    and restrict to only one button and only one program

In source code will be specify wchich mouse button do what:

```
int main(int argc, char *argv[])
{
    char *btn1[] = {"pcmanfm",NULL,NULL};
    char *btn2[] = {"xmenu2.sh",NULL,NULL};
    char *btn3[] = {"xmenu.sh",NULL,NULL};
```

buttons can be figured out using

`xev`

## Installation
	
    make clean install

Then run it in background or in .xinitrc

`xclickroot &`

