# Path Edit Panel

This addon adds input controls to the Inspector > Transform panel for 3D paths. This allows for precise changes to curve points.

# How to use

1. Select your path object
2. Go to the inspector panel, and expand Transform
3. Choose the point you want to modify (indicator in 3D view coming eventually)
4. Select whether to modify the position, in, or out handler.
5. Use the x, y, z line edit fields to tweak values.

![UI screenshot](/ui_visual.png?raw=true)


# Known issues

- If the curve object scale is not 1x1x1 or rotated, you're going to have a bad time.
- Undo/redo not properly yet supported.
- Only supports 3D curves for the moment.
- The added subpanel messes with the width of the Inspector (minor).
