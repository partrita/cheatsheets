#import "../templates/conf.typ": *

#show: template.with(
  title: "PyMOL Cheat Sheet",
  header: [Last updated: #datetime.today().display()],
  footer: "PyMOL Reference & Command Cheat Sheet",
)

= Modes & Loading Files
- View help: `help <keyword>`
- Load file: `load data/test/pept.pdb`
- Fetch from PDB: `fetch 1ake` (or `fetch 1ake, type=cif`)
- Launch from terminal: `pymol data/test/pept.pdb`
- Toggle text and graphics: `Esc`
- Toggle rocking on Y-axis: `rock`
- Toggle stereo view: `stereo on` / `stereo off`
- Set stereo mode: `stereo crosseye` / `walleye` / `quadbuffer`
- Undo action: `undo`
- Reset view: `reset`
- Reinitialize PyMOL state: `reinitialize`
- Quit program: `quit`

= Mouse Control
== 3-Button Viewing Controls
#bordered-table(
  columns: 5,
  [Key], [L (Left)], [M (Middle)], [R (Right)], [Wheel],
  [Default], [Rotate (Rota)], [Move], [Move Z (MovZ)], [Slab],
  [Shift], [+Box (Add sele)], [-Box (Sub sele)], [Clip], [MovS (Move slab)],
  [Ctrl], [+/- (Toggle)], [PkAt (Pick atom)], [Pk1 (Pick 1)], [--],
  [CtSh], [Sele (Box sele)], [Cent (Center)], [Menu (Context)], [--],
  [DblClk], [Menu], [Cent (Center)], [PkAt (Pick atom)], [--],
)
- Set rotation center: `origin <selection>` (e.g. `origin /pept//a`)

= Basic Commands
== Viewport & Camera Control
- Zoom to fit selection: `zoom /pept//a`
- Center selection: `center /pept//a`
- Set background color: `bg_color white` / `bg_color black`
- Set viewport size (pts): `viewport 640, 480`
- Rotate selection: `rotate <axis>, <angle>, <selection>` (e.g. `rotate y, 90, pept`)
- Translate coordinates: `translate [<x>, <y>, <z>], <selection>`

== Molecular Representations
- Hide everything: `hide all` (or `hide everything`)
- Lines representation: `show lines, /pept`
- Sticks representation: `show sticks, a//`
- Cartoon representation: `show cartoon, a//` (or `show cartoon automatic, a//`)
- Spheres (vdW) representation: `show spheres, 156/ca`
- Surface representation: `show surface, /pept`
- Mesh surface representation: `show mesh, /pept`
- Dots surface representation: `show dots, /pept`
- Ribbon representation: `show ribbon, /pept`
- Nonbonded atoms: `show nonbonded, /pept`
- Nonbonded spheres: `show nb_spheres, /pept`
- Set single representation: `as cartoon, pept` (`show` + `hide others`)

== Coloring Commands
- Change selection color: `color pink, /pept//a` (or `colour`)
- Reapply color: `recolor`
- Color by element (carbon-based): `util.cbaw`, `util.cbag`, `util.cbac`, `util.cbak`
- Color by B-factor / pLDDT: `spectrum b, rainbow_rev, minimum=50, maximum=90`
- Color by secondary structure: `color red, ss h` (helices), `color yellow, ss s` (sheets), `color green, ss l+""` (loops)

= Atom Selection Syntax
General format: `object-name/segi-id/chain-id/resi-id/name-id`

== Selection Hierarchy Examples
- Entire molecular object: `/pept`
- Molecular segment: `/pept/lig`
- Chain selection: `/pept/lig/a` or `chain a`
- Residue selection: `/pept/lig/a/10` or `resi 10`
- Atom selection: `/pept/lig/a/10/ca` or `name ca`
- Residue range: `lig/a/10-12/ca` or `resi 10-12`
- Multiple chains and residues/atoms: `a/6+8/c+o`
- Omitted fields (blank slash): `/pept//a` (all 'a' chains in pept)

== Selection Commands & Operators
- Name a selection: `select bb, name c+o+n+ca`
- Count atoms in selection: `count_atoms bb`
- Remove atoms: `remove resi 5` / `remove hydro` / `remove solvent`
- Selection keywords: `all`, `none`, `hydro`, `hetatm`, `visible`, `present`, `solvent`, `polymer`
- Invert/exclude selection: `select sidechains, ! bb`
- Distance-based selections:
  - Atoms within 3 Å vdW contact: `resi 6 around 3`
  - Atom centers within 1.0 Å: `resi 6 near 1`
  - Include atoms within 4.0 Å: `within 4 of resi 6`
  - Select complete residues nearby: `byres (ligand around 5.0)`
  - Expand selection: `expand 4, resi 6`

= Cartoon Settings
== Cartoon Style Customization
- Cylindrical helices: `set cartoon_cylindrical_helices, 1`
- Fancy edge helices: `set cartoon_fancy_helices, 1`
- Flat sheets: `set cartoon_flat_sheets, 1`
- Smooth loops: `set cartoon_smooth_loops, 1`
- Ring finder mode: `set cartoon_ring_finder, [1,2,3,4]`
- Ring render mode: `set cartoon_ring_mode, [1,2,3]`
- Nucleic acid mode: `set nucleic_acid_mode, [0,1,2,3,4]`
- Sidechain helper: `set cartoon_side_chain_helper, 1; rebuild`
- Primary cartoon color: `set cartoon_color, blue`
- Highlight cartoon color: `set cartoon_highlight_color, grey`
- Discrete secondary structure colors: `set cartoon_discrete_colors, on`
- Cartoon transparency: `set cartoon_transparency, 0.5`

== Cartoon View Styles
- Loop mode: `show cartoon loop, a//`
- Rectangular mode: `show cartoon rect, a//`
- Oval mode: `show cartoon oval, a//`
- Tube mode: `show cartoon tube, a//`
- Arrow mode (sheets): `show cartoon arrow, a//`
- Dumbbell mode: `show cartoon dumbbell, a//`

= Hydrogen Bonding & Labels
== Distance & Geometry Measurement
- Measure distance between atoms: `distance dist01, 542/oe1, 538/ne`
- Angle measurement: `angle ang01, 542/oe1, 542/cd, 542/cg`
- Dihedral measurement: `dihedral dih01, 1/n, 1/ca, 1/c, 2/n`
- Dash gap: `set dash_gap, 0.09`
- Dash width: `set dash_width, 3.0`
- Dash radius: `set dash_radius, 0.0`
- Dash length: `set dash_length, 0.15`
- Dash round ends: `set dash_round_ends, on`
- Hide measurement labels: `hide labels, dist01`

== Text Labels
- Label specific residue/atom: `label (542/oe1), "%s" % ("E542")`
- Label 3-letter code + number: `label name ca, "%s%s" % (resn, resi)`
- Set label font ID: `set label_font_id, 4`
- Set label font size: `set label_size, 14`
- Set label color: `set label_color, white`
- Set label outline color: `set label_outline_color, black`

= Electrostatics & Surfaces
- Generate electrostatic surface (GUI): `Action > generate > vacuum electrostatics > protein contact potential`
- APBS plugin: `Plugin > APBS Electrostatics`
- Surface transparency: `set transparency, 0.5`
- Surface color: `set surface_color, white, pept`
- Cavity surface mode: `set surface_cavity_mode, 1`

= Image Output & Rendering
- Low resolution ray trace: `ray`
- High resolution ray trace: `ray 2000, 2000`
- Ultra-high resolution ray trace: `ray 5000, 5000`
- Viewport size (pts): `viewport 640, 480`
- Shadow control: `set ray_shadow, 0`
- Fog control: `set ray_trace_fog, 0`
- Depth cue control: `set depth_cue, 0`
- Antialiasing control: `set antialias, 1`
- Transparent background: `set ray_opaque_background, off`
- Export PNG file: `png image.png, dpi=300`

= PyMOL Movies & Animation
== Playback & Timeline Controls
- Play movie: `mplay`
- Stop movie: `mstop`
- Rewind to beginning: `rewind`
- Go to middle frame: `middle`
- Go to end frame: `ending`
- Move forward 1 frame: `forward`
- Move backward 1 frame: `backwards`
- Go to specific frame: `frame <number>`
- Get current frame number: `get_frame`
- Clear movie cache: `mclear`
- Reset frame rate meter: `meter_reset`
- Dump movie command state: `mdump`

== Camera Motion & Scripted Frames
- Camera plane translation: `move x, 10`
- Camera rotation: `turn x, 90` / `turn y, 90`
- Execute command on frame: `mdo 1, turn x, 5; turn y, 5;`
- Batch export frame PNGs: `mpng <prefix> [, first [, last]]`

= Alignment & Sessions
- Sequence-based structure alignment: `align mobile, target`
- Sequence-independent 3D superposition: `super mobile, target`
- Combinatorial extension alignment: `cealign target, mobile`
- Fit atom pairs: `pair_fit sele1, sele2`
- Save session file: `save session.pse`
- Export PDB structure: `save molecule.pdb, <selection>`
- Run PyMOL script: `@script.pml` or `run script.py`
