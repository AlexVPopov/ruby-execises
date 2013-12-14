require_relative '../Bitmap/bitmap'

describe "Bitmap" do
  it "renders bytes" do
    expect(Bitmap.new([9, 32, 7]).render).to eq <<-ASCII.strip
....#..#..#..........###
    ASCII
  end

  it "makes multiple rows, if said to" do
    expect(Bitmap.new([9, 32, 7, 1], 2).render).to eq <<-ASCII.strip
....#..#..#.....
.....###.......#
    ASCII
  end

  it "can render a column" do
    expect(Bitmap.new([9, 32, 7, 1], 1).render).to eq <<-ASCII.strip
....#..#
..#.....
.....###
.......#
    ASCII
  end

  it "supports different palettes" do
    expect(Bitmap.new([13, 2, 5, 1], 2).render(%w(. * x #))).to eq <<-ASCII.strip
..#*...x
..**...*
    ASCII
  end

  it "renders La Gioconda" do
    expectation = <<-ASCII.chop
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!>''''''<!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!'''''`             ``'!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!!!!''`          .....         `'!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!!!'`      .      ;;;;;'            `'!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!!!'     .   '     .;;;;'                `!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!!'      ;          `````                   `!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!!        .,ccdcccccc,,.                       `!!!!!!!!!!!!
!!!!!!!!!!!!!!!     .-"?$$$$$$$$$$$$$$c,                      `!!!!!!!!!!!
!!!!!!!!!!!!!!    ,ccc$$$$$$$$$$$$$$$$$$$,                     `!!!!!!!!!!
!!!!!!!!!!!!!    d$$$$$$$$$$$$$$$$$$$$$$$$;.                    `!!!!!!!!!
!!!!!!!!!!!!    <$$$$$$$$$$$$$$$$$$$$$$$$$$;.                    `!!!!!!!!
!!!!!!!!!!!     $$$$$$$$$$$$$$$$$$$$$$$$$$$d;;.                   !!!!!!!!
!!!!!!!!!!'     $$$$$$$$$$$$$$$$$$$$$$$$$$$$$d;.                   !!!!!!!
!!!!!!!!!'     <$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                   !!!!!!!
!!!!!!!!'      `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                   `!!!!!!
!!!!!!!!        c$$$$???$$$$$$$d""  """??????"                      !!!!!!
!!!!!!!         `"" .,.. "$$$$$    .,dcd                            !!!!!!
!!!!!!!         .  d!    .?$$$   .,cc,      .,d$d.                  !!!!!!
!!!!!!!!        <. $$c- <$d$$$   <$$$$---$"$$$$$$$                  !!!!!!
!!!!!!!         d$$$dcccd$$$$$   d$$$dcccd$$$$$$$$                  `!!!!!
!!!!!!         ,$$$$$$$$$$$$$$d d$$$$$$$$$$$$$$$$                   `!!!!!
!!!!!          `$$$$$$$$$$$$$$$<$$$$$$$$$$$$$$$$'                    !!!!!
!!!!!          `$$$$$$$$$$$$$$$$"$$$$$$$$$$$$$d>                     !!!!!
!!!!!           ?$$$$$$$$$$$$??$c`$$$$$$$$$$$?>'                     `!!!!
!!!!!           `?$$$$$$!>?""    ,$$$$$$$$$?>>'                       !!!!
!!!!!.           <<?$$$$$$c.    ,d$$?$$$$$$>>''                       `!!!
!!!!!!            <!?$d"??$$d--"?""  ,$$$$d;>''                       `!!!
!!!!!!             $$$dccccccccc- cc$$$$$$$>>'                         !!!
!!!!!              `?$$$$$$$""""  `"$$$$$>>>''                         `!!
!!!!!                "?$$$$$cccccc$$$$??>>>>'                           !!
!!!!>                  "$$$$$$$$$$$$$$>>>>''                            `!
!!!!!                    "$$$$$$$$???>'''                                !
!!!!!>                     `"""""                                        `
!!!!!!;                       .                                          `
!!!!!!!                       ?d.                                         
!!!!!!!!                       $$c,                                       
!!!!!!!!>                      ?$$$d.              .,c                    
!!!!!!!!!                       $$$$$$$$$dc,.,,cc$$$$$                    
!!!!!!!!!                  .,dcc$$$$$$$$$$$$$$$$$$$$$$                    
!!!!!!!!!               .d$$$$$$$$$$$$$$$$$$$$$$$$$$$$                    
!!!!!!!!!             ,d$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$          .         
!!!!!!!!!           ,d$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$         !!         
!!!!!!!!!         ,d$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$        ,!'         
!!!!!!!!>        c$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.       !'          
!!!!!!''       ,d$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$>       '           
!!!''         d$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$>                   
!'           ,$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$>             ..    
            d$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'           ;!!!!''`
            $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$       ,;;!'`'  .'' 
           <$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$>    ,;'`'  ,;       
           `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   -'   ,;!!'        
            "?$$$$$$$$$$?$$$$$$$$$$$$$$$$$$$$$$$$$$$     .<!!!'''       <!
         !>    ""??$$$?<?$$$$$$$$$$$$$$$$$$$$$$$$""     ;!'''          !!!
       ;!!!!;,      `"''""????$$$$$$$$$$$$$$$$""   ,;-''               ',!
      ;!!!!<!!!; .                `"""""""""""    `'                  ' ' 
      !!!! ;!!! ;!!!!>;,;, ..                  ' .                   '  ' 
     !!' ,;!!! ;'`!!!!!!!!;!!!!!;  .        >' .''                 ;      
    !!' ;!!'!';! !! !!!!!!!!!!!!!  '         -'                           
   <!!  !! `!;! `!' !!!!!!!!!!<!       .                                  
   `!  ;!  ;!!! <' <!!!! `!!! <       !                                   
  `;   !>  <!! ;'  !!!!'  !!';!     ;'                                    
   !   !   !!! !   `!!!  ;!! !      '  '                                  
  ;   `!  `!! ,'    !'   ;!'                                              
      '   !`! !    <     !! <      '                                      
           ! ;!        >;! ;>                                             
             !'       ; !! '                                              
          ' ;!        > ! '                                               
            '                                                             
ASCII
    the_bitmap = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 35, 51, 51, 52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51, 51, 53, 102, 102, 102, 102, 102, 102, 101, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 51, 86, 102, 102, 102, 102, 103, 119, 119, 102, 102, 102, 102, 101, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 86, 102, 102, 103, 102, 102, 102, 136, 136, 131, 102, 102, 102, 102, 102, 102, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 102, 102, 103, 102, 99, 102, 102, 103, 136, 136, 54, 102, 102, 102, 102, 102, 102, 102, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 102, 102, 102, 134, 102, 102, 102, 102, 101, 85, 85, 102, 102, 102, 102, 102, 102, 102, 102, 102, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 102, 102, 102, 121, 170, 186, 170, 170, 169, 151, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 102, 102, 124, 222, 255, 255, 255, 255, 255, 255, 255, 169, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 102, 154, 170, 255, 255, 255, 255, 255, 255, 255, 255, 255, 249, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 102, 107, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 135, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 102, 102, 79, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 248, 118, 102, 102, 102, 102, 102, 102, 102, 102, 102, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 102, 102, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 251, 136, 118, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54, 102, 102, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 251, 135, 102, 102, 102, 102, 102, 102, 102, 102, 102, 96, 0, 0, 0, 0, 0, 0, 0, 3, 102, 102, 100, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 102, 102, 102, 102, 102, 102, 102, 102, 102, 96, 0, 0, 0, 0, 0, 0, 0, 54, 102, 102, 101, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 102, 102, 102, 102, 102, 102, 102, 102, 102, 101, 0, 0, 0, 0, 0, 0, 0, 102, 102, 102, 102, 175, 255, 254, 238, 255, 255, 255, 251, 221, 102, 221, 222, 238, 238, 237, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 0, 0, 6, 102, 102, 102, 102, 93, 214, 121, 119, 109, 255, 255, 246, 102, 103, 155, 171, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 0, 0, 6, 102, 102, 102, 102, 118, 107, 6, 102, 103, 239, 255, 102, 103, 154, 169, 102, 102, 102, 121, 191, 183, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 0, 0, 0, 102, 102, 102, 102, 71, 111, 250, 198, 79, 191, 255, 102, 100, 255, 255, 204, 207, 223, 255, 255, 255, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 0, 0, 6, 102, 102, 102, 102, 191, 255, 186, 170, 191, 255, 255, 102, 107, 255, 251, 170, 171, 255, 255, 255, 255, 102, 102, 102, 102, 102, 102, 102, 102, 102, 80, 0, 0, 0, 0, 0, 102, 102, 102, 102, 105, 255, 255, 255, 255, 255, 255, 255, 182, 191, 255, 255, 255, 255, 255, 255, 255, 246, 102, 102, 102, 102, 102, 102, 102, 102, 102, 80, 0, 0, 0, 0, 6, 102, 102, 102, 102, 101, 255, 255, 255, 255, 255, 255, 255, 244, 255, 255, 255, 255, 255, 255, 255, 255, 54, 102, 102, 102, 102, 102, 102, 102, 102, 102, 96, 0, 0, 0, 0, 6, 102, 102, 102, 102, 101, 255, 255, 255, 255, 255, 255, 255, 255, 223, 255, 255, 255, 255, 255, 255, 178, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 96, 0, 0, 0, 0, 6, 102, 102, 102, 102, 102, 239, 255, 255, 255, 255, 255, 254, 239, 165, 255, 255, 255, 255, 255, 254, 35, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 101, 0, 0, 0, 0, 6, 102, 102, 102, 102, 102, 94, 255, 255, 255, 2, 237, 214, 102, 105, 255, 255, 255, 255, 254, 34, 54, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 7, 102, 102, 102, 102, 102, 100, 78, 255, 255, 255, 167, 102, 102, 155, 255, 239, 255, 255, 242, 35, 54, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 80, 0, 0, 0, 0, 102, 102, 102, 102, 102, 102, 64, 239, 189, 238, 255, 188, 205, 237, 214, 105, 255, 255, 184, 35, 54, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 80, 0, 0, 0, 0, 102, 102, 102, 102, 102, 102, 111, 255, 186, 170, 170, 170, 170, 198, 170, 255, 255, 255, 242, 35, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 96, 0, 0, 0, 6, 102, 102, 102, 102, 102, 102, 101, 239, 255, 255, 255, 221, 221, 102, 93, 255, 255, 242, 34, 51, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 101, 0, 0, 0, 6, 102, 102, 102, 102, 102, 102, 102, 109, 239, 255, 255, 170, 170, 170, 255, 255, 238, 34, 34, 54, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 38, 102, 102, 102, 102, 102, 102, 102, 102, 109, 255, 255, 255, 255, 255, 255, 255, 34, 34, 51, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 80, 0, 0, 6, 102, 102, 102, 102, 102, 102, 102, 102, 102, 109, 255, 255, 255, 255, 238, 226, 51, 54, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 96, 0, 0, 2, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 101, 221, 221, 214, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 101, 0, 0, 0, 134, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 118, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 101, 0, 0, 0, 6, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 235, 118, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 111, 250, 150, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 38, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 110, 255, 251, 118, 102, 102, 102, 102, 102, 102, 103, 154, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 6, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 255, 255, 255, 255, 251, 169, 121, 154, 175, 255, 255, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 6, 102, 102, 102, 102, 102, 102, 102, 102, 103, 155, 170, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 6, 102, 102, 102, 102, 102, 102, 102, 123, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 0, 0, 0, 0, 6, 102, 102, 102, 102, 102, 102, 155, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 102, 102, 102, 102, 102, 118, 102, 102, 102, 102, 0, 0, 0, 0, 6, 102, 102, 102, 102, 102, 155, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 102, 102, 102, 102, 96, 6, 102, 102, 102, 102, 0, 0, 0, 0, 6, 102, 102, 102, 102, 155, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 102, 102, 102, 102, 144, 54, 102, 102, 102, 102, 0, 0, 0, 0, 38, 102, 102, 102, 106, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 118, 102, 102, 102, 3, 102, 102, 102, 102, 102, 0, 0, 0, 51, 102, 102, 102, 105, 191, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 38, 102, 102, 102, 54, 102, 102, 102, 102, 102, 0, 3, 54, 102, 102, 102, 102, 191, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 38, 102, 102, 102, 102, 102, 102, 102, 102, 102, 3, 102, 102, 102, 102, 102, 105, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 38, 102, 102, 102, 102, 102, 102, 119, 102, 102, 102, 102, 102, 102, 102, 102, 191, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 54, 102, 102, 102, 102, 102, 128, 0, 3, 53, 102, 102, 102, 102, 102, 102, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 102, 102, 102, 105, 136, 3, 83, 102, 115, 54, 102, 102, 102, 102, 102, 100, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 242, 102, 102, 152, 53, 54, 105, 134, 102, 102, 102, 102, 102, 102, 102, 102, 101, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 246, 102, 195, 102, 105, 128, 3, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 222, 255, 255, 255, 255, 255, 239, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 102, 102, 103, 64, 0, 51, 54, 102, 102, 102, 64, 102, 102, 102, 102, 96, 38, 102, 109, 222, 239, 255, 228, 239, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 253, 214, 102, 102, 128, 51, 54, 102, 102, 102, 102, 96, 0, 102, 102, 102, 104, 0, 0, 137, 102, 102, 102, 93, 51, 221, 238, 238, 255, 255, 255, 255, 255, 255, 255, 255, 221, 102, 105, 140, 51, 102, 102, 102, 102, 102, 102, 102, 99, 144, 102, 102, 102, 128, 0, 4, 0, 8, 103, 102, 102, 102, 102, 102, 102, 102, 102, 93, 221, 221, 221, 221, 221, 102, 102, 83, 102, 102, 102, 102, 102, 102, 102, 102, 102, 54, 54, 102, 102, 102, 0, 0, 104, 0, 6, 128, 0, 2, 137, 137, 103, 118, 102, 102, 102, 102, 102, 102, 102, 102, 99, 103, 102, 102, 102, 102, 102, 102, 102, 102, 102, 99, 102, 54, 102, 102, 96, 3, 105, 128, 0, 104, 53, 0, 0, 0, 0, 128, 0, 0, 134, 103, 102, 102, 102, 102, 35, 103, 51, 102, 102, 102, 102, 102, 102, 102, 102, 104, 102, 102, 102, 102, 102, 0, 54, 128, 3, 3, 128, 96, 6, 0, 0, 0, 0, 0, 0, 6, 99, 102, 102, 102, 102, 108, 54, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 100, 0, 102, 0, 101, 8, 6, 80, 54, 0, 0, 0, 0, 0, 64, 102, 102, 102, 103, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 101, 6, 104, 6, 104, 0, 6, 67, 100, 0, 0, 101, 0, 6, 70, 102, 102, 102, 6, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 88, 102, 96, 38, 100, 0, 104, 54, 96, 0, 3, 102, 0, 56, 6, 102, 102, 131, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 96, 102, 96, 102, 96, 0, 96, 102, 101, 0, 6, 104, 0, 96, 102, 102, 102, 54, 99, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 134, 102, 80, 102, 80, 6, 147, 102, 102, 3, 102, 104, 3, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 54, 102, 5, 6, 6, 102, 100, 102, 102, 96, 6, 70, 102, 102, 99, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 96, 104, 6, 102, 102, 102, 98, 128, 104, 38, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 96, 54, 102, 102, 102, 134, 0, 99, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 54, 128, 102, 102, 102, 102, 38, 6, 54, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 54, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102, 102]
    Bitmap.new(the_bitmap, 37).render(["!", "\n", ">", "'", "<", "`", " ", ".", ";", ",", "c", "d", "-", "\"", "?", "$"]).should eq expectation
  end
end
