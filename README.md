## Description ##
The beginigs of a control panel for byzantium. The goal is to focus solely on supporting connectivity and not any advanced system actions or configuration.

## Structure ##
* /web/ - contains the view of MVC. It is a web.py app that serves the pages and files and pokes at the M and C bits.
* /state/ - contains only the bits that set or read the system state
 * /state/control - C (control) of MVC
 * /state/model/ - M (model) of MVC aka the standardized interfaces for the View to access the Controls.
