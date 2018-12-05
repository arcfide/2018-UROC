:Namespace S1

 ∆←#.gfx.∆
 Img←∆.Image

 rgb←(255 128 128)(128 255 128)(0 0 255)(0 255 0)(255 0 0)

 cir←{img←⍵
  _←{yx r rgb←⍵
   img∘←rgb⊣@((⊂yx)+i⌿⍨r≥0.5*⍨+⌿¨×⍨r-i←,⍳0⌈(1+2×r r)⌊yx-⍨1↓⍴img)⍤¯1⊢img
   0}⍤1⊢⍺
  img}

 atan2←{y←⍺ ⋄ x←⍵
  x>0:¯3○y÷x
  (x<0)∧y≥0:(¯3○y÷x)+○1
  (x<0)∧y<0:(¯3○y+x)-○1
  (x=0)∧y>0:○.5
  (x=0)∧y<0:-○.5
  ⎕SIGNAL 11}
  

 step←{h w r s←⍺⍺ ⋄ age pos dir typ←⍵                        ⍝ State
  age+←1                                                     ⍝ We age once per step
  (m⌿dir)←(○¯1)+2×○?0⍴⍨+/m←(typ>0)∧0=25|age                  ⍝ Change Directions
  age pos dir typ⍪←z(m⌿pos)(z←0⍴⍨+⌿m)(-typ⌿⍨m)               ⍝ Clone Sprites
  (m⌿dir)←atan2/(0⌷pos)-⍤1⊢(m←typ<0)⌿pos                     ⍝ Chase Player
  pos←h w|⍤1⌊0.5+pos+s×⍉1 2∘.○dir                            ⍝ Move Sprites
  age pos dir typ(⌿⍨)←⊂(typ≥0)∨(2×r)≤.5*⍨+/×⍨(0⌷pos)-⍤1⊢pos  ⍝ Delete Eaten Sprites
  age pos dir typ(⌿⍨)←⊂(typ≥0)∨age<60                        ⍝ Delete old Sprites
  cs←(↓pos),r,⍪rgb[2+typ]                                    ⍝ Circles to Render
  _←⍺ Img 2 0 1⍉cs cir 3 h w⍴255                             ⍝ Draw State
  age pos dir typ}

 ws←1024 1024 75 15
 time←150
 initial←(3⍴0)(↑(0 0)(1023 0)(0 1023))(○¯45 45 ¯135)(0 1 2)

 run←{ws step ∆.Display{time≤⊃⊃⍺}initial}

:EndNamespace