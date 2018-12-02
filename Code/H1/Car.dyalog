:Namespace H1∆Car

 cir ← {img←⍵ ⋄ img⊣{yx r rgb←⍵ ⋄ img∘←rgb⊣@((⊂yx)+i⌿⍨r≥0.5*⍨+⌿¨×⍨r-i←,⍳(1+2×r r)⌊yx-⍨1↓⍴img)⍤¯1⊢img ⋄ 0}⍤1⊢⍺}
 rec ← {img←⍵ ⋄ img⊣{yx hw rgb←⍵ ⋄ img∘←rgb⊣@((⊂yx)+⍳hw⌊yx-⍨1↓⍴img)⍤¯1⊢img ⋄ 0}⍤1⊢⍺}                          

 body←2 3⍴(30 0)(50 200)(255 0 0)(0 50)(30 100)(255 0 0)
 wheels←2 3⍴(50 25)25(0 0 0)(50 125)25(0 0 0)

 car←{img←⍵ ⋄ ⍺←0 0 ⋄ y x←⍺ ⋄ my mx←105 200⌊⍺-⍨1↓⍴img ⋄ img[;i;j]←wheels cir body rec img[;i←y+⍳my;j←x+⍳mx] ⋄ img}

 img←3 300 500⍴255
 img[0 2;250+⍳10;]←0
 
 step←{_←⍺ #.gfx.∆.Image 2 0 1⍉150 ⍵ car img ⋄ _←⎕DL ⍵⍵ ⋄ ⍵+⍺⍺}

 run←{⍵ step ⍺ #.gfx.∆.Display {⍺=490} 0}

:EndNamespace