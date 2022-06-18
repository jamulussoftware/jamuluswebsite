
[comment]: # (This is an include file for use in multiple documents)

# Quality of Service (QoS)

Jamulus uses the DSCP/CS4 quality of service to mitigate network jitter delays. Setting the DS field byte to 128 (or 0x80) in an IPv4 or IPv6 packet header selects DSCP/CS4. Other byte values can be set using the -Q option, e.g. -Q [0..255]. If you want to explore the effect of non-default settings, see [RFC4594](https://datatracker.ietf.org/doc/html/rfc4594) page 18. However, most people will have no need to do this.

## Use of QoS on Windows

Jamulus' QoS settings (including the default) are set to 0 on recent Windows and macOS because of the operating system. To use QoS on Windows, follow these instructions. Note that you may need to repeat this procedure every time Jamulus is updated.

In Search box beside Start menu, Type: Local Group Policy Editor (enter)<br>
In new window, (click) on the menu icon to display the Actions third panel<br>
Looking at the first panel of the Local Group Policy Editor<br>
&nbsp;Local Computer Policy<br>
&nbsp;&nbsp;Computer Configuration<br>
&nbsp;&nbsp;&nbsp;Windows Settings<br>
&nbsp;&nbsp;&nbsp;&nbsp;Policy-based QoS (click)<br>
Looking at the third panel (Actions) of the Local Group Policy Editor<br>
&nbsp;Policy-based QoS<br>
&nbsp;&nbsp;More Actions<br>
&nbsp;&nbsp;&nbsp;Create new Policy (click)<br>
&nbsp;&nbsp;&nbsp;&nbsp;Policy Name: Jamulus<br>
&nbsp;&nbsp;&nbsp;&nbsp;Specify DSCP value: 32<br>
&nbsp;&nbsp;&nbsp;&nbsp;Next<br>
&nbsp;&nbsp;&nbsp;&nbsp;This QoS policy applies Only to applications with name Jamulus.exe<br>
&nbsp;&nbsp;&nbsp;&nbsp;Next<br>
&nbsp;&nbsp;&nbsp;&nbsp;Next<br>
&nbsp;&nbsp;&nbsp;&nbsp;UDP<br>
&nbsp;&nbsp;&nbsp;&nbsp;Finish<br>

(Notice Jamulus policy in center panel may be edited)

