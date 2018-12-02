:Namespace H1∆Car

 cir ← {img←⍵ ⋄ img⊣{yx r rgb←⍵ ⋄ img∘←rgb⊣@((⊂yx)+i⌿⍨r≥0.5*⍨+⌿¨×⍨r-i←,⍳0⌈(1+2×r r)⌊yx-⍨1↓⍴img)⍤¯1⊢img ⋄ 0}⍤1⊢⍺}
 rec ← {img←⍵ ⋄ img⊣{yx hw rgb←⍵ ⋄ img∘←rgb⊣@((⊂yx)+⍳0⌈hw⌊yx-⍨1↓⍴img)⍤¯1⊢img ⋄ 0}⍤1⊢⍺}                          

 body←2 3⍴(30 0)(50 200)(255 0 0)(0 50)(30 100)(255 0 0)
 wheels←2 3⍴(50 25)25(0 0 0)(50 125)25(0 0 0)

 car←{img←⍵ ⋄ ⍺←0 0 ⋄ y x←⍺ ⋄ my mx←0⌈105 200⌊⍺-⍨1↓⍴img ⋄ img[;i;j]←wheels cir body rec img[;i←y+⍳my;j←x+⍳mx] ⋄ img}

 img←3 300 500⍴255
 img[0 1;250+⍳10;]←0

 img←(200 337)(15)(0 255 0)cir(225 350)(25 5)(150 75 0)rec img
 
 step←{_←⍺ #.gfx.∆.Image 2 0 1⍉150 ⍵ car img ⋄ _←⎕DL ⍵⍵ ⋄ ⍵+⍺⍺}

 run←{⍺←0 ⋄ ⍵ step ⍺ #.gfx.∆.Display {⍺=490} 0}

:EndNamespace