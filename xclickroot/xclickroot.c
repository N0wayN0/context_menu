#include <err.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <X11/Xlib.h>


int main(int argc, char *argv[])
{
    char *btn1[] = {NULL,NULL,NULL};
    char *btn2[] = {NULL,NULL,NULL};
    char *btn3[] = {"xmenu.sh",NULL,NULL};
    
    char **selectedCMD; // = nullptr;
	struct sigaction sa;
	unsigned button;
	XEvent ev;
	Display *dpy;
	Window rootwin;

	/* don't leave zombies around */
	sa.sa_handler = SIG_IGN;
	sa.sa_flags = SA_NOCLDSTOP | SA_NOCLDWAIT | SA_RESTART;
	if (sigemptyset(&sa.sa_mask) == -1)
		err(EXIT_FAILURE, "sigemptyset");
	if (sigaction(SIGCHLD, &sa, NULL) == -1)
		err(EXIT_FAILURE, "sigaction");

	/* open connection to server and set X variables */
	if ((dpy = XOpenDisplay(NULL)) == NULL)
		errx(EXIT_FAILURE, "cannot open display");


	rootwin = DefaultRootWindow(dpy);
	XGrabButton(dpy, AnyButton, AnyModifier, rootwin, False, ButtonPressMask,
	            GrabModeSync, GrabModeSync, None, None);
	while (!XWindowEvent(dpy, rootwin, ButtonPressMask, &ev)) {
		if (ev.type == ButtonPress) {
		    fprintf(stderr, "ev type: ButtonPress\n" );
		    fprintf(stderr, "Button is: %u\n", ev.xbutton.button);
            switch (ev.xbutton.button) {
                case Button1:  selectedCMD = btn1; break;
                case Button2:  selectedCMD = btn2; break;
                case Button3:  selectedCMD = btn3; break;
                case Button4:  selectedCMD = btn3; break;
                case Button5:  selectedCMD = btn3; break;
                case 8:  selectedCMD = btn3;; break;
                case 9:  selectedCMD = btn3;; break;
            }
		        fprintf(stderr, "CMD for Button is: %s\n",selectedCMD[0]);
			
            if (ev.xbutton.subwindow != None) {
				XAllowEvents(dpy, ReplayPointer, CurrentTime);
				continue;
			}
			XUngrabPointer(dpy, ev.xbutton.time);
			XAllowEvents(dpy, ReplayPointer, CurrentTime);
			XFlush(dpy);
			switch (fork()) {
			case -1:
				warn("can't fork");
				break;
			case 0:
				execvp(*selectedCMD, selectedCMD);
		        fprintf(stderr, "cmd: %s\n", *selectedCMD);
				warn("can't exec %s", *selectedCMD);
				_exit(127);
			}
		}
	}
	XCloseDisplay(dpy);
	return 0;
}
