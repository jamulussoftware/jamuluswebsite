
[comment]: # (This is an include file for use in multiple documents)

# Quality of Service (QoS)

Jamulus uses DSCP/CS4 opportunistically to deal with buffer bloat, and uses a default DSCP/CS4 value of 128 (or 0x80). This is compatible with IPv4 and IPv6. Other values can be set using the -Q option, eg -Q [0..255] (where 0 disables QoS). If you want to explore the effect of non-default settings, see RFC4594. However, most people will have no need to do this.

## Use of QoS on Windows

Jamulus's QoS settings (including the default) have no effect on Windows because the operating system ignores them. To enable it, you must follow these instructions. Note also that you may need to repeat this procedure every time Jamulus is updated.

In Search box beside Start menu Type: Local Group Policy Editor (enter)<br> In new window, (click) on the menu icon to display the Actions third panel<br> Looking at the first panel of the Local Group Policy Editor<br> &nbsp;Local Computer Policy<br> &nbsp;&nbsp;Computer Configuration<br> &nbsp;&nbsp;&nbsp;Windows Settings<br> &nbsp;&nbsp;&nbsp;&nbsp;Policy-based QoS (click)<br> Looking at the third panel (Actions) of the Local Group Policy Editor<br> &nbsp;Policy-based QoS<br> &nbsp;&nbsp;More Actions<br> &nbsp;&nbsp;&nbsp;Create new Policy (click)<br> &nbsp;&nbsp;&nbsp;&nbsp;Policy Name: Jamulus<br> &nbsp;&nbsp;&nbsp;&nbsp;Specify DSCP value: 32<br> &nbsp;&nbsp;&nbsp;&nbsp;Next<br> &nbsp;&nbsp;&nbsp;&nbsp;This QoS policy applies Only to applications with name Jamulus.exe<br> &nbsp;&nbsp;&nbsp;&nbsp;Next<br> &nbsp;&nbsp;&nbsp;&nbsp;Next<br> &nbsp;&nbsp;&nbsp;&nbsp;UDP<br> &nbsp;&nbsp;&nbsp;&nbsp;Finish<br>

(Notice Jamulus policy in center panel may be edited)

