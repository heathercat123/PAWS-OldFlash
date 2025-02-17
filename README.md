# PAWS-OldFlash
 Port of Super Cat Tales: PAWS to older versions of Adobe Flash based on the decomp. Requires a minimum of Adobe Flash 11.

## Building

#### Prerequisites

You will need the following software to be installed:

- [Visual Studio Code](https://code.visualstudio.com/). You can use other IDEs or even compile it from the command line, but these instructions are for VS Code.
- [The ActionScript and MXML extension for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=bowlerhatllc.vscode-as3mxml). Once again, you can use other extensions or compile it from the command line, but these instructions are for the ActionScript and MXML extension.
- [The Adobe Air SDK](https://airsdk.harman.com/).

#### Compiling
NOTE: These instrucions are made for VSCode ONLY. To compile from the command line, [install asconfigc](https://github.com/BowlerHatLLC/asconfigc?tab=readme-ov-file#installation) refer to [this](https://github.com/BowlerHatLLC/asconfigc?tab=readme-ov-file#command-line-usage).

1. Set the AIR_HOME environment variable to the path of your AIR sdk.
1. Open the directory of the port in Visual Studio.
1. Go to the **Terminal** menu and select **Run Build Task...**. Alternatively, use the Ctrl+Shift+B keyboard shortcut (or Command+Shift+B on macOS).
1. Select one of the options and let it compile! If it complains about a certificate, open up the asconfig.json file in a text editor. You'll find how to fix it in there.