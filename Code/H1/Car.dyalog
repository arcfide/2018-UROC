:Namespace H1∆Car

   circle ← {r←⍵⍵ ⋄ m←⍺⍺ ⋄ 0@{r≥0.5*⍨+⌿¨2*⍨(⊂m)-⍨⍳⍴⍵}⍵}
     dist ← {0.5*⍨+⌿¨2*⍨⍵-⍺}

rec←{xy hw rgb←⍵ ⋄ (⍉rgb)((×/hw)⌿⊣)@(⊃,/,¨(⊂¨↓xy)+⍳¨↓hw)⍤¯1⊢⍺} 

 car←{                             
     z←(⍺+0 120)rectangle 200 150⊢⍵
     z←(⍺+200 0)rectangle 100 400⊢z
     z←(⍺+300 100)circle 50⊢z      
     z←(⍺+300 300)circle 50⊢z      
     z                             
 }                                 

:EndNamespace