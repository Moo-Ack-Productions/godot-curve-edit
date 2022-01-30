# Curve Edit Panel

This addon adds input controls to the Inspector > Transform panel for 3D paths. This allows for precise changes to curve points.

Made for the [2022 Addon Jam](https://itch.io/jam/godot-addons-jam-1) by someone who has never made an addon for Godot before. I did my darn bestest here.

# How to install

Copy the `addons/curve_edit` folder into your own project addons folder. Then enable in the project settings, plugins tab.

# How to use

1. Select your path object
2. Go to the inspector panel, and expand Transform
3. Choose the point you want to modify (indicator in 3D view coming eventually). Alternatively, you can directly modify the point you want to tweak in the 3D view. This will automatically make it "active" in the transform panel.
4. Select whether to modify the position, in, or out handler.
5. Use the x, y, z line edit fields to tweak values. Press enter or click out, see your wonderously, *precisely* edited path appear in the 3D view.

# UI added and demo

This is the addes panel:
![UI screenshot](/ui_visual.png?raw=true)

You can see what it looks liek working with this panel. After the curve has been manipulated in the 3D view, the most recently modified point automatically becomes active (and set to position, in, or out accordingly). This makes it easy to jump to the correct point, but you can also select the point to modify from the dropdown.

![UI demo](/ui_demo.gif?raw=true)

# Known issues

- Undo/redo not properly yet supported.
- Only supports 3D curves for the moment, not 2D.
- The added subpanel messes with the width of the Inspector (minor).
